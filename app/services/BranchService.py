import uuid
from fastapi import HTTPException, status
from sqlalchemy.orm import Session

from models.Users import User
from models.Branches import Branch
from schemas.Branch import BranchCreate
from repositories.BranchRepo import BranchRepo
from enums.user_role import UserRole

class BranchService:
    @staticmethod
    def get_by_MaCoSo(db: Session, MaCoSo: str) -> Branch:
        branch = BranchRepo.get_by_MaCoSo(db, MaCoSo)
        if not branch:
            raise HTTPException(status_code=404, detail="Branch not found")
        return branch

    @staticmethod
    async def create_branch(db: Session, branch_in: BranchCreate, current_user: User) -> Branch:
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can create branches"
            )

        if BranchRepo.get_by_MaCoSo(db, branch_in.MaCoSo):
            raise HTTPException(status_code=400, detail="Branch with this MaCoSo already exists")
        
        db_branch = Branch(
            MaCoSo=branch_in.MaCoSo,
            TenCoSo=branch_in.TenCoSo,
            DiaChi=branch_in.DiaChi,
            SoDienThoai=branch_in.SoDienThoai,
            Email=branch_in.Email,
            NgayThanhLap=branch_in.NgayThanhLap,
            TrangThai=branch_in.TrangThai
        )
        return BranchRepo.create(db, db_branch)
