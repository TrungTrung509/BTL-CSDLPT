from typing import Optional

from sqlalchemy.orm import Query, Session

from models.Classrooms import Classroom


class ClassroomRepo:
    @staticmethod
    def base_query(db: Session) -> Query:
        return db.query(Classroom)

    @staticmethod
    def get_by_id(db: Session, ma_phong: str) -> Optional[Classroom]:
        return db.query(Classroom).filter(Classroom.MaPhong == ma_phong).first()
