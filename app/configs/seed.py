from configs.db import SessionLocals
from configs.config import pwd_context
from datetime import date
import uuid
from sqlalchemy import text

def seed_common_data(db):
    """Seed data cho các bảng common (CoSo, Khoa, ...)"""
    # 1. Seed CoSo
    coso_data = [
        ("HADONG", "Cơ sở Hà Đông", "Số 10 Trần Phú, Hà Đông, Hà Nội", "024.12345678", "hadong@ptit.edu.vn"),
        ("HOALAC", "Cơ sở Hòa Lạc", "Khu công nghệ cao Hòa Lạc, Thạch Thất, Hà Nội", "024.87654321", "hoalac@ptit.edu.vn"),
        ("NGOCTRUC", "Cơ sở Ngọc Trục", "Đại Mỗ, Nam Từ Liêm, Hà Nội", "024.11112222", "ngoctruc@ptit.edu.vn")
    ]
    
    for ma, ten, dc, sdt, email in coso_data:
        check_sql = text('SELECT 1 FROM "CoSo" WHERE "MaCoSo" = :ma')
        if not db.execute(check_sql, {"ma": ma}).fetchone():
            insert_sql = text("""
                INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email")
                VALUES (:ma, :ten, :dc, :sdt, :email)
            """)
            db.execute(insert_sql, {"ma": ma, "ten": ten, "dc": dc, "sdt": sdt, "email": email})
    
    # 2. Seed Khoa (Ví dụ một số khoa cơ bản)
    khoa_data = [
        ("CNTT", "Công nghệ thông tin", "Khoa CNTT - Viện CNTT&TT"),
        ("DPT", "Đa phương tiện", "Khoa Thiết kế & Sáng tạo nội dung số"),
        ("VT", "Viễn thông", "Khoa Kỹ thuật Viễn thông")
    ]
    for ma, ten, mota in khoa_data:
        check_sql = text('SELECT 1 FROM "Khoa" WHERE "MaKhoa" = :ma')
        if not db.execute(check_sql, {"ma": ma}).fetchone():
            insert_sql = text('INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa") VALUES (:ma, :ten, :mota)')
            db.execute(insert_sql, {"ma": ma, "ten": ten, "mota": mota})
    
    db.commit()

def seed_all():
    """Seed dữ liệu cho toàn bộ các site"""
    for site, Session in SessionLocals.items():
        print(f"Seeding data for site: {site}...")
        db = Session()
        try:
            # Seed common data (CoSo, Khoa) - Mọi db đều phải có
            seed_common_data(db)
            
            # Seed Admin (Bảng users là bảng dùng chung - Replicated, nên phải seed ở tất cả các site)
            seed_admin_for_site(db)
            
        except Exception as e:
            print(f"Error seeding site {site}: {e}")
            db.rollback()
        finally:
            db.close()

def seed_admin_for_site(db):
    """Logic seed admin cho một db session cụ thể"""
    # Check if admin exists using raw SQL
    result = db.execute(text('SELECT "userId" FROM "users" WHERE "username" = \'admin\'')).fetchone()
    
    if not result:
        admin_id = str(uuid.uuid4())
        password = "admin123"
        hashed_pwd = pwd_context.hash(password)
        
        sql = text("""
            INSERT INTO "users" ("userId", "username", "password", "role", "email", "MaCoSo", "status")
            VALUES (:userId, :username, :password, :role, :email, :MaCoSo, :status)
        """)
        
        db.execute(sql, {
            "userId": admin_id,
            "username": "admin",
            "password": hashed_pwd,
            "role": "Admin",
            "email": "admin@system.com",
            "MaCoSo": "HADONG",
            "status": "Active"
        })
        db.commit()
        print("Default admin user created: admin / admin123")

if __name__ == "__main__":
    seed_all()
