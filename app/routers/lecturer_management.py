from typing import Optional

from fastapi import APIRouter, Depends, HTTPException, Path, Query, status
from sqlalchemy.orm import Session

from configs.db import get_db
from schemas.LecturerManagement import (
    LecturerCreate, LecturerUpdate, LecturerStatusUpdate,
    LecturerResponse, LecturerFilter
)
from configs.db import open_db_by_branch
from schemas.api_response import success_response, error_response
from services.LecturerManagementService import LecturerManagementService
from services.UserService import UserService
from models.Users import User
from schemas.LecturerManagement import (
    LecturerCreate,
    LecturerFilter,
    LecturerResponse,
    LecturerStatusUpdate,
    LecturerUpdate,
)
from schemas.api_response import error_response, success_response
from security import get_current_user, require_roles
from services.LecturerManagementService import LecturerManagementService

router = APIRouter(
    prefix="/lecturers",
    tags=["Lecturer Management"],
)


@router.get("/")
async def get_all_lecturers(
    maCoSo: Optional[str] = Query(None, description="Lọc theo mã cơ sở"),
    maKhoa: Optional[str] = Query(None, description="Lọc theo mã khoa"),
    trangThai: Optional[str] = Query(None, description="Lọc theo trạng thái"),
    keyword: Optional[str] = Query(None, description="Tìm kiếm theo mã, họ tên"),
    skip: int = Query(0, ge=0, description="Số bản ghi bỏ qua"),
    limit: int = Query(20, ge=1, le=100, description="Số bản ghi lấy"),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy danh sách giảng viên với các filter."""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        filters = LecturerFilter(
            MaCoSo=maCoSo,
            MaKhoa=maKhoa,
            TrangThai=trangThai,
            keyword=keyword,
        )
        lecturers, total = LecturerManagementService.get_all_lecturers(db, filters, skip, limit)
        return success_response(
            data={
                "items": [l for l in lecturers],
                "total": total,
                "skip": skip,
                "limit": limit,
            },
            message=f"Lay danh sach giang vien thanh cong (tong: {total})",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="FETCH_LECTURERS_FAILED",
        )


@router.get("/{ma_gv}")
async def get_lecturer(
    ma_gv: str = Path(..., description="Mã giảng viên"),
    current_user: User = Depends(UserService.get_current_user)
):
    """Lấy thông tin giảng viên theo MaGV"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        lecturer = LecturerManagementService.get_lecturer_by_magv(db, ma_gv)
        return success_response(
            data=lecturer,
            message=f"Lấy thông tin giảng viên '{ma_gv}' thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="LECTURER_NOT_FOUND",
        )


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_lecturer(
    lecturer_in: LecturerCreate,
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới giảng viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        lecturer = LecturerManagementService.create_lecturer(db, lecturer_in, current_user)
        return success_response(
            data=lecturer,
            message=f"Tạo giảng viên '{lecturer_in.MaGV}' thành công",
            status=201
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_LECTURER_FAILED",
        )


@router.put("/{ma_gv}")
async def update_lecturer(
    ma_gv: str = Path(..., description="Mã giảng viên"),
    lecturer_in: LecturerUpdate = None,
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật thông tin giảng viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        lecturer = LecturerManagementService.update_lecturer(db, ma_gv, lecturer_in, current_user)
        return success_response(
            data=LecturerResponse.model_validate(lecturer).model_dump(),
            message=f"Cap nhat giang vien '{ma_gv}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="UPDATE_LECTURER_FAILED",
        )


@router.patch("/{ma_gv}/status")
async def update_lecturer_status(
    ma_gv: str = Path(..., description="Mã giảng viên"),
    status_update: LecturerStatusUpdate = None,
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Cập nhật trạng thái giảng viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        lecturer = LecturerManagementService.update_lecturer_status(db, ma_gv, status_update, current_user)
        return success_response(
            data=LecturerResponse.model_validate(lecturer).model_dump(),
            message=f"Cap nhat trang thai giang vien '{ma_gv}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="UPDATE_LECTURER_STATUS_FAILED",
        )


@router.delete("/{ma_gv}")
async def delete_lecturer(
    ma_gv: str = Path(..., description="Mã giảng viên"),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Xóa giảng viên (Admin only)"""
    db = open_db_by_branch(current_user.MaCoSo)
    try:
        LecturerManagementService.delete_lecturer(db, ma_gv, current_user)
        return success_response(
            data=None,
            message=f"Xoa giang vien '{ma_gv}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="DELETE_LECTURER_FAILED",
        )
