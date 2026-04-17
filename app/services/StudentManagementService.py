from sqlalchemy.orm import Session
from sqlalchemy import or_, and_
from typing import List, Optional, Tuple
from models.Students import Student
from schemas.StudentManagement import (
    StudentCreate, StudentUpdate, StudentStatusUpdate,
    StudentResponse, StudentFilter
)
from fastapi import HTTPException, status
from datetime import date

class StudentManagementService:
    """
    Service xử lý nghiệp vụ Sinh viên.
    SinhVien thuộc site theo MaCoSo - đọc/ghi đúng site sở hữu.
    """

    @staticmethod
    def _build_filter_query(db: Session, filters: StudentFilter):
        """Build filter query từ filter params"""
        query = db.query(Student)

        if filters.MaCoSo:
            query = query.filter(Student.MaCoSo == filters.MaCoSo.upper())

        if filters.MaKhoa:
            query = query.filter(Student.MaKhoa == filters.MaKhoa.upper())

        if filters.TrangThai:
            query = query.filter(Student.TrangThai == filters.TrangThai)

        if filters.keyword:
            keyword = f"%{filters.keyword}%"
            query = query.filter(
                or_(
                    Student.MaSV.ilike(keyword),
                    Student.Ho.ilike(keyword),
                    Student.Ten.ilike(keyword)
                )
            )

        return query

    @staticmethod
    def get_all_students(
        db: Session,
        filters: Optional[StudentFilter] = None,
        skip: int = 0,
        limit: int = 20
    ) -> Tuple[List[Student], int]:
        """
        Lấy danh sách sinh viên với filter.
        """
        query = db.query(Student)

        if filters:
            if filters.MaCoSo:
                query = query.filter(Student.MaCoSo == filters.MaCoSo.upper())
            if filters.MaKhoa:
                query = query.filter(Student.MaKhoa == filters.MaKhoa.upper())
            if filters.TrangThai:
                query = query.filter(Student.TrangThai == filters.TrangThai)
            if filters.keyword:
                keyword = f"%{filters.keyword}%"
                query = query.filter(
                    or_(
                        Student.MaSV.ilike(keyword),
                        Student.Ho.ilike(keyword),
                        Student.Ten.ilike(keyword)
                    )
                )
        offset = skip * limit
        total = query.count()
        students = query.offset(offset).limit(limit).all()

        return students, total

    @staticmethod
    def get_student_by_masv(db: Session, ma_sv: str) -> Optional[Student]:
        """Lấy sinh viên theo MaSV"""
        student = db.query(Student).filter(Student.MaSV == ma_sv).first()
        if not student:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy sinh viên với mã: {ma_sv}"
            )
        return student

    @staticmethod
    def get_student_by_userid(db: Session, user_id: str) -> Optional[Student]:
        """Lấy sinh viên theo userId"""
        student = db.query(Student).filter(Student.userId == user_id).first()
        if not student:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy sinh viên với userId: {user_id}"
            )
        return student

    @staticmethod
    def get_students_by_coso(db: Session, ma_co_so: str) -> List[Student]:
        """Lấy danh sách sinh viên theo cơ sở"""
        return db.query(Student).filter(Student.MaCoSo == ma_co_so.upper()).all()

    @staticmethod
    def create_student(
        db: Session,
        student_in: StudentCreate,
        current_user
    ) -> Student:
        """
        Tạo mới sinh viên.
        Yêu cầu: Admin role
        """
        # 1. Role check (assumes current_user.role is string)
        if getattr(current_user, 'role', None) != 'Admin':
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền tạo sinh viên"
            )

        # 2. Duplicate MaSV check
        existing = db.query(Student).filter(Student.MaSV == student_in.MaSV).first()
        if existing:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Mã sinh viên '{student_in.MaSV}' đã tồn tại"
            )

        # 3. Duplicate userId check
        if student_in.userId:
            existing_user = db.query(Student).filter(Student.userId == student_in.userId).first()
            if existing_user:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"UserId '{student_in.userId}' đã được liên kết với sinh viên khác"
                )

        # 4. Create
        db_student = Student(
            MaSV=student_in.MaSV,
            userId=student_in.userId,
            Ho=student_in.Ho,
            Ten=student_in.Ten,
            NgaySinh=student_in.NgaySinh,
            GioiTinh=student_in.GioiTinh,
            SDT=student_in.SDT,
            DiaChi=student_in.DiaChi,
            MaCoSo=student_in.MaCoSo.upper(),
            MaKhoa=student_in.MaKhoa,
            TrangThai=student_in.TrangThai or 'DangHoc',
            NgayNhapHoc=student_in.NgayNhapHoc
        )

        db.add(db_student)
        db.commit()
        db.refresh(db_student)
        return db_student

    @staticmethod
    def update_student(
        db: Session,
        ma_sv: str,
        student_in: StudentUpdate,
        current_user
    ) -> Student:
        """
        Cập nhật thông tin sinh viên.
        Yêu cầu: Admin role
        """
        # 1. Role check
        if getattr(current_user, 'role', None) != 'Admin':
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật sinh viên"
            )

        # 2. Get existing
        student = StudentManagementService.get_student_by_masv(db, ma_sv)

        # 3. Update fields
        update_data = student_in.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            if field == 'MaCoSo' and value:
                value = value.upper()
            if hasattr(student, field) and value is not None:
                setattr(student, field, value)

        db.commit()
        db.refresh(student)
        return student

    @staticmethod
    def update_student_status(
        db: Session,
        ma_sv: str,
        status_update: StudentStatusUpdate,
        current_user
    ) -> Student:
        """
        Cập nhật trạng thái sinh viên.
        Yêu cầu: Admin role
        """
        if getattr(current_user, 'role', None) != 'Admin':
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật trạng thái"
            )

        student = StudentManagementService.get_student_by_masv(db, ma_sv)
        student.TrangThai = status_update.TrangThai

        db.commit()
        db.refresh(student)
        return student

    @staticmethod
    def delete_student(db: Session, ma_sv: str, current_user) -> bool:
        """Xóa sinh viên (Admin only)"""
        if getattr(current_user, 'role', None) != 'Admin':
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền xóa sinh viên"
            )

        student = StudentManagementService.get_student_by_masv(db, ma_sv)
        db.delete(student)
        db.commit()
        return True
