from pydantic import BaseModel, ConfigDict, EmailStr, Field, model_validator
from typing import Optional, List
from datetime import date, datetime
from enums.status import TeacherStatus

class LecturerBase(BaseModel):
    """Schema base cho Giảng viên"""
    MaGV: str = Field(..., min_length=3, max_length=20, description="Mã giảng viên")
    Ho: str = Field(..., min_length=1, max_length=50, description="Họ")
    Ten: str = Field(..., min_length=1, max_length=50, description="Tên")
    HocVi: Optional[str] = Field(None, max_length=50, description="Học vị (CN, ThS, TS, PGS)")
    HocHam: Optional[str] = Field(None, max_length=50, description="Học hàm (GTV, PGS)")
    Email: Optional[EmailStr] = Field(None, description="Email")
    SoDienThoai: Optional[str] = Field(None, max_length=20, description="Số điện thoại")
    MaCoSo: str = Field(..., description="Mã cơ sở quản lý")
    MaKhoa: Optional[str] = Field(None, description="Mã khoa")
    TrangThai: TeacherStatus = Field(default=TeacherStatus.Active, description="Trạng thái giảng viên")
    NgayVaoLam: Optional[date] = Field(None, description="Ngày vào làm")

    @model_validator(mode='after')
    def validate_phone(self):
        if self.SoDienThoai:
            phone = self.SoDienThoai.replace(" ", "").replace("-", "")
            if not phone.isdigit() or len(phone) < 10:
                raise ValueError("Số điện thoại không hợp lệ")
        return self

    @model_validator(mode='after')
    def validate_degree(self):
        if self.HocVi:
            valid_degrees = ['CN', 'ThS', 'TS', 'PGS']
            if self.HocVi not in valid_degrees:
                raise ValueError(f"Học vị phải là một trong: {', '.join(valid_degrees)}")
        return self

class LecturerCreate(LecturerBase):
    """Request body tạo mới giảng viên"""
    pass

class LecturerUpdate(BaseModel):
    """Request body cập nhật giảng viên"""
    MaGV: Optional[str] = Field(None, min_length=3, max_length=20)
    Ho: Optional[str] = Field(None, min_length=1, max_length=50)
    Ten: Optional[str] = Field(None, min_length=1, max_length=50)
    HocVi: Optional[str] = Field(None, max_length=50)
    HocHam: Optional[str] = Field(None, max_length=50)
    Email: Optional[EmailStr] = None
    SoDienThoai: Optional[str] = Field(None, max_length=20)
    MaKhoa: Optional[str] = None
    TrangThai: Optional[TeacherStatus] = None
    NgayVaoLam: Optional[date] = None

    @model_validator(mode='after')
    def validate_phone(self):
        if self.SoDienThoai:
            phone = self.SoDienThoai.replace(" ", "").replace("-", "")
            if not phone.isdigit() or len(phone) < 10:
                raise ValueError("Số điện thoại không hợp lệ")
        return self

class LecturerStatusUpdate(BaseModel):
    """Request body cập nhật trạng thái giảng viên"""
    TrangThai: TeacherStatus = Field(..., description="Trạng thái mới")

class LecturerResponse(LecturerBase):
    """Response giảng viên"""
    id: Optional[int] = None
    NgayTao: Optional[datetime] = None
    model_config = ConfigDict(from_attributes=True)

class LecturerListResponse(BaseModel):
    """Response danh sách giảng viên"""
    items: list[LecturerResponse]
    total: int
    page: int = 1
    page_size: int = 20

class LecturerFilter(BaseModel):
    """Filter cho danh sách giảng viên"""
    MaCoSo: Optional[str] = None
    MaKhoa: Optional[str] = None
    TrangThai: Optional[TeacherStatus] = None
    keyword: Optional[str] = Field(None, description="Tìm kiếm theo mã, họ tên")
