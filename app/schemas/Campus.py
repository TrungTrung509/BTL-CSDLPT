from pydantic import BaseModel, ConfigDict, EmailStr, Field, model_validator
from typing import Optional
from datetime import datetime

class CampusBase(BaseModel):
    """Schema base cho Cơ sở đào tạo (CoSo)"""
    MaCoSo: str = Field(..., min_length=2, max_length=10, description="Mã cơ sở")
    TenCoSo: str = Field(..., min_length=2, max_length=100, description="Tên cơ sở")
    Email: Optional[EmailStr] = Field(None, description="Email liên hệ")
    SoDienThoai: Optional[str] = Field(None, max_length=20, description="Số điện thoại")

    @model_validator(mode='after')
    def validate_phone(self):
        if self.SoDienThoai:
            phone = self.SoDienThoai.replace(" ", "").replace("-", "")
            if not phone.isdigit() or len(phone) < 10:
                raise ValueError("Số điện thoại không hợp lệ")
        return self

class CampusCreate(CampusBase):
    """Request body tạo mới cơ sở"""
    pass

class CampusUpdate(BaseModel):
    """Request body cập nhật cơ sở"""
    MaCoSo: Optional[str] = Field(None, min_length=2, max_length=10)
    TenCoSo: Optional[str] = Field(None, min_length=2, max_length=100)
    Email: Optional[EmailStr] = None
    SoDienThoai: Optional[str] = Field(None, max_length=20)

    @model_validator(mode='after')
    def validate_phone(self):
        if self.SoDienThoai:
            phone = self.SoDienThoai.replace(" ", "").replace("-", "")
            if not phone.isdigit() or len(phone) < 10:
                raise ValueError("Số điện thoại không hợp lệ")
        return self

class CampusResponse(CampusBase):
    """Response cơ sở"""
    id: Optional[int] = None
    NgayTao: Optional[datetime] = None
    model_config = ConfigDict(from_attributes=True)

class CampusListResponse(BaseModel):
    """Response danh sách cơ sở"""
    items: list[CampusResponse]
    total: int
