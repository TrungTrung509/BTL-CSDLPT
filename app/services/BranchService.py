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
    async def create_branch(db: Session, branch_in: BranchCreate, current_user: User) -> Branch:
        # 1. Admin Check
        if current_user.role != UserRole.Admin:
            raise HTTPException(
                status_code=status.HTTP_403_FORBIDDEN,
                detail="Only Admin can create branches"
            )

        # 2. Duplicate Check
        if BranchRepo.get_by_MaCoSo(db, branch_in.MaCoSo):
            raise HTTPException(status_code=400, detail="Branch code (MaCoSo) already exists")
        
        # 3. Create
        db_branch = Branch(
            id=str(uuid.uuid4()),
            MaCoSo=branch_in.MaCoSo,
            name=branch_in.name,
            address=branch_in.address,
            phone=branch_in.phone,
            email=branch_in.email
        )
        return BranchRepo.create(db, db_branch)
