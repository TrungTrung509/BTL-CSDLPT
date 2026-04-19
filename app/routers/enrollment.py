from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException, Query, status
from sqlalchemy.orm import Session

from configs.db import get_db, open_db_by_branch
from models.Students import Student
from models.Users import User
from schemas.Enrollment import (
    EnrollmentCreate,
    EligibilityResponse,
    RegistrationResult,
    EnrollmentHistoryResponse
)
from schemas.api_response import error_response, success_response
from security import get_current_user, get_current_active_user
from enums.user_role import UserRole
from services.EnrollmentService import EnrollmentService


router = APIRouter(
    prefix="/enrollments",
    tags=["Enrollments"],
)


@router.post("/register")
async def register_course(
    enroll_in: EnrollmentCreate,
    current_user: User = Depends(get_current_active_user),
    db: Session = Depends(get_db)
):
    """Đăng ký một lớp học phần (Dành cho sinh viên)"""
    if current_user.role != UserRole.SinhVien:
        return error_response(message="Chỉ sinh viên mới được đăng ký học phần.", status=403, error_code="FORBIDDEN")
        
    with open_db_by_branch(current_user.MaCoSo) as user_db:
        student = user_db.query(Student).filter(Student.userId == current_user.userId).first()
        
    if not student:
        return error_response(message="Không tìm thấy hồ sơ sinh viên tương ứng.", status=404, error_code="NOT_FOUND")

    try:
        result = EnrollmentService.register(student.MaSV, enroll_in)
        if result.status == "Success":
            return success_response(
                data=result.model_dump(),
                message=result.message,
                status=201
            )
        else:
            return error_response(
                message=result.message,
                status=400,
                error_code="REGISTRATION_FAILED"
            )
    except Exception as e:
        return error_response(
            message=str(e),
            status=500,
            error_code="INTERNAL_SERVER_ERROR"
        )


@router.get("/history", response_model=List[EnrollmentHistoryResponse])
async def get_enrollment_history(
    maHocKy: Optional[str] = Query(None, description="Lọc theo mã học kỳ (Để trống để lấy tất cả)"),
    current_user: User = Depends(get_current_active_user),
    db: Session = Depends(get_db)
):
    """Lấy danh sách các học phần đã đăng ký (Có thể lọc theo học kỳ)"""
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới được xem lịch sử đăng ký của bản thân.")
        
    with open_db_by_branch(current_user.MaCoSo) as user_db:
        student = user_db.query(Student).filter(Student.userId == current_user.userId).first()

    if not student:
        raise HTTPException(status_code=404, detail="Không tìm thấy hồ sơ sinh viên tương ứng.")

    try:
        history = EnrollmentService.get_history(student.MaSV, maHocKy)
        return history
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


@router.delete("/cancel")
async def cancel_registration(
    maLich: str = Query(..., description="Mã lịch học muốn hủy"),
    current_user: User = Depends(get_current_active_user),
    db: Session = Depends(get_db)
):
    """Hủy đăng ký học phần (Dành cho sinh viên)"""
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới được quyền hủy đăng ký học phần của bản thân.")
        
    with open_db_by_branch(current_user.MaCoSo) as user_db:
        student = user_db.query(Student).filter(Student.userId == current_user.userId).first()

    if not student:
        raise HTTPException(status_code=404, detail="Không tìm thấy hồ sơ sinh viên tương ứng.")

    try:
        EnrollmentService.cancel(student.MaSV, maLich)
        return success_response(data=None, message="Hủy đăng ký thành công")
    except HTTPException as e:
        raise e
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
