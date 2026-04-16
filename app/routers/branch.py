from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session
from typing import List

from configs.db import get_db
from schemas.Branch import BranchCreate, BranchUpdate, BranchResponse
from services.BranchService import BranchService
from services.UserService import UserService
from models.Users import User

router = APIRouter(
    prefix="/branches",
    tags=["Branches"]
)

@router.get("/", response_model=List[BranchResponse])
async def get_all_branches(
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy danh sách tất cả cơ sở (Branch - tên cũ)"""
    return await BranchService.get_all_branches(db)

@router.get("/{branch_id}", response_model=BranchResponse)
async def get_branch(
    branch_id: str,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy thông tin cơ sở theo ID"""
    return await BranchService.get_branch_by_id(db, branch_id)

@router.post("/", response_model=BranchResponse, status_code=status.HTTP_201_CREATED)
async def create_branch(
    branch_in: BranchCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới cơ sở (Admin only)"""
    return await BranchService.create_branch(db, branch_in, current_user)

@router.put("/{branch_id}", response_model=BranchResponse)
async def update_branch(
    branch_id: str,
    branch_in: BranchUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật thông tin cơ sở (Admin only)"""
    return await BranchService.update_branch(db, branch_id, branch_in, current_user)
