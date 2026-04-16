from pydantic import BaseModel, ConfigDict
from typing import Optional
from datetime import date

class BranchBase(BaseModel):
    MaCoSo: str
    TenCoSo: str
    DiaChi: str
    SoDienThoai: Optional[str] = None
    Email: Optional[str] = None
    NgayThanhLap: Optional[date] = None
    TrangThai: Optional[str] = "HoatDong"

class BranchCreate(BranchBase):
    pass

class BranchUpdate(BaseModel):
    TenCoSo: Optional[str] = None
    DiaChi: Optional[str] = None
    SoDienThoai: Optional[str] = None
    Email: Optional[str] = None
    NgayThanhLap: Optional[date] = None
    TrangThai: Optional[str] = None

class BranchResponse(BranchBase):
    model_config = ConfigDict(from_attributes=True)