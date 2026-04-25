from typing import Any, Tuple

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from enums.user_role import UserRole
from enums.types import CourseType
from models.Courses import Course
from models.Departments import Departments
from models.Users import User
from repositories.CourseRepo import CourseRepo
from schemas.Course import CourseCreate, CourseResponse, CourseUpdate
from services.FailoverService import FailoverService
from services.ReplicationService import ReplicationService


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
    async def create_course(course_in: CourseCreate, current_user: User) -> dict[str, Any]:
        CourseService._ensure_admin(current_user)
        primary_session = CourseService._open_primary_session()

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
            primary_session.add(course)
            primary_session.flush()
            events = ReplicationService.stage_course_upsert(primary_session, course)
            primary_session.commit()
            primary_session.refresh(course)

            replication = CourseService._dispatch_replication(events)
            return {
                "course": CourseResponse.model_validate(course).model_dump(),
                "replication": replication,
            }
        except Exception as e:
            primary_session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Primary write failed: {str(e)}",
            )
        finally:
            primary_session.close()

    @staticmethod
    async def update_course(
        ma_hoc_phan: str,
        course_in: CourseUpdate,
        current_user: User,
    ) -> dict[str, Any]:
        CourseService._ensure_admin(current_user)
        primary_session = CourseService._open_primary_session()

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

            for field, value in update_data.items():
                setattr(existing, field, value)

            primary_session.flush()
            events = ReplicationService.stage_course_upsert(primary_session, existing)
            primary_session.commit()
            primary_session.refresh(existing)

            replication = CourseService._dispatch_replication(events)
            return {
                "course": CourseResponse.model_validate(existing).model_dump(),
                "replication": replication,
            }
        except Exception as e:
            primary_session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Primary update failed: {str(e)}",
            )
        finally:
            primary_session.close()

    @staticmethod
    async def delete_course(ma_hoc_phan: str, current_user: User) -> dict[str, Any]:
        CourseService._ensure_admin(current_user)
        primary_session = CourseService._open_primary_session()

        try:
            course_code = ma_hoc_phan.upper()
            existing = CourseRepo.get_by_id(primary_session, course_code)
            if not existing:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Khong tim thay hoc phan voi ma: {course_code}",
                )

            events = ReplicationService.stage_course_delete(primary_session, course_code)
            primary_session.delete(existing)
            primary_session.commit()

            replication = CourseService._dispatch_replication(events)
            return {
                "course_code": course_code,
                "replication": replication,
            }
        except Exception as e:
            primary_session.rollback()
            if isinstance(e, HTTPException):
                raise e
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail=f"Primary delete failed: {str(e)}",
            )
        finally:
            primary_session.close()

    @staticmethod
    def get_replication_status() -> dict[str, Any]:
        ReplicationService.refresh_site_statuses()
        return ReplicationService.get_replication_status()

    @staticmethod
    def run_replication_recovery(target_site: str | None = None) -> dict[str, Any]:
        if target_site:
            ReplicationService.refresh_site_statuses()
        return ReplicationService.dispatch_outbox_events(target_site=target_site)

    @staticmethod
    def _dispatch_replication(events: list[Any]) -> dict[str, Any]:
        event_ids = [event.EventId for event in events]
        try:
            return ReplicationService.dispatch_outbox_events(event_ids=event_ids)
        except Exception as exc:
            return {
                "primary_site": FailoverService.get_current_primary_site(auto_failover=False),
                "attempted": len(event_ids),
                "delivered": 0,
                "pending": len(event_ids),
                "failed": 0,
                "events": [],
                "error": str(exc),
            }

    @staticmethod
    def _open_primary_session() -> Session:
        return FailoverService.open_primary_session(auto_failover=True)

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
