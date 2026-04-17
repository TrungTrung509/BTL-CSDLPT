from typing import Dict, Tuple

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from enums.user_role import UserRole
from models.Classrooms import Classroom
from models.Schedules import Schedule
from models.Users import User
from repositories.ClassroomRepo import ClassroomRepo
from schemas.Classroom import ClassroomCreate, ClassroomResponse, ClassroomUpdate


class ClassroomService:
    @staticmethod
    def get_all_classrooms() -> Tuple[list[Classroom], int]:
        sessions = ClassroomService._open_all_sessions()
        items: list[Classroom] = []

        try:
            for session in sessions.values():
                items.extend(
                    ClassroomRepo.base_query(session)
                    .order_by(Classroom.MaCoSo.asc(), Classroom.MaPhong.asc())
                    .all()
                )
            items.sort(key=lambda item: (item.MaCoSo, item.MaPhong))
            return items, len(items)
        finally:
            ClassroomService._close_sessions(sessions)

    @staticmethod
    def get_classroom_by_id(ma_phong: str) -> Classroom:
        sessions = ClassroomService._open_all_sessions()

        try:
            _, _, classroom = ClassroomService._find_classroom_context(sessions, ma_phong)
            return classroom
        finally:
            ClassroomService._close_sessions(sessions)

    @staticmethod
    async def create_classroom(classroom_in: ClassroomCreate, current_user: User) -> ClassroomResponse:
        ClassroomService._ensure_admin(current_user)
        site = ClassroomService._normalize_site(classroom_in.MaCoSo)
        session = ClassroomService._open_session_for_site(site)

        try:
            room_code = classroom_in.MaPhong.upper()
            ClassroomService._validate_payload(
                suc_chua=classroom_in.SucChua,
                loai_phong=classroom_in.LoaiPhong,
                trang_thai=classroom_in.TrangThai,
            )
            if ClassroomRepo.get_by_id(session, room_code):
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Ma phong '{room_code}' da ton tai",
                )

            classroom = Classroom(
                MaPhong=room_code,
                TenPhong=classroom_in.TenPhong,
                ToaNha=classroom_in.ToaNha,
                Tang=classroom_in.Tang,
                SucChua=classroom_in.SucChua,
                LoaiPhong=classroom_in.LoaiPhong,
                MaCoSo=site,
                TrangThai=classroom_in.TrangThai,
            )
            session.add(classroom)
            session.commit()
            session.refresh(classroom)
            return ClassroomResponse.model_validate(classroom)
        except Exception:
            session.rollback()
            raise
        finally:
            session.close()

    @staticmethod
    async def update_classroom(ma_phong: str, classroom_in: ClassroomUpdate, current_user: User) -> ClassroomResponse:
        ClassroomService._ensure_admin(current_user)
        sessions = ClassroomService._open_all_sessions()

        try:
            _, session, classroom = ClassroomService._find_classroom_context(sessions, ma_phong)
            update_data = classroom_in.model_dump(exclude_unset=True)
            if not update_data:
                return ClassroomResponse.model_validate(classroom)

            ClassroomService._validate_payload(
                suc_chua=update_data.get("SucChua", classroom.SucChua),
                loai_phong=update_data.get("LoaiPhong", classroom.LoaiPhong),
                trang_thai=update_data.get("TrangThai", classroom.TrangThai),
            )
            ClassroomService._ensure_room_not_break_schedules(session, classroom, update_data)

            for field, value in update_data.items():
                setattr(classroom, field, value)

            session.commit()
            session.refresh(classroom)
            return ClassroomResponse.model_validate(classroom)
        except Exception:
            for current_session in sessions.values():
                current_session.rollback()
            raise
        finally:
            ClassroomService._close_sessions(sessions)

    @staticmethod
    async def delete_classroom(ma_phong: str, current_user: User) -> None:
        ClassroomService._ensure_admin(current_user)
        sessions = ClassroomService._open_all_sessions()

        try:
            _, session, classroom = ClassroomService._find_classroom_context(sessions, ma_phong)
            schedule = session.query(Schedule).filter(Schedule.MaPhong == classroom.MaPhong).first()
            if schedule:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Phong '{classroom.MaPhong}' dang duoc su dung trong lich hoc '{schedule.MaLich}'",
                )
            session.delete(classroom)
            session.commit()
        except Exception:
            for current_session in sessions.values():
                current_session.rollback()
            raise
        finally:
            ClassroomService._close_sessions(sessions)

    @staticmethod
    def _ensure_room_not_break_schedules(db: Session, classroom: Classroom, update_data: dict) -> None:
        new_capacity = update_data.get("SucChua", classroom.SucChua)
        new_status = update_data.get("TrangThai", classroom.TrangThai)
        schedules = db.query(Schedule).filter(Schedule.MaPhong == classroom.MaPhong).all()
        if new_status != "HoatDong" and schedules:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Khong the doi trang thai phong '{classroom.MaPhong}' khi da co lich hoc gan vao",
            )
        if not schedules:
            return

        from models.CourseSections import CourseSection

        for schedule in schedules:
            section = db.query(CourseSection).filter(CourseSection.MaLopHP == schedule.MaLopHP).first()
            if section and section.SiSoToiDa > new_capacity:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Suc chua moi cua phong '{classroom.MaPhong}' nho hon si so toi da cua lop '{section.MaLopHP}'",
                )

    @staticmethod
    def _find_classroom_context(sessions: Dict[str, Session], ma_phong: str) -> tuple[str, Session, Classroom]:
        room_code = ma_phong.upper()
        for site, session in sessions.items():
            classroom = ClassroomRepo.get_by_id(session, room_code)
            if classroom:
                return site, session, classroom
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Khong tim thay phong hoc voi ma: {room_code}",
        )

    @staticmethod
    def _validate_payload(suc_chua: int, loai_phong: str, trang_thai: str) -> None:
        if suc_chua <= 0:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="SucChua phai lon hon 0",
            )
        if loai_phong not in {"LyThuyet", "MayTinh", "ThiNghiem", "HoiTruong"}:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="LoaiPhong phai la LyThuyet, MayTinh, ThiNghiem hoac HoiTruong",
            )
        if trang_thai not in {"HoatDong", "BaoTri", "NgungSuDung"}:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail="TrangThai phai la HoatDong, BaoTri hoac NgungSuDung",
            )

    @staticmethod
    def _ensure_admin(current_user: User) -> None:
        role = current_user.role.value if hasattr(current_user.role, "value") else str(current_user.role)
        if role != UserRole.Admin.value:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can manage classrooms",
            )

    @staticmethod
    def _normalize_site(site: str) -> str:
        return (site or "").upper()

    @staticmethod
    def _open_all_sessions() -> Dict[str, Session]:
        return {site: session_factory() for site, session_factory in SessionLocals.items()}

    @staticmethod
    def _open_session_for_site(site: str) -> Session:
        if site not in SessionLocals:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Ma co so khong hop le: {site}",
            )
        return SessionLocals[site]()

    @staticmethod
    def _close_sessions(sessions: Dict[str, Session]) -> None:
        for session in sessions.values():
            session.close()
