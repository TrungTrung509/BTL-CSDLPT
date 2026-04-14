from sqlalchemy.orm import Session
from models.Departments import Departments

class DepartmentRepo:
    @staticmethod
    def get_by_id(db: Session, dept_id: str) -> Departments:
        return db.query(Departments).filter(Departments.id == dept_id).first()

    @staticmethod
    def get_by_maKhoa(db: Session, ma_khoa: str) -> Departments:
        return db.query(Departments).filter(Departments.maKhoa == ma_khoa).first()

    @staticmethod
    def create(db: Session, dept: Departments) -> Departments:
        db.add(dept)
        db.commit()
        db.refresh(dept)
        return dept
