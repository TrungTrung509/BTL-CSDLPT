import sys
import os
from datetime import datetime
from sqlalchemy import text

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

from models.Courses import Course
from models.Semesters import Semester
from models.Teachers import Teacher
from enums.types import CourseType
from enums.status import CourseStatus, SemesterStatus, TeacherStatus

def seed_test_data():
    sites = ["HADONG", "HOALAC", "NGOCTRUC"]
    
    for site in sites:
        print(f"\n--- Seeding test data for site: {site} ---")
        db = SessionLocals[site]()
        try:
            # 0. Clean ALL relevant data for a fresh start
            print("  Cleaning old data...")
            db.execute(text('TRUNCATE "NhatKyThaoTac", "NhatKyPhucHoi", "DangKy", "DangKy_3PC", "LichHoc", "LopHocPhan", "GiangVien", "HocKy", "HocPhan" RESTART IDENTITY CASCADE'))
            db.commit()

            # 0.1 Ensure Site is ONLINE
            db.execute(text("""
                INSERT INTO "SiteStatus" ("SiteId", "Role", "Status", "LastHeartbeat", "UpdatedAt")
                VALUES (:site, 'PARTICIPANT', 'ONLINE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
                ON CONFLICT ("SiteId") DO UPDATE SET "Status" = 'ONLINE', "LastHeartbeat" = CURRENT_TIMESTAMP
            """), {"site": site})
            
            # 0.5 Ensure Prerequisites (Raw SQL)
            print("  Seeding prerequisites (HocPhan, HocKy, GiangVien)...")
            
            # Course CSDLPT
            db.execute(text("""
                INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "TrangThai", "NgayTao")
                VALUES ('CSDLPT', 'Cơ sở dữ liệu phân tán', 3, 30, 15, 'BatBuoc', 'CNTT', 'HoatDong', CURRENT_TIMESTAMP)
                ON CONFLICT ("MaHP") DO UPDATE SET "TenHP" = EXCLUDED."TenHP", "TrangThai" = 'HoatDong'
            """))
            
            # Semester HK1-2025
            db.execute(text("""
                INSERT INTO "HocKy" ("MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy")
                VALUES ('HK1-2025', '2024-2025', 1, '2025-01-01', '2025-05-30', 'DangHoc')
                ON CONFLICT ("MaHocKy") DO UPDATE SET "TrangThaiHocKy" = 'DangHoc'
            """))
            
            # Teacher GV001
            teacher_uid = "GV001_USER"
            existing_t_user = db.query(User).filter(User.userId == teacher_uid).first()
            if not existing_t_user:
                t_user = User(
                    userId=teacher_uid,
                    username="gv001",
                    password=pwd_context.hash("123456"),
                    role=UserRole.GiangVien,
                    email="gv001@ptit.edu.vn",
                    MaCoSo=site,
                    status="Active"
                )
                db.add(t_user)
                db.flush()

            db.execute(text("""
                INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "SDT", "MaKhoa", "MaCoSo", "TrangThai", "NgayTao")
                VALUES ('GV001', :uid, 'Giảng viên', 'CSDLPT', '0912345678', 'CNTT', :site, 'DangCongTac', CURRENT_TIMESTAMP)
                ON CONFLICT ("MaGV") DO UPDATE SET "TrangThai" = 'DangCongTac'
            """), {"uid": teacher_uid, "site": site})
            
            db.commit()

            # 1. Sinh viên (10 SV mỗi site)
            print("  Seeding students...")
            prefix = "SVHD" if site == "HADONG" else ("SVHL" if site == "HOALAC" else "SVNT")
            for i in range(1, 11):
                suffix = f"00{i}" if i < 10 else f"0{i}"
                username = f"{prefix}26CNTT{suffix}"
                existing_user = db.query(User).filter(User.username == username).first()
                if not existing_user:
                    user = User(
                        userId=username,
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
                        userId=username,
                        Ho=f"Sinh viên {site}",
                        Ten=str(i),
                        MaCoSo=site,
                        MaKhoa="CNTT"
                    )
                    db.add(student)
            
            # 2. Lớp học phần 01 và 02
            print("  Seeding CourseSections...")
            class_code = f"{site}_CSDLPT_01"
            class_code_2 = f"{site}_CSDLPT_02"
            
            for code, ten in [(class_code, "CSDLPT Nhóm 01"), (class_code_2, "CSDLPT Nhóm 02")]:
                db.execute(text("""
                    INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
                    VALUES (:code, 'CSDLPT', 'HK1-2025', :site, 'GV001', :ten, 40, 0, 'Offline', 'Mo', CURRENT_TIMESTAMP)
                    ON CONFLICT ("MaLopHP") DO UPDATE SET "TrangThaiLop" = 'Mo'
                """), {"code": code, "site": site, "ten": ten})

            # 2.5 Phòng học P101
            db.execute(text("""
                INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
                VALUES ('P101', 'Phòng 101', 'A1', 1, 60, 'LyThuyet', :site, 'HoatDong', CURRENT_TIMESTAMP)
                ON CONFLICT ("MaPhong") DO NOTHING
            """), {"site": site})

            # 3. Lịch học
            print("  Seeding Schedules...")
            # Assign different days to different sites to prevent teacher schedule conflicts
            thu_trong_tuan = {"HADONG": 2, "HOALAC": 4, "NGOCTRUC": 6}.get(site, 2)
            
            for idx, code in enumerate([class_code, class_code_2]):
                db.execute(text("""
                    INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
                    VALUES (:malich, :code, 'P101', :thu, 1, 3, '2025-01-01', '2025-05-30', 'Lịch học mẫu')
                    ON CONFLICT ("MaLich") DO NOTHING
                """), {"malich": f"SCH_{code}", "code": code, "thu": thu_trong_tuan + idx})

            # 4. KHÔNG tạo sẵn Đăng ký (Để hệ thống Test K6 tự đăng ký ở Iteration 0)
            
            db.commit()
            print(f"--- Done site: {site} ---")
        except Exception as e:
            db.rollback()
            print(f"Error seeding {site}: {e}")
        finally:
            db.close()

if __name__ == "__main__":
    seed_test_data()
