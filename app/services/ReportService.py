from sqlalchemy.orm import Session
from sqlalchemy import func
from typing import List, Dict

from configs.db import open_db_by_branch
from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from enums.status import ClassSectionStatus, EnrollmentStatus
from schemas.Report import ReportSummaryResponse, SectionSummary

class ReportService:
    @staticmethod
    def get_site_summary(site: str, ma_hk: str = None) -> ReportSummaryResponse:
        """Thống kê chi tiết cho một cơ sở"""
        with open_db_by_branch(site) as db:
            # 1. Thống kê đăng ký
            enroll_query = db.query(Enrollment).filter(Enrollment.TrangThaiDangKy == EnrollmentStatus.DaDangKy)
            if ma_hk:
                enroll_query = enroll_query.filter(Enrollment.MaHocKy == ma_hk)
            
            total_registrations = enroll_query.count()
            total_students = enroll_query.distinct(Enrollment.userId).count()

            # 2. Thống kê lớp học phần
            section_query = db.query(CourseSection).filter(CourseSection.TrangThaiLop == ClassSectionStatus.Mo)
            if ma_hk:
                section_query = section_query.filter(CourseSection.MaHocKy == ma_hk)
            
            sections_data = section_query.all()
            total_sections = len(sections_data)
            
            total_capacity = sum(s.SiSoToiDa for s in sections_data)
            total_enrolled = sum(s.SiSoHienTai for s in sections_data)
            
            # Chi tiết từng lớp
            sections_summary = []
            full_count = 0
            for s in sections_data:
                is_full = s.SiSoHienTai >= s.SiSoToiDa
                if is_full: full_count += 1
                
                sections_summary.append(SectionSummary(
                    MaLopHP=s.MaLopHP,
                    TenLopHP=s.TenLopHP,
                    MaHP=s.MaHP,
                    SiSoHienTai=s.SiSoHienTai,
                    SiSoToiDa=s.SiSoToiDa,
                    IsFull=is_full
                ))

            occupancy_rate = round((total_enrolled / total_capacity * 100), 2) if total_capacity > 0 else 0

            return ReportSummaryResponse(
                MaCoSo=site,
                MaHocKy=ma_hk,
                TotalStudents=total_students,
                TotalRegistrations=total_registrations,
                TotalSections=total_sections,
                TotalCapacity=total_capacity,
                TotalEnrolledSlots=total_enrolled,
                OccupancyRate=occupancy_rate,
                FullSectionsCount=full_count,
                Sections=sections_summary
            )

    @staticmethod
    def get_global_summary(ma_hk: str = None) -> ReportSummaryResponse:
        """Tổng hợp thống kê từ tất cả các cơ sở"""
        sites = ["HADONG", "HOALAC", "NGOCTRUC"]
        
        global_students = set() # Dùng set để đếm sinh viên duy nhất toàn trường
        total_regs = 0
        total_secs = 0
        total_cap = 0
        total_enrolled = 0
        full_count = 0
        all_sections = []

        for site in sites:
            try:
                site_report = ReportService.get_site_summary(site, ma_hk)
                
                # Lưu ý: get_site_summary trả về counts, nhưng với students chúng ta cần join IDs 
                # để tránh đếm trùng 1 SV học ở 2 cơ sở.
                # Tuy nhiên để tối ưu, nếu SV được gán cố định MaCoSo, ta có thể cộng dồn.
                # Ở đây mình sẽ lấy list userId từ từng site để union.
                with open_db_by_branch(site) as db:
                    q = db.query(Enrollment.userId).filter(Enrollment.TrangThaiDangKy == EnrollmentStatus.DaDangKy)
                    if ma_hk: q = q.filter(Enrollment.MaHocKy == ma_hk)
                    uids = [r[0] for r in q.all()]
                    global_students.update(uids)

                total_regs += site_report.TotalRegistrations
                total_secs += site_report.TotalSections
                total_cap += site_report.TotalCapacity
                total_enrolled += site_report.TotalEnrolledSlots
                full_count += site_report.FullSectionsCount
                all_sections.extend(site_report.Sections)
            except Exception as e:
                print(f"Error fetching report from {site}: {e}")

        occupancy_rate = round((total_enrolled / total_cap * 100), 2) if total_cap > 0 else 0

        return ReportSummaryResponse(
            MaCoSo="GLOBAL",
            MaHocKy=ma_hk,
            TotalStudents=len(global_students),
            TotalRegistrations=total_regs,
            TotalSections=total_secs,
            TotalCapacity=total_cap,
            TotalEnrolledSlots=total_enrolled,
            OccupancyRate=occupancy_rate,
            FullSectionsCount=full_count,
            Sections=all_sections
        )
