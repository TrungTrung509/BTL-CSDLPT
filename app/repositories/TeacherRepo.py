from sqlalchemy.orm import Session
from models.Teachers import Teacher

class TeacherRepo:
    @staticmethod
    def get_by_MaGV(db: Session, MaGV: str) -> Teacher:
        return db.query(Teacher).filter(Teacher.MaGV == MaGV).first()

    @staticmethod
    def get_by_id(db: Session, MaGV: str) -> Teacher:
        return db.query(Teacher).filter(Teacher.MaGV == MaGV).first()

    @staticmethod
    def get_by_userId(db: Session, userId: str) -> Teacher:
        return db.query(Teacher).filter(Teacher.userId == userId).first()

    @staticmethod
    def create(db: Session, teacher: Teacher) -> Teacher:
        db.add(teacher)
        db.commit()
        db.refresh(teacher)
        return teacher
