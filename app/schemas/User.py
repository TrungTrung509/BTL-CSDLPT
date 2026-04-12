from enums.status import UserStatus
from pydantic import BaseModel, ConfigDict, Field, model_validator
from typing import Optional
from datetime import date
from enums.user_role import UserRole
from enums.status import StudentStatus, TeacherStatus
from enums.gender import Genders

class UserBase(BaseModel):
    """Thông tin cá nhân cơ bản không bao gồm tài khoản"""
    email: str
    name: str
    phone: str
    date_of_birth: date
    status: UserStatus = UserStatus.Active

class UserResponse(UserBase):
    id: str
    username: str
    role: UserRole
    model_config = ConfigDict(from_attributes=True)

class StudentBase(BaseModel):
    maSV: str
    gender: Genders
    student_status: StudentStatus
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class TeacherBase(BaseModel):
    maGV: str
    degree: str
    teacher_status: TeacherStatus
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class UserSelfUpdate(BaseModel):
    """Người dùng tự cập nhật: Chỉ cho phép đổi mật khẩu và số điện thoại"""
    phone: Optional[str] = None
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

class UserAdminUpdate(BaseModel):
    """Admin cập nhật User: Có quyền sửa mọi trường, kể cả Role và Status"""
    username: Optional[str] = None
    email: Optional[str] = None
    name: Optional[str] = None
    phone: Optional[str] = None
    role: Optional[UserRole] = None
    date_of_birth: Optional[date] = None
    status: Optional[str] = None
    password: Optional[str] = None

class StudentAdminUpdate(UserAdminUpdate):
    """Admin cập nhật Sinh viên: Bao gồm thông tin User + thông tin Sinh viên"""
    maSV: Optional[str] = None
    gender: Optional[Genders] = None
    student_status: Optional[StudentStatus] = None
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class TeacherAdminUpdate(UserAdminUpdate):
    """Admin cập nhật Giảng viên: Bao gồm thông tin User + thông tin Giảng viên"""
    maGV: Optional[str] = None
    degree: Optional[str] = None
    teacher_status: Optional[TeacherStatus] = None
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class UserCreate(UserBase):
    """Dùng cho trường hợp Admin tạo User hệ thống (tài khoản do admin đặt)"""
    username: str
    password: str

class StudentCreate(UserBase):
    """Request Body tạo Sinh viên: Không có username/password (tự động lấy theo maSV)"""
    maSV: str
    gender: Genders
    student_status: StudentStatus
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class TeacherCreate(UserBase):
    """Request Body tạo Giảng viên: Không có username/password (tự động lấy theo maGV)"""
    maGV: str
    degree: str
    teacher_status: TeacherStatus
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class StudentResponse(UserResponse):
    maSV: str
    gender: Genders
    student_status: StudentStatus
    branch_id: Optional[str] = None
    department_id: Optional[str] = None

class TeacherResponse(UserResponse):
    maGV: str
    degree: str
    teacher_status: TeacherStatus
    branch_id: Optional[str] = None
    department_id: Optional[str] = None