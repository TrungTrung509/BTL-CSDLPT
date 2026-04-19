from typing import Dict, Tuple

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from enums.user_role import UserRole
from models.Courses import Course
from models.Departments import Departments
from models.Users import User
from repositories.CourseRepo import CourseRepo
from enums.types import CourseType
from enums.status import CourseStatus
from schemas.Course import CourseCreate, CourseResponse, CourseUpdate


class CourseService:
    @staticmethod
    def get_all_courses(db: Session) -> Tuple[list[Course], int]:
        query = CourseRepo.base_query(db)
        total = query.count()
        items = query.order_by(Course.MaHocPhan.asc()).all()
        return items, total

    @staticmethod
    def get_course_by_id(db: Session, ma_hoc_phan: str) -> Course:
        course = CourseRepo.get_by_id(db, ma_hoc_phan)
        if not course:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Khong tim thay hoc phan voi ma: {ma_hoc_phan}",
            )
        return course

    @staticmethod
    async def create_course(course_in: CourseCreate, current_user: User) -> CourseResponse:
        CourseService._ensure_admin(current_user)
        sessions = CourseService._open_sessions()
        primary_site, primary_session = CourseService._get_primary_session(sessions)

        try:
            course_code = course_in.MaHocPhan.upper()
            department_code = course_in.MaKhoa.upper()
            CourseService._validate_course_payload(
                so_tin_chi=course_in.SoTinChi,
                so_tiet_ly_thuyet=course_in.SoTietLyThuyet,
                so_tiet_thuc_hanh=course_in.SoTietThucHanh,
                loai_hoc_phan=course_in.LoaiHocPhan,
            )

            if CourseRepo.get_by_id(primary_session, course_code):
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Ma hoc phan '{course_code}' da ton tai",
                )

            CourseService._ensure_department_exists(primary_session, department_code)

            representative = None
            for site_name, session in sessions.items():
                course = Course(
                    MaHocPhan=course_code,
                    TenHocPhan=course_in.TenHocPhan,
                    SoTinChi=course_in.SoTinChi,
                    SoTietLyThuyet=course_in.SoTietLyThuyet,
                    SoTietThucHanh=course_in.SoTietThucHanh,
                    LoaiHocPhan=course_in.LoaiHocPhan,
                    MaKhoa=department_code,
                    MoTa=course_in.MoTa,
                    TrangThai=course_in.TrangThai,
                )
                session.add(course)
                if site_name == primary_site:
                    representative = course

            for session in sessions.values():
                session.commit()

            if representative is None:
                raise HTTPException(status_code=500, detail="Distributed write failed")

            primary_session.refresh(representative)
            return CourseResponse.model_validate(representative)
        except Exception as e:
            for session in sessions.values():
                session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Distributed write failed: {str(e)}",
            )
        finally:
            CourseService._close_sessions(sessions)

    @staticmethod
    async def update_course(ma_hoc_phan: str, course_in: CourseUpdate, current_user: User) -> CourseResponse:
        CourseService._ensure_admin(current_user)
        sessions = CourseService._open_sessions()
        primary_site, primary_session = CourseService._get_primary_session(sessions)

        try:
            course_code = ma_hoc_phan.upper()
            existing = CourseRepo.get_by_id(primary_session, course_code)
            if not existing:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Khong tim thay hoc phan voi ma: {course_code}",
                )

            update_data = course_in.model_dump(exclude_unset=True)
            if "MaKhoa" in update_data and update_data["MaKhoa"]:
                update_data["MaKhoa"] = update_data["MaKhoa"].upper()
                CourseService._ensure_department_exists(primary_session, update_data["MaKhoa"])

            CourseService._validate_course_payload(
                so_tin_chi=update_data.get("SoTinChi", existing.SoTinChi),
                so_tiet_ly_thuyet=update_data.get("SoTietLyThuyet", existing.SoTietLyThuyet),
                so_tiet_thuc_hanh=update_data.get("SoTietThucHanh", existing.SoTietThucHanh),
                loai_hoc_phan=update_data.get("LoaiHocPhan", existing.LoaiHocPhan),
            )

            representative = None
            for site_name, session in sessions.items():
                course = CourseRepo.get_by_id(session, course_code)
                if not course:
                    continue
                for field, value in update_data.items():
                    setattr(course, field, value)
                if site_name == primary_site:
                    representative = course

            for session in sessions.values():
                session.commit()

            if representative is None:
                raise HTTPException(status_code=500, detail="Distributed update failed")

            primary_session.refresh(representative)
            return CourseResponse.model_validate(representative)
        except Exception as e:
            for session in sessions.values():
                session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Distributed update failed: {str(e)}",
            )
        finally:
            CourseService._close_sessions(sessions)

    @staticmethod
    async def delete_course(ma_hoc_phan: str, current_user: User) -> None:
        CourseService._ensure_admin(current_user)
        sessions = CourseService._open_sessions()
        _, primary_session = CourseService._get_primary_session(sessions)

        try:
            course_code = ma_hoc_phan.upper()
            existing = CourseRepo.get_by_id(primary_session, course_code)
            if not existing:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Khong tim thay hoc phan voi ma: {course_code}",
                )

            for session in sessions.values():
                course = CourseRepo.get_by_id(session, course_code)
                if course:
                    session.delete(course)

            for session in sessions.values():
                session.commit()
        except Exception as e:
            for session in sessions.values():
                session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Distributed delete failed: {str(e)}",
            )
        finally:
            CourseService._close_sessions(sessions)

    @staticmethod
    def _ensure_admin(current_user: User) -> None:
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can manage courses",
            )

    @staticmethod
    def _ensure_department_exists(db: Session, ma_khoa: str) -> None:
        department = db.query(Departments).filter(Departments.MaKhoa == ma_khoa).first()
        if not department:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"MaKhoa khong hop le: {ma_khoa}",
            )

    @staticmethod
    def _validate_course_payload(
        so_tin_chi: int,
        so_tiet_ly_thuyet: int,
        so_tiet_thuc_hanh: int,
        loai_hoc_phan: CourseType,
    ) -> None:
        if so_tiet_ly_thuyet == 0 and so_tiet_thuc_hanh == 0:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="Hoc phan phai co it nhat mot loai so tiet",
            )
        if so_tin_chi <= 0:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="So tin chi phai lon hon 0",
            )
        if not isinstance(loai_hoc_phan, CourseType):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"LoaiHocPhan khong hop le. Phai la {[e.value for e in CourseType]}",
            )

    @staticmethod
    def _open_sessions() -> Dict[str, Session]:
        return {site: session_factory() for site, session_factory in SessionLocals.items()}

    @staticmethod
    def _get_primary_session(sessions: Dict[str, Session]) -> tuple[str, Session]:
        primary_site, primary_session = next(iter(sessions.items()), (None, None))
        if primary_site is None or primary_session is None:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail="Khong mo duoc ket noi den bat ky site nao",
            )
        return primary_site, primary_session

    @staticmethod
    def _close_sessions(sessions: Dict[str, Session]) -> None:
        for session in sessions.values():
            session.close()
