import sys
import os
from datetime import datetime

# Thêm đường dẫn gốc vào PYTHONPATH
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from configs.db import SessionLocals
from models.Users import User
from models.CourseSections import CourseSection
from enums.status import ClassSectionStatus
from models.Schedules import Schedule
from models.Enrollments import Enrollment
from models.Students import Student
from enums.user_role import UserRole
from configs.config import pwd_context

def seed_test_data():
    sites = ["HADONG", "HOALAC", "NGOCTRUC"]
    
    for site in sites:
        print(f"--- Seeding test data for site: {site} ---")
        db = SessionLocals[site]()
        try:
            # 1. Tạo Sinh viên mẫu
            prefix = "SVHD" if site == "HADONG" else ("SVHL" if site == "HOALAC" else "SVNT")
            for i in range(1, 4):
                username = f"{prefix}26CNTT00{i}"
                existing_user = db.query(User).filter(User.username == username).first()
                if not existing_user:
                    uid = f"USR_{username}"
                    user = User(
                        userId=uid,
                        username=username,
                        password=pwd_context.hash("123456"),
                        role=UserRole.SinhVien,
                        email=f"{username}@student.ptit.edu.vn",
                        MaCoSo=site,
                        status="Active"
                    )
                    db.add(user)
                    db.flush()
                    
                    student = Student(
                        MaSV=username,
                        userId=uid,
                        Ho=f"Sinh viên {site}",
                        Ten=str(i),
                        MaCoSo=site,
                        MaKhoa="CNTT"
                    )
                    db.add(student)
            
            # 2. Tạo Lớp học phần mẫu
            class_code = f"{site}_CSDLPT_01"
            existing_class = db.query(CourseSection).filter(CourseSection.MaLopHP == class_code).first()
            if not existing_class:
                new_class = CourseSection(
                    MaLopHP=class_code,
                    MaHP="CSDLPT",
                    MaHocKy="HK1-2025",
                    MaCoSo=site,
                    MaGV="GV001",
                    TenLopHP="Cơ sở dữ liệu phân tán (Nhóm 01)",
                    SiSoToiDa=40,
                    SiSoHienTai=0,
                    TrangThaiLop=ClassSectionStatus.Mo
                )
                db.add(new_class)
                db.flush()

            # 3. Tạo Lịch học mẫu
            existing_schedule = db.query(Schedule).filter(Schedule.MaLopHP == class_code).first()
            if not existing_schedule:
                new_schedule = Schedule(
                    MaLich=f"SCH_{class_code}",
                    MaLopHP=class_code,
                    MaPhong="P101",
                    ThuTrongTuan=2,
                    TietBatDau=1,
                    SoTiet=3,
                    NgayBatDau=datetime(2025, 1, 1),
                    NgayKetThuc=datetime(2025, 5, 30),
                    GhiChu="Lịch học mẫu"
                )
                db.add(new_schedule)

            # 4. Tạo Đăng ký mẫu cho sinh viên đầu tiên
            first_sv = f"{prefix}26CNTT001"
            existing_enroll = db.query(Enrollment).filter(Enrollment.userId == f"USR_{first_sv}", Enrollment.MaLopHP == class_code).first()
            if not existing_enroll:
                new_enroll = Enrollment(
                    userId=f"USR_{first_sv}",
                    MaSV=first_sv,
                    MaLopHP=class_code,
                    MaHP="CSDLPT",
                    MaHocKy="HK1-2025",
                    TrangThaiDangKy="DaDangKy"
                )
                db.add(new_enroll)
            
            db.commit()
            print(f"--- Done site: {site} ---")
        except Exception as e:
            db.rollback()
            print(f"Error seeding {site}: {e}")
        finally:
            db.close()

if __name__ == "__main__":
    seed_test_data()
