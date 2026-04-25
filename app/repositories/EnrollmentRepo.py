from sqlalchemy.orm import Session
from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from models.Courses import Course
from enums.status import EnrollmentStatus


class EnrollmentRepo:
    @staticmethod
    def get_student_enrollments(db: Session, user_id: str, ma_hoc_ky: str = None) -> list[Enrollment]:
        query = db.query(Enrollment).filter(Enrollment.userId == user_id)
        if ma_hoc_ky:
            query = query.filter(Enrollment.MaHocKy == ma_hoc_ky)
        return query.all()

    @staticmethod
    def is_already_enrolled(db: Session, user_id: str, ma_hp: str, ma_hk: str, exclude_ma_lop_hp: str = None) -> bool:
        query = db.query(Enrollment).filter(
            Enrollment.userId == user_id,
            Enrollment.MaHP == ma_hp,
            Enrollment.MaHocKy == ma_hk
        )
        if exclude_ma_lop_hp:
            query = query.filter(Enrollment.MaLopHP != exclude_ma_lop_hp)
        return query.first() is not None

    @staticmethod
    def find_active_enrollment(db: Session, user_id: str, ma_hp: str, ma_hk: str) -> Enrollment:
        """Tìm bản ghi đăng ký hiện tại của sinh viên cho một môn học cụ thể"""
        return db.query(Enrollment).filter(
            Enrollment.userId == user_id,
            Enrollment.MaHP == ma_hp,
            Enrollment.MaHocKy == ma_hk
        ).first()

    @staticmethod
    def get_student_history(db: Session, user_id: str) -> list[Enrollment]:
        return db.query(Enrollment).filter(Enrollment.userId == user_id).all()


