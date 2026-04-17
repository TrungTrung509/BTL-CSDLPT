from fastapi import APIRouter, Depends, status, HTTPException
from sqlalchemy.orm import Session

from configs.db import get_db
from schemas.Department import DepartmentCreate, DepartmentResponse
from schemas.api_response import success_response, error_response
from services.DepartmentService import DepartmentService
from services.UserService import UserService
from models.Users import User

router = APIRouter(
    prefix="/departments",
    tags=["Departments"]
)


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_department(
    dept_in: DepartmentCreate,
    db: Session = Depends(get_db),
    current_user: User = Depends(UserService.get_current_active_user)
):
    """Tạo mới khoa (Admin only)"""
    try:
        dept = await DepartmentService.create_department(db, dept_in, current_user)
        return success_response(
            data=dept.model_dump(),
            message=f"Tạo khoa '{dept_in.MaKhoa}' thành công",
            status=201
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_DEPARTMENT_FAILED"
        )
