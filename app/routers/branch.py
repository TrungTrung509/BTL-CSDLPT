from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session

from configs.db import get_db
from schemas.Branch import BranchCreate, BranchResponse
from services.BranchService import BranchService
from services.UserService import UserService
from models.Users import User

router = APIRouter(
    prefix="/branches",
    tags=["Branches"]
)

@router.post("/", response_model=BranchResponse, status_code=status.HTTP_201_CREATED)
async def create_branch(
    branch_in: BranchCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    return await BranchService.create_branch(db, branch_in, current_user)
