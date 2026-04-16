from fastapi import APIRouter, Depends, status, Query
from sqlalchemy.orm import Session
from typing import List, Optional

from configs.db import get_db
from schemas.StudentManagement import (
    StudentCreate, StudentUpdate, StudentStatusUpdate,
    StudentResponse, StudentFilter
)
from services.StudentManagementService import StudentManagementService
from services.UserService import UserService
from models.Users import User
from enums.status import StudentStatus

router = APIRouter(
    prefix="/students",
    tags=["Student Management"]
)

@router.get("/", response_model=List[StudentResponse])
async def get_all_students(
    maCoSo: Optional[str] = Query(None, description="Lọc theo mã cơ sở"),
    maKhoa: Optional[str] = Query(None, description="Lọc theo mã khoa"),
    trangThai: Optional[StudentStatus] = Query(None, description="Lọc theo trạng thái"),
    keyword: Optional[str] = Query(None, description="Tìm kiếm theo mã, họ tên"),
    skip: int = Query(0, ge=0, description="Số bản ghi bỏ qua"),
    limit: int = Query(20, ge=1, le=100, description="Số bản ghi lấy"),
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """
    Lấy danh sách sinh viên với các filter.
    - maCoSo: Lọc theo cơ sở quản lý
    - maKhoa: Lọc theo khoa
    - trangThai: Lọc theo trạng thái (Active, OnLeave, DroppedOut, Graduated)
    - keyword: Tìm kiếm theo mã sinh viên, họ tên, email
    """
    filters = StudentFilter(
        MaCoSo=maCoSo,
        MaKhoa=maKhoa,
        TrangThai=trangThai,
        keyword=keyword
    )
    students, total = StudentManagementService.get_all_students(db, filters, skip, limit)
    return students

@router.get("/{student_id}", response_model=StudentResponse)
async def get_student(
    student_id: int,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy thông tin sinh viên theo ID"""
    return StudentManagementService.get_student_by_id(db, student_id)

@router.post("/", response_model=StudentResponse, status_code=status.HTTP_201_CREATED)
async def create_student(
    student_in: StudentCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới sinh viên (Admin only)"""
    return StudentManagementService.create_student(db, student_in, current_user)

@router.put("/{student_id}", response_model=StudentResponse)
async def update_student(
    student_id: int,
    student_in: StudentUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật thông tin sinh viên (Admin only)"""
    return StudentManagementService.update_student(db, student_id, student_in, current_user)

@router.patch("/{student_id}/status", response_model=StudentResponse)
async def update_student_status(
    student_id: int,
    status_update: StudentStatusUpdate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật trạng thái sinh viên (Admin only)"""
    return StudentManagementService.update_student_status(db, student_id, status_update, current_user)
