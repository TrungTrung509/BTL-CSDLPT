from sqlalchemy.orm import Session
from models.Teachers import Teacher

class TeacherRepo:
    @staticmethod
    def get_by_maGV(db: Session, maGV: str) -> Teacher:
        return db.query(Teacher).filter(Teacher.maGV == maGV).first()

    @staticmethod
    def get_by_id(db: Session, user_id: str) -> Teacher:
        return db.query(Teacher).filter(Teacher.id == user_id).first()

    @staticmethod
    def create(db: Session, teacher: Teacher) -> Teacher:
        db.add(teacher)
        db.commit()
        db.refresh(teacher)
        return teacher
