from sqlalchemy.orm import Session
from models.Students import Student

class StudentRepo:
    @staticmethod
    def get_by_MaSV(db: Session, MaSV: str) -> Student:
        return db.query(Student).filter(Student.MaSV == MaSV).first()

    @staticmethod
    def get_by_id(db: Session, MaSV: str) -> Student:
        return db.query(Student).filter(Student.MaSV == MaSV).first()

    @staticmethod
    def get_by_userId(db: Session, userId: str) -> Student:
        return db.query(Student).filter(Student.userId == userId).first()

    @staticmethod
    def create(db: Session, student: Student) -> Student:
        db.add(student)
        db.commit()
        db.refresh(student)
        return student
