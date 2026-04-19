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

class SemesterStatus(str, Enum):
    SapMo = "SapMo"
    DangDangKy = "DangDangKy"
    DangHoc = "DangHoc"
    DaKetThuc = "DaKetThuc"

class RoomStatus(str, Enum):
    HoatDong = "HoatDong"
    BaoTri = "BaoTri"
    NgungSuDung = "NgungSuDung"

class CourseStatus(str, Enum):
    HoatDong = "HoatDong"
    TamDung = "TamDung"
    HuyBo = "HuyBo"

class ClassSectionStatus(str, Enum):
    Mo = "Mo"
    Dong = "Dong"
    Huy = "Huy"

class EnrollmentStatus(str, Enum):
    DaDangKy = "DaDangKy"
    HoanThanh = "HoanThanh"
    DaHuy = "DaHuy"

class GeneralStatus(str, Enum):
    HoatDong = "HoatDong"
    NgungHoatDong = "NgungHoatDong"
