from typing import Dict, List, Tuple

from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from enums.status import EnrollmentStatus
from models.CourseSections import CourseSection
from models.Courses import Course
from models.Enrollments import Enrollment
from models.Schedules import Schedule
from models.Users import User
from repositories.ClassSectionRepo import ClassSectionRepo
from repositories.EnrollmentRepo import EnrollmentRepo
from schemas.Enrollment import (
    EligibilityResponse,
    EnrollmentCreate,
    EnrollmentHistoryResponse,
    RegistrationResult,
)
from services.ClassSectionService import ClassSectionService
from services.Enrollment3PCService import Enrollment3PCService


class EnrollmentService:
    @staticmethod
    def check_eligibility(
        user_id: str,
        ma_lop_hp: str,
        exclude_ma_lop_hp: str = None,
    ) -> EligibilityResponse:
        sessions = EnrollmentService._open_all_sessions()
        try:
            _, _, section = EnrollmentService._find_section_context(sessions, ma_lop_hp)
            reasons = []

            if EnrollmentService._is_already_enrolled(
                sessions,
                user_id,
                section.MaHP,
                section.MaHocKy,
                exclude_ma_lop_hp,
            ):
                reasons.append(
                    f"Sinh vien da dang ky hoc phan {section.MaHP} trong hoc ky {section.MaHocKy}"
                )

            reasons.extend(
                EnrollmentService._check_schedule_conflict(
                    sessions,
                    user_id,
                    section,
                    exclude_ma_lop_hp,
                )
            )

            if section.SiSoHienTai >= section.SiSoToiDa:
                reasons.append("Lop hoc da day si so")

            from enums.status import ClassSectionStatus

            if section.TrangThaiLop != ClassSectionStatus.Mo:
                reasons.append(f"Lop hoc dang o trang thai: {section.TrangThaiLop}")

            return EligibilityResponse(
                is_eligible=len(reasons) == 0,
                reasons=reasons,
            )
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def register(user: User, enroll_in: EnrollmentCreate) -> RegistrationResult:
        return Enrollment3PCService.register(user, enroll_in)

    @staticmethod
    def get_history(user_id: str, ma_hoc_ky: str = None) -> List[EnrollmentHistoryResponse]:
        sessions = EnrollmentService._open_all_sessions()
        history = []
        try:
            for site, db in sessions.items():
                enrollments = EnrollmentRepo.get_student_enrollments(db, user_id, ma_hoc_ky)
                for enrollment in enrollments:
                    if any(item.MaLopHP == enrollment.MaLopHP for item in history):
                        continue

                    section = ClassSectionRepo.get_by_id(db, enrollment.MaLopHP)
                    course = (
                        db.query(Course).filter(Course.MaHocPhan == section.MaHP).first()
                        if section
                        else None
                    )
                    history.append(
                        EnrollmentHistoryResponse(
                            MaDangKy=enrollment.MaDangKy,
                            MaSV=enrollment.MaSV or "N/A",
                            MaLopHP=enrollment.MaLopHP,
                            TenLopHP=section.TenLopHP if section else None,
                            TenHocPhan=course.TenHocPhan if course else None,
                            MaHocKy=section.MaHocKy if section else None,
                            NgayDangKy=enrollment.NgayDangKy,
                            TrangThaiDangKy=enrollment.TrangThaiDangKy,
                            MaCoSo=site,
                        )
                    )
            history.sort(key=lambda item: item.NgayDangKy, reverse=True)
            return history
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def cancel(user_id: str, ma_lop_hp: str, site_home: str) -> None:
        Enrollment3PCService.cancel(user_id, ma_lop_hp, site_home)

    @staticmethod
    def _check_schedule_conflict(
        sessions: Dict[str, Session],
        user_id: str,
        section: CourseSection,
        exclude_ma_lop_hp: str = None,
    ) -> List[str]:
        conflicts = []
        target_schedules = ClassSectionRepo.list_schedules(sessions[section.MaCoSo], section.MaLopHP)
        if not target_schedules:
            return []

        for target_schedule in target_schedules:
            for site, db in sessions.items():
                student_enrollments = EnrollmentRepo.get_student_enrollments(db, user_id, section.MaHocKy)
                for enrollment in student_enrollments:
                    if enrollment.MaLopHP in {section.MaLopHP, exclude_ma_lop_hp}:
                        continue
                    for enrollment_schedule in ClassSectionRepo.list_schedules(db, enrollment.MaLopHP):
                        if EnrollmentService._schedules_overlap(target_schedule, enrollment_schedule):
                            conflicts.append(f"Trung lich voi lop {enrollment.MaLopHP} tai {site}")

                teacher_classes = db.query(CourseSection).filter(
                    CourseSection.MaGV == section.MaGV,
                    CourseSection.MaHocKy == section.MaHocKy,
                ).all()
                for teacher_class in teacher_classes:
                    if teacher_class.MaLopHP in {section.MaLopHP, exclude_ma_lop_hp}:
                        continue
                    for teacher_schedule in ClassSectionRepo.list_schedules(db, teacher_class.MaLopHP):
                        if EnrollmentService._schedules_overlap(target_schedule, teacher_schedule):
                            conflicts.append(f"Giang vien bi trung lich day lop {teacher_class.MaLopHP} tai {site}")

        return list(dict.fromkeys(conflicts))

    @staticmethod
    def _is_already_enrolled(
        sessions: Dict[str, Session],
        user_id: str,
        ma_hp: str,
        ma_hk: str,
        exclude_ma_lop_hp: str = None,
    ) -> bool:
        for db in sessions.values():
            if EnrollmentRepo.is_already_enrolled(db, user_id, ma_hp, ma_hk, exclude_ma_lop_hp):
                return True
        return False

    @staticmethod
    def _schedules_overlap(first_schedule: Schedule, second_schedule: Schedule) -> bool:
        if first_schedule.ThuTrongTuan != second_schedule.ThuTrongTuan:
            return False
        if not ClassSectionService._date_ranges_overlap(
            first_schedule.NgayBatDau,
            first_schedule.NgayKetThuc,
            second_schedule.NgayBatDau,
            second_schedule.NgayKetThuc,
        ):
            return False
        first_end = first_schedule.TietBatDau + first_schedule.SoTiet - 1
        second_end = second_schedule.TietBatDau + second_schedule.SoTiet - 1
        return ClassSectionService._period_ranges_overlap(
            first_schedule.TietBatDau,
            first_end,
            second_schedule.TietBatDau,
            second_end,
        )

    @staticmethod
    def _find_section_context(
        sessions: Dict[str, Session],
        ma_lop_hp: str,
    ) -> Tuple[str, Session, CourseSection]:
        section_code = ma_lop_hp.upper()
        for site, session in sessions.items():
            section = ClassSectionRepo.get_by_id(session, section_code)
            if section:
                return site, session, section
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Khong tim thay lop hoc phan: {section_code}",
        )

    @staticmethod
    def _open_all_sessions() -> Dict[str, Session]:
        return {site: session_factory() for site, session_factory in SessionLocals.items()}

    @staticmethod
    def _close_sessions(sessions: Dict[str, Session]) -> None:
        for session in sessions.values():
            session.close()
