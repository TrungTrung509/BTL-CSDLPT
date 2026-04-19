from typing import Dict, List, Tuple
from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from configs.db import SessionLocals
from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from models.Schedules import Schedule
from models.Prerequisites import Prerequisite
from models.Students import Student
from models.Users import User
from models.Courses import Course
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
    def check_eligibility(ma_sv: str, ma_lop_hp: str, ma_lich: str) -> EligibilityResponse:
        sessions = EnrollmentService._open_all_sessions()
        try:
            # 1. Find the target class section to get its site and details
            site, session_target, section = EnrollmentService._find_section_context(sessions, ma_lop_hp)
            reasons = []

            # 2. Check Prerequisites (Cross-site)
            missing_prereqs = EnrollmentService._check_prerequisites(sessions, ma_sv, section.MaHP)
            if missing_prereqs:
                reasons.append(f"Chưa hoàn thành môn tiên quyết: {', '.join(missing_prereqs)}")

            # 3. Check if already registered for this course in this semester (Cross-site)
            if EnrollmentService._is_already_enrolled(sessions, ma_sv, section.MaHP, section.MaHocKy):
                reasons.append(f"Sinh viên đã đăng ký học phần {section.MaHP} trong học kỳ {section.MaHocKy}")

            # 4. Check Schedule Overlap (Cross-site for student/teacher, local for room)
            conflicts = EnrollmentService._check_schedule_conflict(sessions, ma_sv, ma_lich, section)
            reasons.extend(conflicts)

            # 5. Check Capacity
            if section.SiSoHienTai >= section.SiSoToiDa:
                reasons.append("Lớp học đã đầy sĩ số")

            if section.TrangThaiLop != "Mo":
                reasons.append(f"Lớp học đang ở trạng thái: {section.TrangThaiLop}")

            return EligibilityResponse(
                is_eligible=len(reasons) == 0,
                reasons=reasons
            )
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def register(ma_sv: str, enroll_in: EnrollmentCreate) -> RegistrationResult:
        sessions = EnrollmentService._open_all_sessions()
        try:
            site, session, section = EnrollmentService._find_section_context(sessions, enroll_in.MaLopHP)
            
            # Ensure student is present on the target site's DB (Distributed mirroring)
            EnrollmentService._mirror_student_to_site(sessions, ma_sv, site)
            
            # Eligibility check
            eligibility = EnrollmentService.check_eligibility(ma_sv, enroll_in.MaLopHP, enroll_in.MaLich)
            if not eligibility.is_eligible:
                return RegistrationResult(
                    MaLopHP=enroll_in.MaLopHP,
                    status="Failed",
                    message="; ".join(eligibility.reasons)
                )

            # Create Enrollment record
            new_enrollment = Enrollment(
                MaSV=ma_sv,
                MaLopHP=section.MaLopHP,
                MaHP=section.MaHP,
                MaHocKy=section.MaHocKy,
                MaLich=enroll_in.MaLich,
                GhiChu=enroll_in.GhiChu,
                # Default values handled by model
            )
            session.add(new_enrollment)
            
            # Increment current occupancy
            section.SiSoHienTai += 1
            
            session.commit()
            session.refresh(new_enrollment)
            
            return RegistrationResult(
                MaLopHP=section.MaLopHP,
                status="Success",
                message="Đăng ký thành công",
                enrollment_id=new_enrollment.MaDangKy
            )
        except Exception as e:
            for current_session in sessions.values():
                current_session.rollback()
            return RegistrationResult(
                MaLopHP=enroll_in.MaLopHP,
                status="Failed",
                message=str(e)
            )
        finally:
            EnrollmentService._close_sessions(sessions)

    @staticmethod
    def get_history(ma_sv: str, ma_hoc_ky: str = None) -> List[EnrollmentHistoryResponse]:
        sessions = EnrollmentService._open_all_sessions()
        history = []
        try:
            for site, db in sessions.items():
                enrollments = EnrollmentRepo.get_student_enrollments(db, ma_sv, ma_hoc_ky)
                for en in enrollments:
                    section = ClassSectionRepo.get_by_id(db, en.MaLopHP)
                    course = db.query(Course).filter(Course.MaHocPhan == section.MaHP).first() if section else None
                    history.append(EnrollmentHistoryResponse(
                        MaDangKy=en.MaDangKy,
                        MaSV=en.MaSV,
                        MaLopHP=en.MaLopHP,
                        MaLich=en.MaLich,
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
    def cancel(ma_sv: str, ma_lich: str) -> None:
        sessions = EnrollmentService._open_all_sessions()
        try:
            # Tìm kiếm bản ghi đăng ký với MaLich xuyên suốt các site
            enrollment = None
            session_found = None
            
            for site, session in sessions.items():
                enrollment = session.query(Enrollment).filter(
                    Enrollment.MaSV == ma_sv,
                    Enrollment.MaLich == ma_lich
                ).first()
                if enrollment:
                    session_found = session
                    break
            
            if not enrollment:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail=f"Không tìm thấy thông tin đăng ký với mã lịch: {ma_lich}"
                )
                
            # Lấy thông tin lớp học phần để giảm sĩ số
            section = session_found.query(CourseSection).filter(
                CourseSection.MaLopHP == enrollment.MaLopHP
            ).first()
            
            if section and section.SiSoHienTai > 0:
                section.SiSoHienTai -= 1
                
            session_found.delete(enrollment)
            session_found.commit()
        except HTTPException as e:
            raise e
        except Exception as e:
            for current_session in sessions.values():
                current_session.rollback()
            raise HTTPException(status_code=500, detail=str(e))
        finally:
            EnrollmentService._close_sessions(sessions)

    # --- Helper Methods ---

    @staticmethod
    def _check_prerequisites(sessions: Dict[str, Session], ma_sv: str, ma_hp: str) -> List[str]:
        # Get prerequisites for this course (replicated table, use any session)
        any_session = list(sessions.values())[0]
        prereq_codes = EnrollmentRepo.get_prerequisites(any_session, ma_hp)
        
        missing = []
        for prereq_code in prereq_codes:
            # Check if student completed this prereq on ANY site
            completed = False
            for site, db in sessions.items():
                if EnrollmentRepo.is_course_completed(db, ma_sv, prereq_code):
                    completed = True
                    break
            if not completed:
                missing.append(prereq_code)
        return missing

    @staticmethod
    def _check_schedule_conflict(sessions: Dict[str, Session], ma_sv: str, ma_lich: str, section: CourseSection) -> List[str]:
        conflicts = []
        # Get target schedule
        target_schedule = ClassSectionRepo.get_schedule(sessions[section.MaCoSo], section.MaLopHP, ma_lich)
        
        if not target_schedule:
            return ["Mã lịch học không hợp lệ hoặc không thuộc lớp học phần này."]

        for site, db in sessions.items():
            # Check Student Schedule Overlap
            student_enrollments = EnrollmentRepo.get_student_enrollments(db, ma_sv, section.MaHocKy)
            for en in student_enrollments:
                en_schedules = ClassSectionRepo.list_schedules(db, en.MaLopHP)
                for es in en_schedules:
                    if EnrollmentService._schedules_overlap(target_schedule, es):
                        conflicts.append(f"Trùng lịch với lớp {en.MaLopHP} tại {site}")

            # Check Teacher Schedule Overlap
            teacher_classes = db.query(CourseSection).filter(
                CourseSection.MaGV == section.MaGV,
                CourseSection.MaHocKy == section.MaHocKy
            ).all()
            for tc in teacher_classes:
                tc_schedules = ClassSectionRepo.list_schedules(db, tc.MaLopHP)
                for tcs in tc_schedules:
                    if EnrollmentService._schedules_overlap(target_schedule, tcs):
                        # Don't conflict with current section's other schedules if it's the same teacher? 
                        # Actually teacher should be free for the target schedule.
                        if tc.MaLopHP == section.MaLopHP and tcs.MaLich == ma_lich: 
                            continue
                        conflicts.append(f"Giảng viên bị trùng lịch dạy lớp {tc.MaLopHP} tại {site}")

        return list(set(conflicts))

    @staticmethod
    def _is_already_enrolled(sessions: Dict[str, Session], ma_sv: str, ma_hp: str, ma_hk: str) -> bool:
        for site, db in sessions.items():
            if EnrollmentRepo.is_already_enrolled(db, ma_sv, ma_hp, ma_hk):
                return True
        return False

    @staticmethod
    def _mirror_student_to_site(sessions: Dict[str, Session], ma_sv: str, target_site: str):
        target_db = sessions[target_site]
        # 1. Kiểm tra xem sinh viên đã có ở site mục tiêu chưa
        if target_db.query(Student).filter(Student.MaSV == ma_sv).first():
            return

        # 2. Tìm kiếm sinh viên ở tất cả các site khác
        source_student = None
        source_site = None
        for site, db in sessions.items():
            if site == target_site: continue
            source_student = db.query(Student).filter(Student.MaSV == ma_sv).first()
            if source_student:
                source_site = site
                break
        
        if not source_student:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND, 
                detail=f"Không tìm thấy sinh viên với mã: {ma_sv} trên toàn hệ thống."
            )

        # 3. Đảm bảo User tương ứng cũng hiện diện ở site mục tiêu
        source_user = sessions[source_site].query(User).filter(User.userId == source_student.userId).first()
        if not source_user:
             raise HTTPException(status_code=404, detail="Dữ liệu User của sinh viên bị lỗi (không tìm thấy).")

        target_user = target_db.query(User).filter(User.userId == source_student.userId).first()
        if not target_user:
            # Sao chép User sang site mục tiêu
            new_user = User(
                userId=source_user.userId,
                username=source_user.username,
                password=source_user.password,
                email=source_user.email,
                role=source_user.role,
                MaCoSo=source_user.MaCoSo,
                status=source_user.status,
                NgayTao=source_user.NgayTao
            )
            target_db.add(new_user)
            target_db.flush() # Flush để đảm bảo FK sang Student hợp lệ

        # 4. Sao chép thông tin Sinh viên sang site mục tiêu
        new_student = Student(
            MaSV=source_student.MaSV,
            userId=source_student.userId,
            Ho=source_student.Ho,
            Ten=source_student.Ten,
            NgaySinh=source_student.NgaySinh,
            GioiTinh=source_student.GioiTinh,
            SDT=source_student.SDT,
            DiaChi=source_student.DiaChi,
            MaCoSo=source_student.MaCoSo,
            MaKhoa=source_student.MaKhoa,
            TrangThai=source_student.TrangThai,
            NgayNhapHoc=source_student.NgayNhapHoc,
            NgayTao=source_student.NgayTao
        )
        target_db.add(new_student)
        target_db.flush()

    @staticmethod
    def _schedules_overlap(s1: Schedule, s2: Schedule) -> bool:
        if s1.ThuTrongTuan != s2.ThuTrongTuan:
            return False
        
        # Check date overlap
        if not ClassSectionService._date_ranges_overlap(s1.NgayBatDau, s1.NgayKetThuc, s2.NgayBatDau, s2.NgayKetThuc):
            return False
            
        # Check period overlap
        s1_end = s1.TietBatDau + s1.SoTiet - 1
        s2_end = s2.TietBatDau + s2.SoTiet - 1
        return ClassSectionService._period_ranges_overlap(s1.TietBatDau, s1_end, s2.TietBatDau, s2_end)

    @staticmethod
    def _find_section_context(sessions: Dict[str, Session], ma_lop_hp: str) -> tuple[str, Session, CourseSection]:
        section_code = ma_lop_hp.upper()
        for site, session in sessions.items():
            section = ClassSectionRepo.get_by_id(session, section_code)
            if section:
                return site, session, section
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Không tìm thấy lớp học phần với mã: {section_code}",
        )

    @staticmethod
    def _open_all_sessions() -> Dict[str, Session]:
        return {site: session_factory() for site, session_factory in SessionLocals.items()}

    @staticmethod
    def _close_sessions(sessions: Dict[str, Session]) -> None:
        for session in sessions.values():
            session.close()
