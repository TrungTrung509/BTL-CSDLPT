from fastapi import APIRouter, Depends, status, Query, Path, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from configs.db import open_db_by_branch
from configs.db import get_db
from schemas.StudentManagement import (
    StudentCreate, StudentUpdate, StudentStatusUpdate,
    StudentResponse, StudentFilter
)
from schemas.api_response import success_response, error_response, created_response
from services.StudentManagementService import StudentManagementService
from services.UserService import UserService
from models.Users import User

router = APIRouter(
    prefix="/students",
    tags=["Student Management"]
)


@router.get("/")
async def get_all_students(
    maCoSo: Optional[str] = Query(None, description="Lọc theo mã cơ sở"),
    maKhoa: Optional[str] = Query(None, description="Lọc theo mã khoa"),
    trangThai: Optional[str] = Query(None, description="Lọc theo trạng thái"),
    keyword: Optional[str] = Query(None, description="Tìm kiếm theo mã, họ tên"),
    skip: int = Query(0, ge=0, description="Số bản ghi bỏ qua"),
    limit: int = Query(20, ge=1, le=100, description="Số bản ghi lấy"),
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy danh sách sinh viên với các filter."""
    try:
        filters = StudentFilter(
            MaCoSo=maCoSo,
            MaKhoa=maKhoa,
            TrangThai=trangThai,
            keyword=keyword
        )
        students, total = StudentManagementService.get_all_students(db, filters, skip, limit)
        return success_response(
            data={
                "items": [s for s in students],
                "total": total,
                "skip": skip,
                "limit": limit
            },
            message=f"Lấy danh sách sinh viên thành công (tổng: {total})",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="FETCH_STUDENTS_FAILED"
        )


@router.get("/{ma_sv}")
async def get_student(
    ma_sv: str = Path(..., description="Mã sinh viên"),
    current_user: User = Depends(UserService.get_current_user)
):
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        student = StudentManagementService.get_student_by_masv(db, ma_sv)
        return success_response(
            data=student,
            message=f"Lấy thông tin sinh viên '{ma_sv}' thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="STUDENT_NOT_FOUND"
        )


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_student(
    student_in: StudentCreate,
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới sinh viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        student = StudentManagementService.create_student(db, student_in, current_user)
        return success_response(
            data=student,
            message=f"Tạo sinh viên '{student_in.MaSV}' thành công",
            status=201
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_STUDENT_FAILED"
        )


@router.put("/{ma_sv}")
async def update_student(
    ma_sv: str = Path(..., description="Mã sinh viên"),
    student_in: StudentUpdate = None,
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật thông tin sinh viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        student = StudentManagementService.update_student(db, ma_sv, student_in, current_user)
        return success_response(
            data=student,
            message=f"Cập nhật sinh viên '{ma_sv}' thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="UPDATE_STUDENT_FAILED"
        )


@router.patch("/{ma_sv}/status")
async def update_student_status(
    ma_sv: str = Path(..., description="Mã sinh viên"),
    status_update: StudentStatusUpdate = None,
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật trạng thái sinh viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        student = StudentManagementService.update_student_status(db, ma_sv, status_update, current_user)
        return success_response(
            data=student,
            message=f"Cập nhật trạng thái sinh viên '{ma_sv}' thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="UPDATE_STUDENT_STATUS_FAILED"
        )


@router.delete("/{ma_sv}")
async def delete_student(
    ma_sv: str = Path(..., description="Mã sinh viên"),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Xóa sinh viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        StudentManagementService.delete_student(db, ma_sv, current_user)
        return success_response(
            data=None,
            message=f"Xóa sinh viên '{ma_sv}' thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="DELETE_STUDENT_FAILED"
        )
