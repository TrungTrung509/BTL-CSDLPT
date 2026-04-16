from pydantic import BaseModel, ConfigDict, EmailStr, Field, model_validator
from typing import Optional, List
from datetime import date, datetime
from enums.gender import Genders
from enums.status import StudentStatus

class StudentBase(BaseModel):
    """Schema base cho Sinh viên"""
    MaSV: str = Field(..., min_length=3, max_length=20, description="Mã sinh viên")
    Ho: str = Field(..., min_length=1, max_length=50, description="Họ")
    Ten: str = Field(..., min_length=1, max_length=50, description="Tên")
    NgaySinh: date = Field(..., description="Ngày sinh")
    GioiTinh: Genders = Field(..., description="Giới tính")
    Email: Optional[EmailStr] = Field(None, description="Email")
    SoDienThoai: Optional[str] = Field(None, max_length=20, description="Số điện thoại")
    DiaChi: Optional[str] = Field(None, max_length=300, description="Địa chỉ")
    MaCoSo: str = Field(..., description="Mã cơ sở quản lý")
    MaKhoa: Optional[str] = Field(None, description="Mã khoa")
    TrangThai: StudentStatus = Field(default=StudentStatus.Active, description="Trạng thái sinh viên")
    NgayNhapHoc: Optional[date] = Field(None, description="Ngày nhập học")

    @model_validator(mode='after')
    def validate_birth_date(self):
        if self.NgaySinh:
            today = date.today()
            age = today.year - self.NgaySinh.year - ((today.month, today.day) < (self.NgaySinh.month, self.NgaySinh.day))
            if age < 16 or age > 100:
                raise ValueError("Ngày sinh không hợp lệ (tuổi phải từ 16-100)")
        return self

    @model_validator(mode='after')
    def validate_phone(self):
        if self.SoDienThoai:
            phone = self.SoDienThoai.replace(" ", "").replace("-", "")
            if not phone.isdigit() or len(phone) < 10:
                raise ValueError("Số điện thoại không hợp lệ")
        return self

class StudentCreate(StudentBase):
    """Request body tạo mới sinh viên"""
    pass

class StudentUpdate(BaseModel):
    """Request body cập nhật sinh viên"""
    MaSV: Optional[str] = Field(None, min_length=3, max_length=20)
    Ho: Optional[str] = Field(None, min_length=1, max_length=50)
    Ten: Optional[str] = Field(None, min_length=1, max_length=50)
    NgaySinh: Optional[date] = None
    GioiTinh: Optional[Genders] = None
    Email: Optional[EmailStr] = None
    SoDienThoai: Optional[str] = Field(None, max_length=20)
    DiaChi: Optional[str] = Field(None, max_length=300)
    MaKhoa: Optional[str] = None
    TrangThai: Optional[StudentStatus] = None
    NgayNhapHoc: Optional[date] = None

    @model_validator(mode='after')
    def validate_birth_date(self):
        if self.NgaySinh:
            today = date.today()
            age = today.year - self.NgaySinh.year - ((today.month, today.day) < (self.NgaySinh.month, self.NgaySinh.day))
            if age < 16 or age > 100:
                raise ValueError("Ngày sinh không hợp lệ")
        return self

class StudentStatusUpdate(BaseModel):
    """Request body cập nhật trạng thái sinh viên"""
    TrangThai: StudentStatus = Field(..., description="Trạng thái mới")

class StudentResponse(StudentBase):
    """Response sinh viên"""
    id: Optional[int] = None
    NgayTao: Optional[datetime] = None
    model_config = ConfigDict(from_attributes=True)

class StudentListResponse(BaseModel):
    """Response danh sách sinh viên"""
    items: list[StudentResponse]
    total: int
    page: int = 1
    page_size: int = 20

class StudentFilter(BaseModel):
    """Filter cho danh sách sinh viên"""
    MaCoSo: Optional[str] = None
    MaKhoa: Optional[str] = None
    TrangThai: Optional[StudentStatus] = None
    keyword: Optional[str] = Field(None, description="Tìm kiếm theo mã, họ tên")
