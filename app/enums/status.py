from enum import Enum

class StudentStatus(str, Enum):
    DangHoc = "DangHoc"
    BaoLuu = "BaoLuu"
    ThoiHoc = "ThoiHoc"
    TotNghiep = "TotNghiep"

class TeacherStatus(str, Enum):
    DangCongTac = "DangCongTac"
    TamNghi = "TamNghi"
    NghiViec = "NghiViec"

class UserStatus(str, Enum):
    Active = "Active"
    Inactive = "Inactive"
    Locked = "Locked"
