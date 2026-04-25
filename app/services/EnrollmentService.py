from datetime import datetime, timezone
from typing import Dict, List, Tuple
from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from models.Schedules import Schedule
from models.Users import User
from models.Courses import Course
from models.EnrollmentLogs import EnrollmentLog
from enums.status import EnrollmentAction, LogStatus, EnrollmentStatus
from repositories.EnrollmentRepo import EnrollmentRepo
from repositories.ClassSectionRepo import ClassSectionRepo
from schemas.Enrollment import (
    EnrollmentCreate,
    EligibilityResponse,
    RegistrationResult,
    EnrollmentHistoryResponse
)
from services.ClassSectionService import ClassSectionService


class EnrollmentService:
    @staticmethod
    def check_eligibility(user_id: str, ma_lop_hp: str, exclude_ma_lop_hp: str = None) -> EligibilityResponse:
        sessions = EnrollmentService._open_all_sessions()
        try:
            site, session_target, section = EnrollmentService._find_section_context(sessions, ma_lop_hp)
            reasons = []

            # 1. Check if already registered for this course (bỏ qua lớp cũ nếu đang đổi lớp)
            if EnrollmentService._is_already_enrolled(sessions, user_id, section.MaHP, section.MaHocKy, exclude_ma_lop_hp):
                reasons.append(f"Sinh viên đã đăng ký học phần {section.MaHP} trong học kỳ {section.MaHocKy}")

            # 2. Check Schedule Overlap (Cross-site)
            conflicts = EnrollmentService._check_schedule_conflict(sessions, user_id, section, exclude_ma_lop_hp)
            reasons.extend(conflicts)

            # 3. Check Capacity
            if section.SiSoHienTai >= section.SiSoToiDa:
                reasons.append("Lớp học đã đầy sĩ số")

            from enums.status import ClassSectionStatus
            if section.TrangThaiLop != ClassSectionStatus.Mo:
                reasons.append(f"Lớp học đang ở trạng thái: {section.TrangThaiLop}")

            return EligibilityResponse(
                is_eligible=len(reasons) == 0,
                reasons=reasons
            )
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def register(user: User, enroll_in: EnrollmentCreate) -> RegistrationResult:
        sessions = EnrollmentService._open_all_sessions()
        try:
            # 1. Khám phá Site
            site_new, session_new, section_new = EnrollmentService._find_section_context(sessions, enroll_in.MaLopHP)
            site_home = user.MaCoSo
            session_home = sessions[site_home]

            # 2. Tìm lớp cũ của cùng môn học (Đổi lớp)
            existing_enrollment = None
            site_old = None
            session_old = None
            
            for site, s in sessions.items():
                existing = EnrollmentRepo.find_active_enrollment(s, user.userId, section_new.MaHP, section_new.MaHocKy)
                if existing:
                    existing_enrollment = existing
                    site_old = site
                    session_old = s
                    break

            # 3. Kiểm tra điều kiện
            exclude_ma_lop_hp = existing_enrollment.MaLopHP if existing_enrollment else None
            eligibility = EnrollmentService.check_eligibility(user.userId, enroll_in.MaLopHP, exclude_ma_lop_hp)
            
            if not eligibility.is_eligible:
                EnrollmentService._log_action(
                    session_home, user.userId, enroll_in.MaLopHP, section_new.MaHP, 
                    site_new, EnrollmentAction.REGISTER if not exclude_ma_lop_hp else EnrollmentAction.SWITCH,
                    LogStatus.FAILED, "; ".join(eligibility.reasons)
                )
                return RegistrationResult(
                    MaLopHP=enroll_in.MaLopHP,
                    status="Failed",
                    message="; ".join(eligibility.reasons)
                )

            # 4. Giao dịch phân tán 
            action = EnrollmentAction.REGISTER
            old_ma_lop_hp = None

            # 4a. Hủy lớp cũ nếu có
            if existing_enrollment:
                action = EnrollmentAction.SWITCH
                old_ma_lop_hp = existing_enrollment.MaLopHP
                
                section_old = session_old.query(CourseSection).filter(CourseSection.MaLopHP == old_ma_lop_hp).first()
                if section_old and section_old.SiSoHienTai > 0:
                    section_old.SiSoHienTai -= 1
                
                session_old.delete(existing_enrollment)
                session_old.flush()  # Flush DELETE truoc de tranh UniqueViolation khi INSERT lop moi
                
                # Xóa bản Log tại site home nếu khác site_old
                if site_old != site_home:
                    old_log = session_home.query(Enrollment).filter(
                        Enrollment.userId == user.userId, 
                        Enrollment.MaLopHP == old_ma_lop_hp
                    ).first()
                    if old_log:
                        session_home.delete(old_log)

            # 4b. Đăng ký lớp mới
            new_enrollment = Enrollment(
                userId=user.userId,
                MaLopHP=section_new.MaLopHP,
                MaHP=section_new.MaHP,
                MaHocKy=section_new.MaHocKy,
                GhiChu=enroll_in.GhiChu,
            )
            session_new.add(new_enrollment)
            section_new.SiSoHienTai += 1

            # 4c. Ghi Log/Bản sao tại Site Home
            if site_new != site_home:
                log_enrollment = Enrollment(
                    userId=user.userId,
                    MaLopHP=section_new.MaLopHP,
                    MaHP=section_new.MaHP,
                    MaHocKy=section_new.MaHocKy,
                    GhiChu=enroll_in.GhiChu,
                )
                session_home.add(log_enrollment)

            # Ghi Audit Log
            EnrollmentService._log_action(
                session_home, user.userId, section_new.MaLopHP, section_new.MaHP,
                site_new, action, LogStatus.SUCCESS, 
                f"Đã đổi từ {old_ma_lop_hp}" if old_ma_lop_hp else "Đăng ký mới"
            )

            # 5. Commit
            session_new.commit()
            if session_old and session_old != session_new:
                session_old.commit()
            if session_home and session_home != session_new and session_home != session_old:
                session_home.commit()

            return RegistrationResult(
                MaLopHP=section_new.MaLopHP,
                status="Success",
                message="Đổi lớp thành công" if old_ma_lop_hp else "Đăng ký thành công",
                enrollment_id=new_enrollment.MaDangKy,
                action=action.value,
                old_ma_lop_hp=old_ma_lop_hp
            )
        except Exception as e:
            for s in sessions.values(): s.rollback()
            return RegistrationResult(MaLopHP=enroll_in.MaLopHP, status="Failed", message=str(e))
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def get_history(user_id: str, ma_hoc_ky: str = None) -> List[EnrollmentHistoryResponse]:
        sessions = EnrollmentService._open_all_sessions()
        history = []
        try:
            for site, db in sessions.items():
                enrollments = EnrollmentRepo.get_student_enrollments(db, user_id, ma_hoc_ky)
                for en in enrollments:
                    if any(h.MaLopHP == en.MaLopHP for h in history):
                        continue

                    section = ClassSectionRepo.get_by_id(db, en.MaLopHP)
                    course = db.query(Course).filter(Course.MaHocPhan == section.MaHP).first() if section else None
                    history.append(EnrollmentHistoryResponse(
                        MaDangKy=en.MaDangKy,
                        MaSV=en.MaSV or "N/A",
                        MaLopHP=en.MaLopHP,
                        TenLopHP=section.TenLopHP if section else None,
                        TenHocPhan=course.TenHocPhan if course else None,
                        MaHocKy=section.MaHocKy if section else None,
                        NgayDangKy=en.NgayDangKy,
                        TrangThaiDangKy=en.TrangThaiDangKy,
                        MaCoSo=site
                    ))
            history.sort(key=lambda x: x.NgayDangKy, reverse=True)
            return history
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def cancel(user_id: str, ma_lop_hp: str, site_home: str) -> None:
        sessions = EnrollmentService._open_all_sessions()
        try:
            session_home = sessions[site_home]
            enrollment_target = None
            session_target = None
            
            for site, session in sessions.items():
                enrollment = session.query(Enrollment).filter(
                    Enrollment.userId == user_id,
                    Enrollment.MaLopHP == ma_lop_hp
                ).first()
                if enrollment:
                    section = session.query(CourseSection).filter(CourseSection.MaLopHP == ma_lop_hp).first()
                    if section:
                        enrollment_target = enrollment
                        session_target = session
                        break
            
            if not enrollment_target:
                raise HTTPException(status_code=404, detail="Không tìm thấy thông tin đăng ký")

            section = session_target.query(CourseSection).filter(CourseSection.MaLopHP == ma_lop_hp).first()
            if section and section.SiSoHienTai > 0:
                section.SiSoHienTai -= 1
            
            session_target.delete(enrollment_target)
            
            if session_target != session_home:
                log_entry = session_home.query(Enrollment).filter(
                    Enrollment.userId == user_id,
                    Enrollment.MaLopHP == ma_lop_hp
                ).first()
                if log_entry:
                    session_home.delete(log_entry)

            EnrollmentService._log_action(
                session_home, user_id, ma_lop_hp, section.MaHP if section else "Unknown",
                site_home, EnrollmentAction.CANCEL, LogStatus.SUCCESS, "Hủy đăng ký"
            )

            session_target.commit()
            if session_home != session_target:
                session_home.commit()
                
        except Exception as e:
            for s in sessions.values(): s.rollback()
            raise e
        finally:
            EnrollmentService._close_sessions(sessions)

    # --- Helpers ---

    @staticmethod
    def _log_action(db: Session, user_id: str, ma_lop_hp: str, ma_hp: str, target_site: str, action: EnrollmentAction, log_status: LogStatus, message: str = None):
        log = EnrollmentLog(
            userId=user_id,
            MaLopHP=ma_lop_hp,
            MaHP=ma_hp,
            Action=action,
            TargetSite=target_site,
            Status=log_status,
            Message=message,
            Timestamp=datetime.now(timezone.utc)
        )
        db.add(log)
        db.commit()

    @staticmethod
    def _check_schedule_conflict(sessions: Dict[str, Session], user_id: str, section: CourseSection, exclude_ma_lop_hp: str = None) -> List[str]:
        conflicts = []
        target_schedules = ClassSectionRepo.list_schedules(sessions[section.MaCoSo], section.MaLopHP)
        if not target_schedules: return []

        for target_schedule in target_schedules:
            for site, db in sessions.items():
                student_enrollments = EnrollmentRepo.get_student_enrollments(db, user_id, section.MaHocKy)
                for en in student_enrollments:
                    if en.MaLopHP == section.MaLopHP or en.MaLopHP == exclude_ma_lop_hp:
                        continue
                    en_schedules = ClassSectionRepo.list_schedules(db, en.MaLopHP)
                    for es in en_schedules:
                        if EnrollmentService._schedules_overlap(target_schedule, es):
                            conflicts.append(f"Trùng lịch với lớp {en.MaLopHP} tại {site}")

                teacher_classes = db.query(CourseSection).filter(
                    CourseSection.MaGV == section.MaGV,
                    CourseSection.MaHocKy == section.MaHocKy
                ).all()
                for tc in teacher_classes:
                    if tc.MaLopHP == section.MaLopHP or tc.MaLopHP == exclude_ma_lop_hp:
                        continue
                    tc_schedules = ClassSectionRepo.list_schedules(db, tc.MaLopHP)
                    for tcs in tc_schedules:
                        if EnrollmentService._schedules_overlap(target_schedule, tcs):
                            conflicts.append(f"Giảng viên bị trùng lịch dạy lớp {tc.MaLopHP} tại {site}")
        return list(set(conflicts))

    @staticmethod
    def _is_already_enrolled(sessions: Dict[str, Session], user_id: str, ma_hp: str, ma_hk: str, exclude_ma_lop_hp: str = None) -> bool:
        for db in sessions.values():
            if EnrollmentRepo.is_already_enrolled(db, user_id, ma_hp, ma_hk, exclude_ma_lop_hp):
                return True
        return False

    @staticmethod
    def _schedules_overlap(s1: Schedule, s2: Schedule) -> bool:
        if s1.ThuTrongTuan != s2.ThuTrongTuan: return False
        if not ClassSectionService._date_ranges_overlap(s1.NgayBatDau, s1.NgayKetThuc, s2.NgayBatDau, s2.NgayKetThuc):
            return False
        s1_end = s1.TietBatDau + s1.SoTiet - 1
        s2_end = s2.TietBatDau + s2.SoTiet - 1
        return ClassSectionService._period_ranges_overlap(s1.TietBatDau, s1_end, s2.TietBatDau, s2_end)

    @staticmethod
    def _find_section_context(sessions: Dict[str, Session], ma_lop_hp: str) -> Tuple[str, Session, CourseSection]:
        section_code = ma_lop_hp.upper()
        for site, session in sessions.items():
            section = ClassSectionRepo.get_by_id(session, section_code)
            if section: return site, session, section
        raise HTTPException(status_code=404, detail=f"Không tìm thấy lớp học phần: {section_code}")

    @staticmethod
    def _open_all_sessions() -> Dict[str, Session]:
        return {site: session_factory() for site, session_factory in SessionLocals.items()}

    @staticmethod
    def _close_sessions(sessions: Dict[str, Session]) -> None:
        for session in sessions.values(): session.close()
