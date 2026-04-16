from fastapi import APIRouter, Depends, status, Query
from sqlalchemy.orm import Session
from typing import List, Optional

from configs.db import get_db
from schemas.LecturerManagement import (
    LecturerCreate, LecturerUpdate, LecturerStatusUpdate,
    LecturerResponse, LecturerFilter
)
from services.LecturerManagementService import LecturerManagementService
from services.UserService import UserService
from models.Users import User
from enums.status import TeacherStatus

router = APIRouter(
    prefix="/lecturers",
    tags=["Lecturer Management"]
)

@router.get("/", response_model=List[LecturerResponse])
async def get_all_lecturers(
    maCoSo: Optional[str] = Query(None, description="Lọc theo mã cơ sở"),
    maKhoa: Optional[str] = Query(None, description="Lọc theo mã khoa"),
    trangThai: Optional[TeacherStatus] = Query(None, description="Lọc theo trạng thái"),
    keyword: Optional[str] = Query(None, description="Tìm kiếm theo mã, họ tên"),
    skip: int = Query(0, ge=0, description="Số bản ghi bỏ qua"),
    limit: int = Query(20, ge=1, le=100, description="Số bản ghi lấy"),
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """
    Lấy danh sách giảng viên với các filter.
    - maCoSo: Lọc theo cơ sở quản lý
    - maKhoa: Lọc theo khoa
    - trangThai: Lọc theo trạng thái (Active, OnLeave, Resigned)
    - keyword: Tìm kiếm theo mã giảng viên, họ tên, email
    """
    filters = LecturerFilter(
        MaCoSo=maCoSo,
        MaKhoa=maKhoa,
        TrangThai=trangThai,
        keyword=keyword
    )
    lecturers, total = LecturerManagementService.get_all_lecturers(db, filters, skip, limit)
    return lecturers

@router.get("/{lecturer_id}", response_model=LecturerResponse)
async def get_lecturer(
    lecturer_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy thông tin giảng viên theo ID"""
    return LecturerManagementService.get_lecturer_by_id(db, lecturer_id)

@router.post("/", response_model=LecturerResponse, status_code=status.HTTP_201_CREATED)
async def create_lecturer(
    lecturer_in: LecturerCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới giảng viên (Admin only)"""
    return LecturerManagementService.create_lecturer(db, lecturer_in, current_user)

@router.put("/{lecturer_id}", response_model=LecturerResponse)
async def update_lecturer(
    lecturer_id: int,
    lecturer_in: LecturerUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật thông tin giảng viên (Admin only)"""
    return LecturerManagementService.update_lecturer(db, lecturer_id, lecturer_in, current_user)

@router.patch("/{lecturer_id}/status", response_model=LecturerResponse)
async def update_lecturer_status(
    lecturer_id: int,
    status_update: LecturerStatusUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật trạng thái giảng viên (Admin only)"""
    return LecturerManagementService.update_lecturer_status(db, lecturer_id, status_update, current_user)
