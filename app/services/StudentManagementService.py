from sqlalchemy.orm import Session
from sqlalchemy import or_, and_
from typing import List, Optional, Tuple
from models.Students import Student
from schemas.StudentManagement import (
    StudentCreate, StudentUpdate, StudentStatusUpdate,
    StudentResponse, StudentFilter
)
from enums.user_role import UserRole
from enums.status import StudentStatus
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
                    Student.Ten.ilike(keyword),
                    Student.Email.ilike(keyword)
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
                        Student.Ten.ilike(keyword),
                        Student.Email.ilike(keyword)
                    )
                )
        
        total = query.count()
        students = query.offset(skip).limit(limit).all()
        
        return students, total

    @staticmethod
    def get_student_by_id(db: Session, student_id: int) -> Optional[Student]:
        """Lấy sinh viên theo ID"""
        student = db.query(Student).filter(Student.id == student_id).first()
        if not student:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy sinh viên với id: {student_id}"
            )
        return student

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
        # 1. Role check
        if current_user.role != UserRole.Admin:
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

        # 3. Duplicate email check
        if student_in.Email:
            existing_email = db.query(Student).filter(
                Student.Email == student_in.Email
            ).first()
            if existing_email:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Email '{student_in.Email}' đã được sử dụng"
                )

        # 4. Validate birth date
        if student_in.NgaySinh:
            today = date.today()
            age = today.year - student_in.NgaySinh.year
            if age < 16 or age > 100:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail="Ngày sinh không hợp lệ (tuổi phải từ 16-100)"
                )

        # 5. Create
        db_student = Student(
            MaSV=student_in.MaSV,
            Ho=student_in.Ho,
            Ten=student_in.Ten,
            NgaySinh=student_in.NgaySinh,
            GioiTinh=student_in.GioiTinh,
            Email=student_in.Email,
            SoDienThoai=student_in.SoDienThoai,
            DiaChi=student_in.DiaChi,
            MaCoSo=student_in.MaCoSo.upper(),
            MaKhoa=student_in.MaKhoa,
            TrangThai=student_in.TrangThai,
            NgayNhapHoc=student_in.NgayNhapHoc
        )
        
        db.add(db_student)
        db.commit()
        db.refresh(db_student)
        return db_student

    @staticmethod
    def update_student(
        db: Session, 
        student_id: int,
        student_in: StudentUpdate,
        current_user
    ) -> Student:
        """
        Cập nhật thông tin sinh viên.
        Yêu cầu: Admin role
        """
        # 1. Role check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật sinh viên"
            )

        # 2. Get existing
        student = StudentManagementService.get_student_by_id(db, student_id)

        # 3. Update fields
        update_data = student_in.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            if field == 'MaCoSo' and value:
                value = value.upper()
            if hasattr(student, field) and value is not None:
                setattr(student, field, value)

        # 4. Email duplicate check
        if student_in.Email:
            existing = db.query(Student).filter(
                Student.Email == student_in.Email,
                Student.id != student_id
            ).first()
            if existing:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Email '{student_in.Email}' đã được sử dụng"
                )

        db.commit()
        db.refresh(student)
        return student

    @staticmethod
    def update_student_status(
        db: Session, 
        student_id: int,
        status_update: StudentStatusUpdate,
        current_user
    ) -> Student:
        """
        Cập nhật trạng thái sinh viên.
        Yêu cầu: Admin role
        """
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật trạng thái"
            )

        student = StudentManagementService.get_student_by_id(db, student_id)
        student.TrangThai = status_update.TrangThai
        
        db.commit()
        db.refresh(student)
        return student

    @staticmethod
    def delete_student(db: Session, student_id: int, current_user) -> bool:
        """Xóa sinh viên (Admin only)"""
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền xóa sinh viên"
            )

        student = StudentManagementService.get_student_by_id(db, student_id)
        db.delete(student)
        db.commit()
        return True
