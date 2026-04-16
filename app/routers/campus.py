from fastapi import APIRouter, Depends, status
from sqlalchemy.orm import Session
from typing import List, Optional

from configs.db import get_db
from schemas.Campus import CampusCreate, CampusUpdate, CampusResponse
from services.CampusService import CampusService
from services.UserService import UserService
from models.Users import User

router = APIRouter(
    prefix="/campuses",
    tags=["Campus Management"]
)

@router.get("/", response_model=List[CampusResponse])
async def get_all_campuses(
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy danh sách tất cả cơ sở đào tạo"""
    return CampusService.get_all_campuses(db)

@router.get("/{campus_id}", response_model=CampusResponse)
async def get_campus(
    campus_id: str,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy thông tin cơ sở theo ID"""
    return CampusService.get_campus_by_id(db, campus_id)

@router.post("/", response_model=CampusResponse, status_code=status.HTTP_201_CREATED)
async def create_campus(
    campus_in: CampusCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới cơ sở đào tạo (Admin only)"""
    return CampusService.create_campus(db, campus_in, current_user)

@router.put("/{campus_id}", response_model=CampusResponse)
async def update_campus(
    campus_id: str,
    campus_in: CampusUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật thông tin cơ sở (Admin only)"""
    return CampusService.update_campus(db, campus_id, campus_in, current_user)
