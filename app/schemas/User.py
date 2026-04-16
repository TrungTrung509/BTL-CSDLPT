from enums.status import UserStatus
from pydantic import BaseModel, ConfigDict, Field, model_validator, field_validator
from typing import Optional
from datetime import date
from enums.user_role import UserRole
from enums.status import StudentStatus, TeacherStatus
from enums.gender import Genders

class UserBase(BaseModel):
    """Thông tin định danh dùng chung"""
    username: str
    email: Optional[str] = None
    role: UserRole
    MaCoSo: str
    status: UserStatus = UserStatus.Active

class ProfileBase(BaseModel):
    """Thông tin hồ sơ cá nhân (lưu tại local site)"""
    Ho: str
    Ten: str
    email: Optional[str] = None
    SDT: Optional[str] = None
    NgaySinh: Optional[date] = None
    GioiTinh: Optional[Genders] = Genders.Khac
    DiaChi: Optional[str] = None

class UserResponse(UserBase):
    userId: str
    model_config = ConfigDict(from_attributes=True)

class StudentBase(ProfileBase):
    MaSV: str
    TrangThai: StudentStatus
    MaCoSo: str
    MaKhoa: Optional[str] = None

    @field_validator("MaKhoa", mode="before")
    @classmethod
    def transform_null_string(cls, v):
        if isinstance(v, str) and v.lower() == "null":
            return None
        return v

class TeacherBase(ProfileBase):
    MaGV: str
    HocVi: Optional[str] = None
    HocHam: Optional[str] = None
    TrangThai: TeacherStatus
    MaCoSo: str
    MaKhoa: Optional[str] = None

    @field_validator("MaKhoa", mode="before")
    @classmethod
    def transform_null_string(cls, v):
        if isinstance(v, str) and v.lower() == "null":
            return None
        return v

class StudentCreate(StudentBase):
    """Yêu cầu tạo Sinh viên: Dữ liệu tài khoản sẽ được lấy từ MaSV"""
    pass

class TeacherCreate(TeacherBase):
    """Yêu cầu tạo Giảng viên: Dữ liệu tài khoản sẽ được lấy từ MaGV"""
    pass

class UserSelfUpdate(BaseModel):
    """Người dùng tự cập nhật thông tin cá nhân"""
    SDT: Optional[str] = None
    DiaChi: Optional[str] = None
    password: Optional[str] = None

class ChangePasswordRequest(BaseModel):
    old_password: str
    new_password: str
    confirm_password: str

    @model_validator(mode='after')
    def check_passwords_match(self) -> 'ChangePasswordRequest':
        if self.new_password != self.confirm_password:
            raise ValueError("Mật khẩu mới và mật khẩu xác nhận không khớp")
        return self

class StudentResponse(UserResponse, StudentBase):
    """Thông tin đầy đủ của Sinh viên (sau khi Join)"""
    model_config = ConfigDict(from_attributes=True)

class TeacherResponse(UserResponse, TeacherBase):
    """Thông tin đầy đủ của Giảng viên (sau khi Join)"""
    model_config = ConfigDict(from_attributes=True)