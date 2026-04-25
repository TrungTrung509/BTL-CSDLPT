from datetime import datetime

from sqlalchemy import text

from configs.config import pwd_context
from configs.db import SessionLocals


def seed_common_data(db):
    """Seed common reference data."""
    branch_data = [
        (
            "HADONG",
            "Co so Ha Dong",
            "So 10 Tran Phu, Ha Dong, Ha Noi",
            "024.12345678",
            "hadong@ptit.edu.vn",
        ),
        (
            "HOALAC",
            "Co so Hoa Lac",
            "Khu cong nghe cao Hoa Lac, Thach That, Ha Noi",
            "024.87654321",
            "hoalac@ptit.edu.vn",
        ),
        (
            "NGOCTRUC",
            "Co so Ngoc Truc",
            "Dai Mo, Nam Tu Liem, Ha Noi",
            "024.11112222",
            "ngoctruc@ptit.edu.vn",
        ),
    ]

    for code, name, address, phone, email in branch_data:
        exists = text('SELECT 1 FROM "CoSo" WHERE "MaCoSo" = :code')
        if not db.execute(exists, {"code": code}).fetchone():
            insert_sql = text(
                """
                INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email")
                VALUES (:code, :name, :address, :phone, :email)
                """
            )
            db.execute(
                insert_sql,
                {
                    "code": code,
                    "name": name,
                    "address": address,
                    "phone": phone,
                    "email": email,
                },
            )

    department_data = [
        ("CNTT", "Cong nghe thong tin", "Khoa CNTT - Vien CNTT&TT"),
        ("DPT", "Da phuong tien", "Khoa Thiet ke va Sang tao noi dung so"),
        ("VT", "Vien thong", "Khoa Ky thuat Vien thong"),
    ]

    for code, name, description in department_data:
        exists = text('SELECT 1 FROM "Khoa" WHERE "MaKhoa" = :code')
        if not db.execute(exists, {"code": code}).fetchone():
            insert_sql = text(
                'INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa") VALUES (:code, :name, :description)'
            )
            db.execute(
                insert_sql,
                {"code": code, "name": name, "description": description},
            )

    db.commit()


def seed_admin(sessions):
    """Seed the default admin account on every site."""
    admin_id = "AD1"
    username = "admin"
    hashed_password = pwd_context.hash("admin123")

    for site, session_factory in sessions.items():
        db = session_factory()
        try:
            exists = text('SELECT 1 FROM "users" WHERE "username" = :username')
            if not db.execute(exists, {"username": username}).fetchone():
                insert_sql = text(
                    """
                    INSERT INTO "users" ("userId", "username", "password", "role", "email", "MaCoSo", "status", "NgayTao")
                    VALUES (:user_id, :username, :password, :role, :email, :branch_code, :status, :created_at)
                    """
                )
                db.execute(
                    insert_sql,
                    {
                        "user_id": admin_id,
                        "username": username,
                        "password": hashed_password,
                        "role": "Admin",
                        "email": "admin@system.com",
                        "branch_code": "HADONG",
                        "status": "Active",
                        "created_at": datetime.now().isoformat(),
                    },
                )
                db.commit()
                print(f"[{site}] Default admin created.")
        finally:
            db.close()


def seed_all():
    """Seed data for all sites."""
    sessions = SessionLocals

    for _, session_factory in sessions.items():
        db = session_factory()
        try:
            seed_common_data(db)
        finally:
            db.close()

    seed_admin(sessions)
    print("System initialization complete.")


if __name__ == "__main__":
    seed_all()
