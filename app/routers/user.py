from fastapi import APIRouter, Depends, status, HTTPException

from enums.user_role import UserRole
from services.UserService import UserService
from models.Users import User
from security import get_current_user, require_roles
from schemas.User import (
    StudentCreate, 
    TeacherCreate, 
    StudentResponse, 
    TeacherResponse, 
    ChangePasswordRequest
)
from schemas.api_response import success_response, error_response

router = APIRouter(
    prefix="/users",
    tags=["Users"]
)


@router.get("/me")
async def read_users_me(
    current_user: User = Depends(get_current_user)
):
    try:
        profile = await UserService.get_user_profile(current_user)
        if isinstance(profile, (StudentResponse, TeacherResponse)):
            return success_response(
                data=profile.model_dump(),
                message="Lấy thông tin người dùng thành công",
                status=200
            )
        return success_response(
            data=profile,
            message="Lấy thông tin người dùng thành công",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="PROFILE_ERROR"
        )


@router.put("/change-password")
async def change_password(
    request: ChangePasswordRequest,
    current_user: User = Depends(get_current_user)
):
    try:
        result = await UserService.change_password(current_user, request)
        return success_response(
            data=result,
            message="Đổi mật khẩu thành công trên tất cả các site",
            status=200
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="PASSWORD_CHANGE_FAILED"
        )


@router.post("/students", status_code=status.HTTP_201_CREATED)
async def create_student(
    student_in: StudentCreate,
    current_user: User = Depends(require_roles(UserRole.Admin))
):
    try:
        student = await UserService.create_student(student_in, current_user)
        return success_response(
            data=student.model_dump(),
            message=f"Tạo sinh viên '{student_in.MaSV}' thành công",
            status=201
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_STUDENT_FAILED"
        )


@router.post("/teachers", status_code=status.HTTP_201_CREATED)
async def create_teacher(
    teacher_in: TeacherCreate,
    current_user: User = Depends(require_roles(UserRole.Admin))
):
    try:
        teacher = await UserService.create_teacher(teacher_in, current_user)
        return success_response(
            data=teacher.model_dump(),
            message=f"Tạo giảng viên '{teacher_in.MaGV}' thành công",
            status=201
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_TEACHER_FAILED"
        )
