from sqlalchemy.orm import Session
from models.Departments import Departments

class DepartmentRepo:
    @staticmethod
    def get_by_id(db: Session, MaKhoa: str) -> Departments:
        return db.query(Departments).filter(Departments.MaKhoa == MaKhoa).first()

    @staticmethod
    def get_by_MaKhoa(db: Session, MaKhoa: str) -> Departments:
        return db.query(Departments).filter(Departments.MaKhoa == MaKhoa).first()

    @staticmethod
    def create(db: Session, dept: Departments) -> Departments:
        db.add(dept)
        db.commit()
        db.refresh(dept)
        return dept
