from sqlalchemy.orm import Session
from sqlalchemy import or_, and_
from typing import List, Optional, Tuple
from models.Teachers import Teacher
from schemas.LecturerManagement import (
    LecturerCreate, LecturerUpdate, LecturerStatusUpdate,
    LecturerResponse, LecturerFilter
)
from enums.user_role import UserRole
from enums.status import TeacherStatus
from fastapi import HTTPException, status
from datetime import date

class LecturerManagementService:
    """
    Service xử lý nghiệp vụ Giảng viên.
    GiangVien thuộc site theo MaCoSo - đọc/ghi đúng site sở hữu.
    """
    
    VALID_DEGREES = ['CN', 'ThS', 'TS', 'PGS']
    VALID_ACADEMIC_TITLES = ['GTV', 'PGS', None]

    @staticmethod
    def get_all_lecturers(
        db: Session, 
        filters: Optional[LecturerFilter] = None,
        skip: int = 0, 
        limit: int = 20
    ) -> Tuple[List[Teacher], int]:
        """
        Lấy danh sách giảng viên với filter.
        """
        query = db.query(Teacher)
        
        if filters:
            if filters.MaCoSo:
                query = query.filter(Teacher.MaCoSo == filters.MaCoSo.upper())
            if filters.MaKhoa:
                query = query.filter(Teacher.MaKhoa == filters.MaKhoa.upper())
            if filters.TrangThai:
                query = query.filter(Teacher.TrangThai == filters.TrangThai)
            if filters.keyword:
                keyword = f"%{filters.keyword}%"
                query = query.filter(
                    or_(
                        Teacher.MaGV.ilike(keyword),
                        Teacher.Ho.ilike(keyword),
                        Teacher.Ten.ilike(keyword),
                        Teacher.Email.ilike(keyword)
                    )
                )
        
        total = query.count()
        lecturers = query.offset(skip).limit(limit).all()
        
        return lecturers, total

    @staticmethod
    def get_lecturer_by_id(db: Session, lecturer_id: int) -> Optional[Teacher]:
        """Lấy giảng viên theo ID"""
        lecturer = db.query(Teacher).filter(Teacher.id == lecturer_id).first()
        if not lecturer:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy giảng viên với id: {lecturer_id}"
            )
        return lecturer

    @staticmethod
    def get_lecturer_by_magv(db: Session, ma_gv: str) -> Optional[Teacher]:
        """Lấy giảng viên theo MaGV"""
        lecturer = db.query(Teacher).filter(Teacher.MaGV == ma_gv).first()
        if not lecturer:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy giảng viên với mã: {ma_gv}"
            )
        return lecturer

    @staticmethod
    def get_lecturers_by_coso(db: Session, ma_co_so: str) -> List[Teacher]:
        """Lấy danh sách giảng viên theo cơ sở"""
        return db.query(Teacher).filter(Teacher.MaCoSo == ma_co_so.upper()).all()

    @staticmethod
    def create_lecturer(
        db: Session, 
        lecturer_in: LecturerCreate,
        current_user
    ) -> Teacher:
        """
        Tạo mới giảng viên.
        Yêu cầu: Admin role
        """
        # 1. Role check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền tạo giảng viên"
            )

        # 2. Duplicate MaGV check
        existing = db.query(Teacher).filter(Teacher.MaGV == lecturer_in.MaGV).first()
        if existing:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Mã giảng viên '{lecturer_in.MaGV}' đã tồn tại"
            )

        # 3. Duplicate email check
        if lecturer_in.Email:
            existing_email = db.query(Teacher).filter(
                Teacher.Email == lecturer_in.Email
            ).first()
            if existing_email:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Email '{lecturer_in.Email}' đã được sử dụng"
                )

        # 4. Validate degree
        if lecturer_in.HocVi and lecturer_in.HocVi not in LecturerManagementService.VALID_DEGREES:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Học vị phải là một trong: {', '.join(LecturerManagementService.VALID_DEGREES)}"
            )

        # 5. Create
        db_lecturer = Teacher(
            MaGV=lecturer_in.MaGV,
            Ho=lecturer_in.Ho,
            Ten=lecturer_in.Ten,
            HocVi=lecturer_in.HocVi,
            HocHam=lecturer_in.HocHam,
            Email=lecturer_in.Email,
            SoDienThoai=lecturer_in.SoDienThoai,
            MaCoSo=lecturer_in.MaCoSo.upper(),
            MaKhoa=lecturer_in.MaKhoa,
            TrangThai=lecturer_in.TrangThai,
            NgayVaoLam=lecturer_in.NgayVaoLam
        )
        
        db.add(db_lecturer)
        db.commit()
        db.refresh(db_lecturer)
        return db_lecturer

    @staticmethod
    def update_lecturer(
        db: Session, 
        lecturer_id: int,
        lecturer_in: LecturerUpdate,
        current_user
    ) -> Teacher:
        """
        Cập nhật thông tin giảng viên.
        Yêu cầu: Admin role
        """
        # 1. Role check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật giảng viên"
            )

        # 2. Get existing
        lecturer = LecturerManagementService.get_lecturer_by_id(db, lecturer_id)

        # 3. Update fields
        update_data = lecturer_in.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            if field == 'MaCoSo' and value:
                value = value.upper()
            if hasattr(lecturer, field) and value is not None:
                setattr(lecturer, field, value)

        # 4. Validate degree if updating
        if lecturer_in.HocVi and lecturer_in.HocVi not in LecturerManagementService.VALID_DEGREES:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Học vị phải là một trong: {', '.join(LecturerManagementService.VALID_DEGREES)}"
            )

        # 5. Email duplicate check
        if lecturer_in.Email:
            existing = db.query(Teacher).filter(
                Teacher.Email == lecturer_in.Email,
                Teacher.id != lecturer_id
            ).first()
            if existing:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Email '{lecturer_in.Email}' đã được sử dụng"
                )

        db.commit()
        db.refresh(lecturer)
        return lecturer

    @staticmethod
    def update_lecturer_status(
        db: Session, 
        lecturer_id: int,
        status_update: LecturerStatusUpdate,
        current_user
    ) -> Teacher:
        """
        Cập nhật trạng thái giảng viên.
        Yêu cầu: Admin role
        """
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật trạng thái"
            )

        lecturer = LecturerManagementService.get_lecturer_by_id(db, lecturer_id)
        lecturer.TrangThai = status_update.TrangThai
        
        db.commit()
        db.refresh(lecturer)
        return lecturer

    @staticmethod
    def delete_lecturer(db: Session, lecturer_id: int, current_user) -> bool:
        """Xóa giảng viên (Admin only)"""
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền xóa giảng viên"
            )

        lecturer = LecturerManagementService.get_lecturer_by_id(db, lecturer_id)
        db.delete(lecturer)
        db.commit()
        return True
