from datetime import datetime
from typing import Optional

from pydantic import BaseModel, ConfigDict, Field


class ClassroomBase(BaseModel):
    MaPhong: str = Field(..., min_length=3, max_length=20)
    TenPhong: str = Field(..., min_length=2, max_length=100)
    ToaNha: Optional[str] = Field(default=None, max_length=50)
    Tang: Optional[int] = Field(default=None, ge=0, le=100)
    SucChua: int = Field(..., ge=1, le=1000)
    LoaiPhong: str = Field(default="LyThuyet", min_length=3, max_length=30)
    MaCoSo: str = Field(..., min_length=2, max_length=10)
    TrangThai: str = Field(default="HoatDong", min_length=3, max_length=20)


class ClassroomCreate(ClassroomBase):
    pass


class ClassroomUpdate(BaseModel):
    TenPhong: Optional[str] = Field(default=None, min_length=2, max_length=100)
    ToaNha: Optional[str] = Field(default=None, max_length=50)
    Tang: Optional[int] = Field(default=None, ge=0, le=100)
    SucChua: Optional[int] = Field(default=None, ge=1, le=1000)
    LoaiPhong: Optional[str] = Field(default=None, min_length=3, max_length=30)
    TrangThai: Optional[str] = Field(default=None, min_length=3, max_length=20)


class ClassroomResponse(ClassroomBase):
    NgayTao: datetime

    model_config = ConfigDict(from_attributes=True)
