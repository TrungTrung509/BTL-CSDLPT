from fastapi import APIRouter, Depends, Query, HTTPException
from typing import List, Optional

from security import get_current_active_user
from models.Users import User
from enums.user_role import UserRole
from schemas.Report import ReportSummaryResponse
from services.ReportService import ReportService

router = APIRouter(
    prefix="/reports",
    tags=["Reports & Statistics"],
)

@router.get("/summary", response_model=ReportSummaryResponse)
async def get_enrollment_summary(
    scope: str = Query(..., description="Scope: 'site' or 'global'"),
    maCoSo: Optional[str] = Query(None, description="Mã cơ sở nếu scope là site"),
    maHocKy: Optional[str] = Query(None, description="Mã học kỳ (Optional)"),
    current_user: User = Depends(get_current_active_user)
):
    """
    Lấy thống kê tổng quan về đăng ký học phần.
    Chỉ dành cho Admin.
    """
    if current_user.role != UserRole.Admin:
        raise HTTPException(status_code=403, detail="Chỉ Admin mới có quyền xem báo cáo này.")

    if scope == "site":
        if not maCoSo:
            raise HTTPException(status_code=400, detail="Cần cung cấp maCoSo khi scope là 'site'")
        return ReportService.get_site_summary(maCoSo.upper(), maHocKy)
    
    elif scope == "global":
        return ReportService.get_global_summary(maHocKy)
    
    else:
        raise HTTPException(status_code=400, detail="Scope không hợp lệ. Sử dụng 'site' hoặc 'global'")
