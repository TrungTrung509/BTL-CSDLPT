from sqlalchemy.orm import Session
from models.Students import Student

class StudentRepo:
    @staticmethod
    def get_by_maSV(db: Session, maSV: str) -> Student:
        return db.query(Student).filter(Student.maSV == maSV).first()

    @staticmethod
    def get_by_id(db: Session, user_id: str) -> Student:
        return db.query(Student).filter(Student.id == user_id).first()

    @staticmethod
    def create(db: Session, student: Student) -> Student:
        db.add(student)
        db.commit()
        db.refresh(student)
        return student
