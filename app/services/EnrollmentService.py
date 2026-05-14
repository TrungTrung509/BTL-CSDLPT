from datetime import datetime
from typing import List, Optional
from fastapi import HTTPException
from sqlalchemy.orm import Session

from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from models.Users import User
from models.Courses import Course
from models.Students import Student
from enums.status import EnrollmentStatus
from repositories.EnrollmentRepo import EnrollmentRepo
from repositories.ClassSectionRepo import ClassSectionRepo
from configs.db import open_db_by_branch
from schemas.Enrollment import (
    EnrollmentCreate,
    EnrollmentHistoryResponse,
    RegistrationResult,
    ScheduleResponse,
    StudentInClassResponse
)

from services.utils import _site_of


class EnrollmentService:

    @staticmethod
    def register(user: User, enroll_in: EnrollmentCreate) -> RegistrationResult:
        """Đăng ký học phần qua hệ thống phân tán 3PC."""
        from services.Enrollment3PCService import Enrollment3PCService
        return Enrollment3PCService.register(user, enroll_in)

    @staticmethod
    def cancel(user_id: str, ma_lop_hp: str, site_home: str):
        """Hủy đăng ký học phần qua hệ thống phân tán 3PC."""
        from services.Enrollment3PCService import Enrollment3PCService
        return Enrollment3PCService.cancel(user_id, ma_lop_hp, site_home)

    @staticmethod
    def swap_class(user: User, old_ma_lop_hp: str, new_ma_lop_hp: str) -> bool:
        """
        Đổi lớp học phần. 
        Sử dụng cơ chế 3PC của register (tự động phát hiện đổi lớp nếu đã có đăng ký môn này).
        """
        result = EnrollmentService.register(user, EnrollmentCreate(MaLopHP=new_ma_lop_hp))
        return result.status == "Success"

    @staticmethod
    def get_history(user_id: str, site: str, ma_hk: Optional[str] = None) -> List[EnrollmentHistoryResponse]:
        """Lấy danh sách đăng ký của sinh viên (hợp nhất tại site home)."""
        from models.EnrollmentTransfers import EnrollmentTransfer
        result = []
        with open_db_by_branch(site) as db:
            # 1. Lấy các lớp đăng ký tại chỗ
            local_enrolls = EnrollmentRepo.get_student_enrollments(db, user_id, ma_hk)
            for en in local_enrolls:
                sec = ClassSectionRepo.get_by_id(db, en.MaLopHP)
                course = db.query(Course).filter(Course.MaHocPhan == en.MaHP).first()
                result.append(EnrollmentHistoryResponse(
                    MaDangKy=en.MaDangKy,
                    MaSV=en.MaSV or "N/A",
                    MaLopHP=en.MaLopHP,
                    TenLopHP=sec.TenLopHP if sec else None,
                    TenHocPhan=course.TenHocPhan if course else None,
                    MaHocKy=en.MaHocKy,
                    NgayDangKy=en.NgayDangKy,
                    TrangThaiDangKy=en.TrangThaiDangKy,
                    MaCoSo=site,
                ))

            # 2. Lấy các lớp đăng ký liên kết (đăng ký ở site khác)
            cross_links = db.query(EnrollmentTransfer).filter(EnrollmentTransfer.userId == user_id).all()
            for link in cross_links:
                try:
                    # Lấy thông tin chi tiết từ site đích
                    with open_db_by_branch(link.TargetSite) as db_remote:
                        # Tìm thông tin đăng ký gốc tại site remote
                        remote_en = db_remote.query(Enrollment).filter(
                            Enrollment.userId == user_id,
                            Enrollment.MaLopHP == link.MaLopHP
                        ).first()
                        
                        if not remote_en: continue
                        if ma_hk and getattr(remote_en, 'MaHocKy', None) != ma_hk: continue
                        
                        sec = ClassSectionRepo.get_by_id(db_remote, link.MaLopHP)
                        course = db_remote.query(Course).filter(Course.MaHocPhan == link.MaHP).first()
                        
                        result.append(EnrollmentHistoryResponse(
                            MaDangKy=getattr(remote_en, 'MaDangKy', 0),
                            MaSV=getattr(remote_en, 'MaSV', "N/A"),
                            MaLopHP=link.MaLopHP,
                            TenLopHP=getattr(sec, 'TenLopHP', None),
                            TenHocPhan=getattr(course, 'TenHocPhan', None),
                            MaHocKy=getattr(remote_en, 'MaHocKy', "N/A"),
                            NgayDangKy=getattr(remote_en, 'NgayDangKy', datetime.utcnow()),
                            TrangThaiDangKy=getattr(remote_en, 'TrangThaiDangKy', EnrollmentStatus.DaDangKy),
                            MaCoSo=link.TargetSite,
                        ))
                except Exception:
                    continue

        return sorted(result, key=lambda x: getattr(x, 'NgayDangKy', datetime.min), reverse=True)

    @staticmethod
    def get_student_timetable(user_id: str, site: str, ma_hk: Optional[str] = None) -> List[ScheduleResponse]:
        """Lấy thời khóa biểu sinh viên (hợp nhất từ tất cả các site liên quan)."""
        from models.EnrollmentTransfers import EnrollmentTransfer
        result = []
        
        # Danh sách tất cả các lớp (cặp: MaLopHP, TargetSite)
        all_enrolls: List[tuple[str, str, str]] = [] # (MaLopHP, MaHP, Site)
        
        with open_db_by_branch(site) as db:
            # Lớp tại chỗ
            locals = EnrollmentRepo.get_student_enrollments(db, user_id, ma_hk)
            for en in locals:
                all_enrolls.append((en.MaLopHP, en.MaHP, site))
            
            # Lớp liên kết
            links = db.query(EnrollmentTransfer).filter(EnrollmentTransfer.userId == user_id).all()
            for link in links:
                all_enrolls.append((link.MaLopHP, link.MaHP, link.TargetSite))

        # Lấy lịch học cho từng lớp
        for ma_lop_hp, ma_hp, site_target in all_enrolls:
            with open_db_by_branch(site_target) as db_target:
                # Kiểm tra học kỳ nếu có lọc
                if ma_hk:
                    sec_check = ClassSectionRepo.get_by_id(db_target, ma_lop_hp)
                    if not sec_check or sec_check.MaHocKy != ma_hk:
                        continue
                
                course = db_target.query(Course).filter(Course.MaHocPhan == ma_hp).first()
                schedules = ClassSectionRepo.list_schedules(db_target, ma_lop_hp)
                for sch in schedules:
                    result.append(ScheduleResponse(
                        MaLich=sch.MaLich,
                        MaLopHP=sch.MaLopHP,
                        MaHP=ma_hp,
                        TenHocPhan=course.TenHocPhan if course else None,
                        MaPhong=sch.MaPhong,
                        ThuTrongTuan=sch.ThuTrongTuan,
                        TietBatDau=sch.TietBatDau,
                        SoTiet=sch.SoTiet,
                        NgayBatDau=sch.NgayBatDau,
                        NgayKetThuc=sch.NgayKetThuc,
                        GhiChu=sch.GhiChu
                    ))
        return result

    @staticmethod
    def get_students_by_class(ma_lop_hp: str) -> List[StudentInClassResponse]:
        """Lấy danh sách sinh viên trong lớp."""
        site = _site_of(ma_lop_hp)
        result = []
        with open_db_by_branch(site) as db:
            enrolls = ClassSectionRepo.list_enrollments(db, ma_lop_hp)
            for en in enrolls:
                student = db.query(Student).filter(Student.userId == en.userId).first()
                if student:
                    result.append(StudentInClassResponse(
                        MaSV=student.MaSV,
                        Ho=student.Ho,
                        Ten=student.Ten,
                        NgaySinh=student.NgaySinh,
                        GioiTinh=student.GioiTinh,
                        NgayDangKy=en.NgayDangKy,
                        TrangThaiDangKy=en.TrangThaiDangKy
                    ))
        return result
