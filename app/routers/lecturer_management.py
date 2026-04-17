from typing import Optional

from fastapi import APIRouter, Depends, HTTPException, Path, Query, status
from sqlalchemy.orm import Session

from configs.db import get_db
from enums.user_role import UserRole
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
    maCoSo: Optional[str] = Query(None, description="Loc theo ma co so"),
    maKhoa: Optional[str] = Query(None, description="Loc theo ma khoa"),
    trangThai: Optional[str] = Query(None, description="Loc theo trang thai"),
    keyword: Optional[str] = Query(None, description="Tim kiem theo ma, ho ten"),
    skip: int = Query(0, ge=0, description="So ban ghi bo qua"),
    limit: int = Query(20, ge=1, le=100, description="So ban ghi lay"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
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
                "items": [LecturerResponse.model_validate(item).model_dump() for item in lecturers],
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
    ma_gv: str = Path(..., description="Ma giang vien"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
):
    try:
        lecturer = LecturerManagementService.get_lecturer_by_magv(db, ma_gv)
        return success_response(
            data=LecturerResponse.model_validate(lecturer).model_dump(),
            message=f"Lay thong tin giang vien '{ma_gv}' thanh cong",
            status=200,
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
    db: Session = Depends(get_db),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        lecturer = LecturerManagementService.create_lecturer(db, lecturer_in, current_user)
        return success_response(
            data=LecturerResponse.model_validate(lecturer).model_dump(),
            message=f"Tao giang vien '{lecturer_in.MaGV}' thanh cong",
            status=201,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_LECTURER_FAILED",
        )


@router.put("/{ma_gv}")
async def update_lecturer(
    lecturer_in: LecturerUpdate,
    ma_gv: str = Path(..., description="Ma giang vien"),
    db: Session = Depends(get_db),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
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
    status_update: LecturerStatusUpdate,
    ma_gv: str = Path(..., description="Ma giang vien"),
    db: Session = Depends(get_db),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
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
    ma_gv: str = Path(..., description="Ma giang vien"),
    db: Session = Depends(get_db),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
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
