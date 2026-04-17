from fastapi import APIRouter, Depends, HTTPException, Path, status
from sqlalchemy.orm import Session

from configs.db import get_db
from enums.user_role import UserRole
from models.Users import User
from schemas.Course import CourseCreate, CourseUpdate
from schemas.api_response import error_response, success_response
from security import get_current_active_user, require_roles
from services.CourseService import CourseService

router = APIRouter(
    prefix="/courses",
    tags=["Course Management"],
)


@router.get("/")
async def get_all_courses(
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_active_user),
):
    try:
        items, total = CourseService.get_all_courses(db)
        return success_response(
            data={
                "items": [item for item in items],
                "total": total,
            },
            message=f"Lay danh sach hoc phan thanh cong (tong: {total})",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="FETCH_COURSES_FAILED",
        )


@router.get("/{ma_hoc_phan}")
async def get_course(
    ma_hoc_phan: str = Path(..., description="Ma hoc phan"),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_active_user),
):
    try:
        course = CourseService.get_course_by_id(db, ma_hoc_phan.upper())
        return success_response(
            data=course,
            message=f"Lay chi tiet hoc phan '{ma_hoc_phan.upper()}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="COURSE_NOT_FOUND",
        )


@router.post("/", status_code=status.HTTP_201_CREATED)
async def create_course(
    course_in: CourseCreate,
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        course = await CourseService.create_course(course_in, current_user)
        return success_response(
            data=course.model_dump(),
            message=f"Tao hoc phan '{course.MaHocPhan}' thanh cong",
            status=201,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="CREATE_COURSE_FAILED",
        )


@router.put("/{ma_hoc_phan}")
async def update_course(
    course_in: CourseUpdate,
    ma_hoc_phan: str = Path(..., description="Ma hoc phan"),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        course = await CourseService.update_course(ma_hoc_phan, course_in, current_user)
        return success_response(
            data=course.model_dump(),
            message=f"Cap nhat hoc phan '{course.MaHocPhan}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="UPDATE_COURSE_FAILED",
        )


@router.delete("/{ma_hoc_phan}")
async def delete_course(
    ma_hoc_phan: str = Path(..., description="Ma hoc phan"),
    current_user: User = Depends(require_roles(UserRole.Admin)),
):
    try:
        await CourseService.delete_course(ma_hoc_phan, current_user)
        return success_response(
            data=None,
            message=f"Xoa hoc phan '{ma_hoc_phan.upper()}' thanh cong",
            status=200,
        )
    except HTTPException as e:
        return error_response(
            message=e.detail,
            status=e.status_code,
            error_code="DELETE_COURSE_FAILED",
        )
