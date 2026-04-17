from pydantic import BaseModel, ConfigDict, Field, model_validator
from typing import Optional, List
from datetime import date, datetime

class StudentBase(BaseModel):
    """Schema base cho Sinh viên"""
    MaSV: str = Field(..., min_length=3, max_length=20, description="Mã sinh viên")
    userId: Optional[str] = Field(None, description="User ID (từ bảng users)")
    Ho: str = Field(..., min_length=1, max_length=50, description="Họ")
    Ten: str = Field(..., min_length=1, max_length=50, description="Tên")
    NgaySinh: Optional[date] = Field(None, description="Ngày sinh")
    GioiTinh: Optional[str] = Field(None, description="Giới tính: Nam, Nu, Khac")
    SDT: Optional[str] = Field(None, max_length=20, description="Số điện thoại")
    DiaChi: Optional[str] = Field(None, max_length=300, description="Địa chỉ")
    MaCoSo: str = Field(..., description="Mã cơ sở quản lý")
    MaKhoa: Optional[str] = Field(None, description="Mã khoa")
    TrangThai: Optional[str] = Field(default='DangHoc', description="Trạng thái: DangHoc, BaoLuu, ThoiHoc, TotNghiep")
    NgayNhapHoc: Optional[datetime] = Field(None, description="Ngày nhập học")
    NgayTao: Optional[datetime] = Field(None, description="Ngày tạo")

    @model_validator(mode='after')
    def validate_birth_date(self):
        if self.NgaySinh:
            today = date.today()
            age = today.year - self.NgaySinh.year
            if age < 16 or age > 100:
                raise ValueError("Ngày sinh không hợp lệ (tuổi phải từ 16-100)")
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
    GioiTinh: Optional[str] = None
    SDT: Optional[str] = Field(None, max_length=20)
    DiaChi: Optional[str] = Field(None, max_length=300)
    MaKhoa: Optional[str] = None
    TrangThai: Optional[str] = None
    NgayNhapHoc: Optional[date] = None

class StudentStatusUpdate(BaseModel):
    """Request body cập nhật trạng thái sinh viên"""
    TrangThai: str = Field(..., description="Trạng thái mới")

class StudentResponse(StudentBase):
    """Response sinh viên"""
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
    TrangThai: Optional[str] = None
    keyword: Optional[str] = Field(None, description="Tìm kiếm theo mã, họ tên")
