from datetime import datetime
from typing import List, Optional

from pydantic import BaseModel, Field
from enums.status import EnrollmentStatus


class EnrollmentCreate(BaseModel):
    MaLopHP: str = Field(..., description="Mã lớp học phần đăng ký")
    GhiChu: Optional[str] = None

class EligibilityResponse(BaseModel):
    is_eligible: bool
    reasons: List[str] = Field(default_factory=list, description="Lý do nếu không đủ điều kiện")


class RegistrationResult(BaseModel):
    MaLopHP: str
    status: str  # 'Success', 'Failed'
    message: Optional[str] = None
    enrollment_id: Optional[int] = None
    action: Optional[str] = None # 'REGISTER', 'SWITCH'
    old_ma_lop_hp: Optional[str] = None

class EnrollmentHistoryResponse(BaseModel):
    MaDangKy: int
    MaSV: str
    MaLopHP: str
    TenLopHP: Optional[str] = None
    TenHocPhan: Optional[str] = None
    MaHocKy: str
    NgayDangKy: datetime
    TrangThaiDangKy: EnrollmentStatus
    MaCoSo: str
