from configs.db import SessionLocal
from configs.config import pwd_context
from datetime import date
import uuid
from sqlalchemy import text

def seed_admin():
    db = SessionLocal()
    try:
        # Check if admin exists using raw SQL
        result = db.execute(text("SELECT id FROM users WHERE username = 'admin'")).fetchone()
        
        if not result:
            admin_id = str(uuid.uuid4())
            # Fix for bcrypt issue: passlib with bcrypt 4.1.0+ has issues.
            # We ensure the password is a simple string. 
            # If the error persists, we might need a workaround.
            password = "admin123"
            hashed_pwd = pwd_context.hash(password)
            
            sql = text("""
                INSERT INTO users (id, username, password_hash, role, email, name, phone, date_of_birth, status)
                VALUES (:id, :username, :password_hash, :role, :email, :name, :phone, :date_of_birth, :status)
            """)
            
            db.execute(sql, {
                "id": admin_id,
                "username": "admin",
                "password_hash": hashed_pwd,
                "role": "Admin",
                "email": "admin@system.com",
                "name": "System Administrator",
                "phone": "0000000000",
                "date_of_birth": date(1990, 1, 1),
                "status": "Active"
            })
            db.commit()
            print("Default admin user created: admin / admin123")
        else:
            print("Admin user already exists.")
    except Exception as e:
        print(f"Error seeding admin: {e}")
        db.rollback()
    finally:
        db.close()

if __name__ == "__main__":
    seed_admin()
