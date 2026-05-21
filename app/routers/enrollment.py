from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException, Query, status

from models.Users import User
from schemas.Enrollment import (
    EnrollmentCreate,
    EnrollmentHistoryResponse,
    ScheduleResponse,
    StudentInClassResponse,
    SwapEnrollmentRequest
)
from schemas.api_response import error_response, success_response
from security import get_current_active_user
from enums.user_role import UserRole
from services.EnrollmentService import EnrollmentService
from services.KafkaQueueService import KafkaQueueService

router = APIRouter(
    prefix="/enrollments",
    tags=["Enrollments"],
)

@router.post("/register")
async def register_course(
    enroll_in: EnrollmentCreate,
    current_user: User = Depends(get_current_active_user),
):
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới được đăng ký học phần.")

    result = await KafkaQueueService.publish_and_wait(current_user, enroll_in)

    if result.status == "Success":
        return success_response(
            data=result.model_dump(),
            message=result.message,
            status=201
        )

    return error_response(
        message=result.message or "Đăng ký thất bại",
        status=400,
        error_code=result.error_code or "REGISTRATION_FAILED",
        details="; ".join(result.reasons) if result.reasons else result.message
    )


@router.get("/history", response_model=List[EnrollmentHistoryResponse])
def get_enrollment_history(
    maHocKy: Optional[str] = Query(None),
    current_user: User = Depends(get_current_active_user),
):
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới được xem lịch sử.")

    return EnrollmentService.get_history(
        current_user.userId,
        current_user.MaCoSo,
        maHocKy
    )

@router.delete("/cancel")
def cancel_registration(
    maLopHP: str = Query(...),
    current_user: User = Depends(get_current_active_user),
):
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới được hủy đăng ký.")

    try:
        EnrollmentService.cancel(
            current_user.userId,
            maLopHP,
            current_user.MaCoSo
        )
        return success_response(message="Hủy đăng ký thành công")

    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/timetable", response_model=List[ScheduleResponse])
def get_my_timetable(
    maHocKy: Optional[str] = Query(None),
    current_user: User = Depends(get_current_active_user),
):
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới có thời khóa biểu.")

    return EnrollmentService.get_student_timetable(
        current_user.userId,
        current_user.MaCoSo,
        maHocKy
    )

@router.get("/class-students", response_model=List[StudentInClassResponse])
def get_class_students(
    maLopHP: str = Query(...),
    current_user: User = Depends(get_current_active_user),
):
    if current_user.role not in [UserRole.Admin, UserRole.GiangVien]:
        raise HTTPException(status_code=403, detail="Bạn không có quyền xem danh sách sinh viên lớp này.")

    return EnrollmentService.get_students_by_class(maLopHP)

@router.post("/swap")
def swap_course(
    swap_data: SwapEnrollmentRequest,
    current_user: User = Depends(get_current_active_user),
):
    if current_user.role != UserRole.SinhVien:
        raise HTTPException(status_code=403, detail="Chỉ sinh viên mới được đổi lớp.")

    ma_sv = getattr(current_user, "MaSV", current_user.userId)
    
    success = EnrollmentService.swap_class(
        current_user,
        swap_data.old_ma_lop_hp,
        swap_data.new_ma_lop_hp
    )
    
    if success:
        return success_response(message="Đổi lớp thành công")
    
    return error_response(message="Đổi lớp thất bại", status=400)