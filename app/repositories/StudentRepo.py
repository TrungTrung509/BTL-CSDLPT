from sqlalchemy.orm import Session
from models.Students import Student
from enums.status import StudentStatus

class StudentRepo:
    @staticmethod
    def get_by_id(db: Session, student_id: int) -> Student:
        return db.query(Student).filter(Student.id == student_id).first()

    @staticmethod
    def get_by_maSV(db: Session, maSV: str) -> Student:
        return db.query(Student).filter(Student.MaSV == maSV).first()

    @staticmethod
    def get_by_coso(db: Session, maCoSo: str):
        return db.query(Student).filter(Student.MaCoSo == maCoSo.upper()).all()

    @staticmethod
    def get_by_khoa(db: Session, maKhoa: str):
        return db.query(Student).filter(Student.MaKhoa == maKhoa.upper()).all()

    @staticmethod
    def get_by_status(db: Session, status: StudentStatus):
        return db.query(Student).filter(Student.TrangThai == status).all()

    @staticmethod
    def create(db: Session, student: Student) -> Student:
        db.add(student)
        db.commit()
        db.refresh(student)
        return student

    @staticmethod
    def update(db: Session, student: Student) -> Student:
        db.commit()
        db.refresh(student)
        return student

    @staticmethod
    def delete(db: Session, student: Student) -> bool:
        db.delete(student)
        db.commit()
        return True
