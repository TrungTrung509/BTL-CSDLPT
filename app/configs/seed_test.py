"""
seed_test.py  –  Dữ liệu test cho luồng đăng ký qua Kafka + 3PC.

Chiến lược nhân bản User:
  • Mỗi site sở hữu 10 sinh viên gốc (có bản ghi SinhVien).
  • Bản ghi users của TỪNG sinh viên được copy sang 2 site còn lại
    (không copy SinhVien) để FK  DangKy.userId → users.userId  và
    DangKy_ChuyenCoSo.userId → users.userId  không bị vi phạm khi
    đăng ký chéo cơ sở.
  • Bản ghi users của GiangVien cũng được nhân bản để FK GiangVien
    không bị vi phạm ở bước seed GiangVien.

Kịch bản test đặt ra:
  • Đăng ký cùng cơ sở  : SVHD001 (HADONG)  → lớp HADONG_CSDLPT_01
  • Đăng ký chéo cơ sở  : SVHD002 (HADONG)  → lớp HOALAC_CSDLPT_01
  • Đăng ký chéo ngược  : SVHL001 (HOALAC)  → lớp NGOCTRUC_CSDLPT_01
"""

import sys
import os
from datetime import datetime
from sqlalchemy import text

# Thêm đường dẫn gốc vào PYTHONPATH
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from configs.db import SessionLocals
from models.Users import User
from models.Students import Student
from models.Teachers import Teacher
from enums.user_role import UserRole
from enums.status import UserStatus
from configs.config import pwd_context

SITES = ["HADONG", "HOALAC", "NGOCTRUC"]

# ──────────────────────────────────────────────────────────────────
# Helpers
# ──────────────────────────────────────────────────────────────────

def _upsert_user_record(db, *, userId, username, password_hash, email, role, ma_co_so):
    """Insert user nếu chưa tồn tại, không ghi đè để tránh mất password."""
    existing = db.query(User).filter(User.userId == userId).first()
    if not existing:
        db.add(User(
            userId=userId,
            username=username,
            password=password_hash,
            email=email,
            role=role,
            MaCoSo=ma_co_so,
            status=UserStatus.Active,
        ))
        db.flush()
        return True
    return False


def _replicate_user_to_other_sites(all_sessions, home_site, userId, username, password_hash, email, role, ma_co_so):
    """Copy bản ghi users sang các site còn lại (không copy SinhVien)."""
    for site, db in all_sessions.items():
        if site == home_site:
            continue
        _upsert_user_record(
            db,
            userId=userId,
            username=username,
            password_hash=password_hash,
            email=email,
            role=role,
            ma_co_so=ma_co_so,
        )


# ──────────────────────────────────────────────────────────────────
# Main seed
# ──────────────────────────────────────────────────────────────────

