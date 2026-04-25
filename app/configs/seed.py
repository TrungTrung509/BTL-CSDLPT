import uuid
from datetime import datetime

from sqlalchemy import text

from configs.config import pwd_context
from configs.db import SessionLocals


def seed_common_data(db):
    """Seed data cho các bảng common (CoSo, Khoa)"""
    # 1. Seed CoSo
    coso_data = [
        (
            "HADONG",
            "Cơ sở Hà Đông",
            "Số 10 Trần Phú, Hà Đông, Hà Nội",
            "024.12345678",
            "hadong@ptit.edu.vn",
        ),
        (
            "HOALAC",
            "Cơ sở Hòa Lạc",
            "Khu công nghệ cao Hòa Lạc, Thạch Thất, Hà Nội",
            "024.87654321",
            "hoalac@ptit.edu.vn",
        ),
        (
            "NGOCTRUC",
            "Cơ sở Ngọc Trục",
            "Đại Mỗ, Nam Từ Liêm, Hà Nội",
            "024.11112222",
            "ngoctruc@ptit.edu.vn",
        ),
    ]

    for ma, ten, dc, sdt, email in coso_data:
        check_sql = text('SELECT 1 FROM "CoSo" WHERE "MaCoSo" = :ma')
        if not db.execute(check_sql, {"ma": ma}).fetchone():
            insert_sql = text("""
                INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email")
                VALUES (:ma, :ten, :dc, :sdt, :email)
            """)
            db.execute(
                insert_sql, {"ma": ma, "ten": ten, "dc": dc, "sdt": sdt, "email": email}
            )

    # 2. Seed Khoa
    khoa_data = [
        ("CNTT", "Công nghệ thông tin", "Khoa CNTT - Viện CNTT&TT"),
        ("DPT", "Đa phương tiện", "Khoa Thiết kế & Sáng tạo nội dung số"),
        ("VT", "Viễn thông", "Khoa Kỹ thuật Viễn thông"),
    ]
    for ma, ten, mota in khoa_data:
        check_sql = text('SELECT 1 FROM "Khoa" WHERE "MaKhoa" = :ma')
        if not db.execute(check_sql, {"ma": ma}).fetchone():
            insert_sql = text(
                'INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa") VALUES (:ma, :ten, :mota)'
            )
            db.execute(insert_sql, {"ma": ma, "ten": ten, "mota": mota})

    db.commit()


def seed_admin(sessions):
    """Seed tài khoản Admin đồng bộ trên tất cả các site"""
    admin_id = "AD1"
    username = "admin"
    password = "admin123"
    hashed_pwd = pwd_context.hash(password)

    for site, db in sessions.items():
        # Kiểm tra xem admin đã tồn tại chưa
        check_sql = text('SELECT 1 FROM users WHERE "userId" = :id OR username = :uname')
        if not db.execute(check_sql, {"id": admin_id, "uname": username}).fetchone():
            insert_sql = text("""
                INSERT INTO users ("userId", username, password, role, "MaCoSo", status, "NgayTao")
                VALUES (:id, :uname, :pwd, :role, :coso, :status, :date)
            """)
            db.execute(insert_sql, {
                "id": admin_id,
                "uname": username,
                "pwd": hashed_pwd,
                "role": "Admin",
                "coso": "HADONG",
                "status": "Active",
                "date": datetime.now().isoformat()
            })
            db.commit()
            print(f"Seeded admin '{username}' on site {site}")
    for site, Session in sessions.items():
        db = Session()
        try:
            check_sql = text('SELECT 1 FROM "users" WHERE "username" = :username')
            if not db.execute(check_sql, {"username": username}).fetchone():
                sql = text("""
                    INSERT INTO "users" ("userId", "username", "password", "role", "email", "MaCoSo", "status", "NgayTao")
                    VALUES (:userId, :username, :password, :role, :email, :MaCoSo, :status, :NgayTao)
                """)
                db.execute(
                    sql,
                    {
                        "userId": admin_id,
                        "username": username,
                        "password": hashed_pwd,
                        "role": "Admin",
                        "email": "admin@system.com",
                        "MaCoSo": "HADONG",
                        "status": "Active",
                        "NgayTao": datetime.now().isoformat(),
                    },
                )
                db.commit()
                print(f"[{site}] Default admin created.")
        finally:
            db.close()


def seed_all():
    """Seed dữ liệu khởi tạo cho toàn bộ các site"""
    sessions = SessionLocals

    # 1. Seed Common Data (CoSo, Khoa)
    for site, Session in sessions.items():
        db = Session()
        try:
            seed_common_data(db)
        finally:
            db.close()

    # 2. Seed Admin (Distributed)
    seed_admin(sessions)

    print("System initialization complete.")


if __name__ == "__main__":
    seed_all()
