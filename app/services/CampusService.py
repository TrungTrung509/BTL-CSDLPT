from sqlalchemy.orm import Session
from typing import List, Optional
from models.Branches import Branch
from schemas.Campus import CampusCreate, CampusUpdate
from repositories.BranchRepo import BranchRepo
from enums.user_role import UserRole
from fastapi import HTTPException, status

class CampusService:
    """
    Service xử lý nghiệp vụ Cơ sở đào tạo (CoSo).
    CoSo là dữ liệu dùng chung - write tập trung tại common-write-site,
    read có thể đọc từ local replica.
    """
    
    @staticmethod
    def get_all_campuses(db: Session) -> List[Branch]:
        """Lấy danh sách tất cả cơ sở"""
        return db.query(Branch).all()

    @staticmethod
    def get_campus_by_id(db: Session, campus_id: str) -> Branch:
        """Lấy thông tin cơ sở theo ID"""
        campus = BranchRepo.get_by_id(db, campus_id)
        if not campus:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy cơ sở với id: {campus_id}"
            )
        return campus

    @staticmethod
    def get_campus_by_macoiso(db: Session, ma_co_so: str) -> Optional[Branch]:
        """Lấy thông tin cơ sở theo MaCoSo"""
        campus = BranchRepo.get_by_MaCoSo(db, ma_co_so.upper())
        if not campus:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail=f"Không tìm thấy cơ sở với mã: {ma_co_so}"
            )
        return campus

    @staticmethod
    def create_campus(
        db: Session, 
        campus_in: CampusCreate, 
        current_user
    ) -> Branch:
        """
        Tạo mới cơ sở đào tạo.
        Yêu cầu: Admin role
        """
        # 1. Role check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền tạo cơ sở"
            )

        # 2. Duplicate MaCoSo check
        existing = BranchRepo.get_by_MaCoSo(db, campus_in.MaCoSo.upper())
        if existing:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Mã cơ sở '{campus_in.MaCoSo}' đã tồn tại"
            )

        # 3. Duplicate email check
        existing_email = db.query(Branch).filter(Branch.email == campus_in.Email).first()
        if existing_email and campus_in.Email:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail=f"Email '{campus_in.Email}' đã được sử dụng"
            )

        # 4. Create
        db_campus = Branch(
            MaCoSo=campus_in.MaCoSo.upper(),
            name=campus_in.TenCoSo,
            address=getattr(campus_in, 'DiaChi', campus_in.TenCoSo),
            phone=campus_in.SoDienThoai or "",
            email=campus_in.Email or ""
        )
        return BranchRepo.create(db, db_campus)

    @staticmethod
    def update_campus(
        db: Session, 
        campus_id: str, 
        campus_in: CampusUpdate,
        current_user
    ) -> Branch:
        """
        Cập nhật thông tin cơ sở đào tạo.
        Yêu cầu: Admin role
        """
        # 1. Role check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền cập nhật cơ sở"
            )

        # 2. Get existing
        campus = CampusService.get_campus_by_id(db, campus_id)

        # 3. Update fields
        update_data = campus_in.model_dump(exclude_unset=True)
        for field, value in update_data.items():
            if field == 'MaCoSo' and value:
                value = value.upper()
            if field == 'TenCoSo':
                field = 'name'
            if field == 'SoDienThoai':
                field = 'phone'
            if field == 'DiaChi':
                field = 'address'
            if hasattr(campus, field) and value is not None:
                setattr(campus, field, value)

        # 4. Email duplicate check
        if campus_in.Email:
            existing = db.query(Branch).filter(
                Branch.email == campus_in.Email,
                Branch.id != campus_id
            ).first()
            if existing:
                raise HTTPException(
                    status_code=status.HTTP_400_BAD_REQUEST,
                    detail=f"Email '{campus_in.Email}' đã được sử dụng"
                )

        db.commit()
        db.refresh(campus)
        return campus

    @staticmethod
    def delete_campus(db: Session, campus_id: str, current_user) -> bool:
        """Xóa cơ sở (Admin only)"""
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Chỉ Admin mới có quyền xóa cơ sở"
            )

        campus = CampusService.get_campus_by_id(db, campus_id)
        db.delete(campus)
        db.commit()
        return True