def seed_test_data():
    # Mở tất cả session trước để có thể ghi nhân bản user cross-site
    all_sessions = {site: SessionLocals[site]() for site in SITES}

    try:
        # ──────────────────────────────────────────
        # BƯỚC 0: Dọn dẹp + hạ tầng cơ bản mỗi site
        # ──────────────────────────────────────────
        for site in SITES:
            db = all_sessions[site]
            print(f"\n=== [SEED] Dọn & khởi tạo hạ tầng: {site} ===")

            # 0.1 Truncate các bảng nghiệp vụ (giữ lại users để không ảnh hưởng auth)
            db.execute(text(
                'TRUNCATE "NhatKyThaoTac", "NhatKyPhucHoi", '
                '"DangKy", "DangKy_3PC", "DangKy_ChuyenCoSo", '
                '"LichHoc", "LopHocPhan", "GiangVien", "HocKy", "HocPhan" '
                'RESTART IDENTITY CASCADE'
            ))

            # Cũng xoá toàn bộ users + SinhVien để seed lại sạch
            db.execute(text('TRUNCATE "SinhVien" RESTART IDENTITY CASCADE'))
            db.execute(text('TRUNCATE "users" RESTART IDENTITY CASCADE'))
            db.commit()

            # 0.2 SiteStatus = ONLINE
            db.execute(text("""
                INSERT INTO "SiteStatus" ("SiteId", "Role", "Status", "LastHeartbeat", "UpdatedAt")
                VALUES (:site, 'PARTICIPANT', 'ONLINE', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)
                ON CONFLICT ("SiteId") DO UPDATE SET "Status" = 'ONLINE', "LastHeartbeat" = CURRENT_TIMESTAMP
            """), {"site": site})

            # 0.3 HocPhan CSDLPT
            db.execute(text("""
                INSERT INTO "HocPhan" ("MaHP","TenHP","SoTinChi","SoTietLyThuyet","SoTietThucHanh",
                                       "LoaiHocPhan","MaKhoa","TrangThai","NgayTao")
                VALUES ('CSDLPT','Cơ sở dữ liệu phân tán',3,30,15,'BatBuoc','CNTT','HoatDong',CURRENT_TIMESTAMP)
                ON CONFLICT ("MaHP") DO UPDATE SET "TenHP" = EXCLUDED."TenHP"
            """))

            # 0.4 HocKy HK1-2025
            db.execute(text("""
                INSERT INTO "HocKy" ("MaHocKy","NamHoc","KySo","NgayBatDau","NgayKetThuc","TrangThaiHocKy")
                VALUES ('HK1-2025','2024-2025',1,'2025-01-01','2025-05-30','DangHoc')
                ON CONFLICT ("MaHocKy") DO UPDATE SET "TrangThaiHocKy" = 'DangHoc'
            """))

            # 0.5 PhongHoc P101
            db.execute(text("""
                INSERT INTO "PhongHoc" ("MaPhong","TenPhong","ToaNha","Tang","SucChua",
                                        "LoaiPhong","MaCoSo","TrangThai","NgayTao")
                VALUES ('P101','Phòng 101','A1',1,60,'LyThuyet',:site,'HoatDong',CURRENT_TIMESTAMP)
                ON CONFLICT ("MaPhong") DO NOTHING
            """), {"site": site})

            db.commit()

        # ──────────────────────────────────────────
        # BƯỚC 1: Tạo GiangVien + nhân bản users GV sang tất cả site
        # ──────────────────────────────────────────
        print("\n=== [SEED] Tạo GiangVien (nhân bản users sang tất cả site) ===")

        GV_PASS = pwd_context.hash("123456")
        gv_uid = "GV001_USER"
        gv_username = "gv001"
        gv_email = "gv001@ptit.edu.vn"

        # Tạo user GV ở tất cả các site trước (để FK GiangVien thoả mãn)
        for site in SITES:
            db = all_sessions[site]
            _upsert_user_record(
                db,
                userId=gv_uid,
                username=gv_username,
                password_hash=GV_PASS,
                email=gv_email,
                role=UserRole.GiangVien,
                ma_co_so="HADONG",   # GV thuộc HADONG
            )
            db.flush()

            # GiangVien record chỉ cần ở mỗi site (vì MaCoSo theo site tương ứng)
            db.execute(text("""
                INSERT INTO "GiangVien" ("MaGV","userId","Ho","Ten","SDT","MaKhoa","MaCoSo","TrangThai","NgayTao")
                VALUES ('GV001',:uid,'Giảng viên','CSDLPT','0912345678','CNTT',:site,'DangCongTac',CURRENT_TIMESTAMP)
                ON CONFLICT ("MaGV") DO UPDATE SET "TrangThai" = 'DangCongTac'
            """), {"uid": gv_uid, "site": site})
            db.commit()

        # ──────────────────────────────────────────
        # BƯỚC 2: Tạo Sinh viên + nhân bản users sang tất cả site
        # ──────────────────────────────────────────
        print("\n=== [SEED] Tạo SinhVien + nhân bản users ===")

        SV_PASS = pwd_context.hash("123456")

        # Map prefix theo site
        prefix_map = {
            "HADONG":   "SVHD",
            "HOALAC":   "SVHL",
            "NGOCTRUC": "SVNT",
        }

        # Lưu thông tin user để nhân bản sau
        all_users_meta = []   # list of dict: {userId, username, password_hash, email, role, ma_co_so, home_site}

        for site in SITES:
            db = all_sessions[site]
            prefix = prefix_map[site]

            for i in range(1, 11):
                suffix = f"00{i}" if i < 10 else f"0{i}"
                ma_sv = f"{prefix}26CNTT{suffix}"
                username = ma_sv
                email = f"{username}@student.ptit.edu.vn"

                created = _upsert_user_record(
                    db,
                    userId=ma_sv,
                    username=username,
                    password_hash=SV_PASS,
                    email=email,
                    role=UserRole.SinhVien,
                    ma_co_so=site,
                )

                # Tạo bản ghi SinhVien (chỉ tại site gốc)
                existing_sv = db.query(Student).filter(Student.MaSV == ma_sv).first()
                if not existing_sv:
                    db.add(Student(
                        MaSV=ma_sv,
                        userId=ma_sv,
                        Ho=f"Sinh viên {site}",
                        Ten=str(i),
                        MaCoSo=site,
                        MaKhoa="CNTT",
                    ))
                    db.flush()

                all_users_meta.append({
                    "userId": ma_sv,
                    "username": username,
                    "password_hash": SV_PASS,
                    "email": email,
                    "role": UserRole.SinhVien,
                    "ma_co_so": site,
                    "home_site": site,
                })

            db.commit()
            print(f"  ✓ {site}: seeded 10 sinh viên")

        # Nhân bản users (không SinhVien) sang các site còn lại
        print("  → Nhân bản bản ghi users sang các site còn lại...")
        for meta in all_users_meta:
            _replicate_user_to_other_sites(
                all_sessions,
                home_site=meta["home_site"],
                userId=meta["userId"],
                username=meta["username"],
                password_hash=meta["password_hash"],
                email=meta["email"],
                role=meta["role"],
                ma_co_so=meta["ma_co_so"],
            )

        for site in SITES:
            all_sessions[site].commit()
            user_count = all_sessions[site].query(User).count()
            print(f"  ✓ {site}: tổng users trong DB = {user_count}")

        # ──────────────────────────────────────────
        # BƯỚC 3: Tạo LopHocPhan + LichHoc
        # ──────────────────────────────────────────
        print("\n=== [SEED] Tạo LopHocPhan & LichHoc ===")

        thu_map = {"HADONG": 2, "HOALAC": 4, "NGOCTRUC": 6}

        for site in SITES:
            db = all_sessions[site]
            thu = thu_map[site]

            class_01 = f"{site}_CSDLPT_01"
            class_02 = f"{site}_CSDLPT_02"

            for idx, (code, ten) in enumerate([(class_01, "CSDLPT Nhóm 01"), (class_02, "CSDLPT Nhóm 02")]):
                db.execute(text("""
                    INSERT INTO "LopHocPhan" ("MaLopHP","MaHP","MaHocKy","MaCoSo","MaGV",
                                              "TenLopHP","SiSoToiDa","SiSoHienTai",
                                              "HinhThucHoc","TrangThaiLop","NgayTao")
                    VALUES (:code,'CSDLPT','HK1-2025',:site,'GV001',:ten,40,0,'Offline','Mo',CURRENT_TIMESTAMP)
                    ON CONFLICT ("MaLopHP") DO UPDATE SET "TrangThaiLop" = 'Mo', "SiSoHienTai" = 0
                """), {"code": code, "site": site, "ten": ten})

                db.execute(text("""
                    INSERT INTO "LichHoc" ("MaLich","MaLopHP","MaPhong","ThuTrongTuan",
                                           "TietBatDau","SoTiet","NgayBatDau","NgayKetThuc","GhiChu")
                    VALUES (:malich,:code,'P101',:thu,1,3,'2025-01-01','2025-05-30','Lịch học mẫu')
                    ON CONFLICT ("MaLich") DO NOTHING
                """), {"malich": f"L_{code}", "code": code, "thu": thu + idx})

            db.commit()
            print(f"  ✓ {site}: 2 lớp học phần (thứ {thu}, {thu+1})")

        # ──────────────────────────────────────────
        # Tổng kết
        # ──────────────────────────────────────────
        print("\n" + "="*60)
        print("SEED HOÀN THÀNH. Tổng hợp dữ liệu:")
        for site in SITES:
            db = all_sessions[site]
            u_cnt  = db.query(User).count()
            sv_cnt = db.query(Student).count()
            print(f"  {site}: {u_cnt} users  |  {sv_cnt} SinhVien (bản gốc)")
        print("="*60)
        print("\nKịch bản test:")
        print("  [SAME-SITE]  SVHD26CNTT001  (HADONG)  → HADONG_CSDLPT_01")
        print("  [CROSS-SITE] SVHD26CNTT002  (HADONG)  → HOALAC_CSDLPT_01")
        print("  [CROSS-SITE] SVHL26CNTT001  (HOALAC)  → NGOCTRUC_CSDLPT_01")
        print("\nMật khẩu tất cả tài khoản: 123456")

    except Exception as e:
        print(f"\n[ERROR] Seed thất bại: {e}")
        for db in all_sessions.values():
            db.rollback()
        raise
    finally:
        for db in all_sessions.values():
            db.close()


if __name__ == "__main__":
    seed_test_data()
