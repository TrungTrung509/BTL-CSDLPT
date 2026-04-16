from sqlalchemy.orm import Session
from models.Teachers import Teacher
from enums.status import TeacherStatus

class TeacherRepo:
    @staticmethod
    def get_by_id(db: Session, teacher_id: int) -> Teacher:
        return db.query(Teacher).filter(Teacher.id == teacher_id).first()

    @staticmethod
    def get_by_maGV(db: Session, maGV: str) -> Teacher:
        return db.query(Teacher).filter(Teacher.MaGV == maGV).first()

    @staticmethod
    def get_by_coso(db: Session, maCoSo: str):
        return db.query(Teacher).filter(Teacher.MaCoSo == maCoSo.upper()).all()

    @staticmethod
    def get_by_khoa(db: Session, maKhoa: str):
        return db.query(Teacher).filter(Teacher.MaKhoa == maKhoa.upper()).all()

    @staticmethod
    def get_by_status(db: Session, status: TeacherStatus):
        return db.query(Teacher).filter(Teacher.TrangThai == status).all()

    @staticmethod
    def create(db: Session, teacher: Teacher) -> Teacher:
        db.add(teacher)
        db.commit()
        db.refresh(teacher)
        return teacher

    @staticmethod
    def update(db: Session, teacher: Teacher) -> Teacher:
        db.commit()
        db.refresh(teacher)
        return teacher

    @staticmethod
    def delete(db: Session, teacher: Teacher) -> bool:
        db.delete(teacher)
        db.commit()
        return True
