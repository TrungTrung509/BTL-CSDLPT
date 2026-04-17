from pydantic import BaseModel, ConfigDict, Field, model_validator
from typing import Optional, List
from datetime import date, datetime

class LecturerBase(BaseModel):
    """Schema base cho Giảng viên"""
    MaGV: str = Field(..., min_length=3, max_length=20, description="Mã giảng viên")
    userId: Optional[str] = Field(None, description="User ID (từ bảng users)")
    Ho: str = Field(..., min_length=1, max_length=50, description="Họ")
    Ten: str = Field(..., min_length=1, max_length=50, description="Tên")
    NgaySinh: Optional[date] = Field(None, description="Ngày sinh")
    GioiTinh: Optional[str] = Field(None, description="Giới tính: Nam, Nu, Khac")
    HocVi: Optional[str] = Field(None, max_length=50, description="Học vị (CN, ThS, TS, PGS)")
    HocHam: Optional[str] = Field(None, max_length=50, description="Học hàm (GTV, PGS)")
    SDT: Optional[str] = Field(None, max_length=20, description="Số điện thoại")
    DiaChi: Optional[str] = Field(None, max_length=300, description="Địa chỉ")
    MaCoSo: str = Field(..., description="Mã cơ sở quản lý")
    MaKhoa: Optional[str] = Field(None, description="Mã khoa")
    TrangThai: Optional[str] = Field(default='DangCongTac', description="Trạng thái: DangCongTac, TamNghi, NghiViec")
    NgayVaoLam: Optional[date] = Field(None, description="Ngày vào làm")
    NgayTao: Optional[str] = Field(None, description="Ngày tạo")

class LecturerCreate(LecturerBase):
    """Request body tạo mới giảng viên"""
    pass

class LecturerUpdate(BaseModel):
    """Request body cập nhật giảng viên"""
    Ho: Optional[str] = Field(None, min_length=1, max_length=50)
    Ten: Optional[str] = Field(None, min_length=1, max_length=50)
    NgaySinh: Optional[date] = None
    GioiTinh: Optional[str] = None
    HocVi: Optional[str] = Field(None, max_length=50)
    HocHam: Optional[str] = Field(None, max_length=50)
    SDT: Optional[str] = Field(None, max_length=20)
    DiaChi: Optional[str] = Field(None, max_length=300)
    MaKhoa: Optional[str] = None
    TrangThai: Optional[str] = None
    NgayVaoLam: Optional[date] = None

class LecturerStatusUpdate(BaseModel):
    """Request body cập nhật trạng thái giảng viên"""
    TrangThai: str = Field(..., description="Trạng thái mới")

class LecturerResponse(LecturerBase):
    """Response giảng viên"""
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
    TrangThai: Optional[str] = None
    keyword: Optional[str] = Field(None, description="Tìm kiếm theo mã, họ tên")
