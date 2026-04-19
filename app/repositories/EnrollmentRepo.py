from sqlalchemy.orm import Session
from models.Enrollments import Enrollment
from models.CourseSections import CourseSection
from models.Courses import Course
from models.Prerequisites import Prerequisite
from enums.status import EnrollmentStatus


class EnrollmentRepo:
    @staticmethod
    def get_student_enrollments(db: Session, ma_sv: str, ma_hoc_ky: str = None) -> list[Enrollment]:
        query = db.query(Enrollment).filter(Enrollment.MaSV == ma_sv)
        if ma_hoc_ky:
            query = query.filter(Enrollment.MaHocKy == ma_hoc_ky)
        return query.all()

    @staticmethod
    def is_already_enrolled(db: Session, ma_sv: str, ma_hp: str, ma_hk: str) -> bool:
        return db.query(Enrollment).filter(
            Enrollment.MaSV == ma_sv,
            Enrollment.MaHP == ma_hp,
            Enrollment.MaHocKy == ma_hk
        ).first() is not None

    @staticmethod
    def get_student_history(db: Session, ma_sv: str) -> list[Enrollment]:
        # Get all enrollments for a student, potentially across all semesters
        return db.query(Enrollment).filter(Enrollment.MaSV == ma_sv).all()

    @staticmethod
    def is_course_completed(db: Session, ma_sv: str, ma_hp: str) -> bool:
        # Check if student has a completed enrollment for this course
        return db.query(Enrollment).join(CourseSection).filter(
            Enrollment.MaSV == ma_sv,
            CourseSection.MaHP == ma_hp,
            # Assuming 'HoanThanh' or similar means completion
            Enrollment.TrangThaiDangKy == EnrollmentStatus.HoanThanh 
        ).first() is not None

    @staticmethod
    def get_prerequisites(db: Session, ma_hp: str) -> list[str]:
        # Get list of prerequisite course codes for a given course
        return [p.MaHP_TienQuyet for p in db.query(Prerequisite).filter(Prerequisite.MaHP == ma_hp).all()]
