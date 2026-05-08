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


class TrangThaiGiaoTac(str, Enum):
    DANG_CHAY = "DANG_CHAY"
    THANH_CONG = "THANH_CONG"
    THAT_BAI = "THAT_BAI"

class BuocGiaoTac(str, Enum):
    BEGIN = "BEGIN"
    KIEM_TRA_LICH_HOC = "KIEM_TRA_LICH_HOC"
    DA_KHOA = "DA_KHOA"
    KIEM_TRA_SI_SO = "KIEM_TRA_SI_SO"
    INSERT = "INSERT"
    COMMIT = "COMMIT"
    ROLLBACK = "ROLLBACK"
    RETRY = "RETRY"
class LogStatus(str, Enum):
    SUCCESS = "SUCCESS"
    FAILED = "FAILED"
    PENDING = "PENDING"


class EnrollmentTransactionState(str, Enum):
    INIT = "INIT"
    PREPARED = "PREPARED"
    PRECOMMIT = "PRECOMMIT"
    COMMITTED = "COMMITTED"
    ABORTED = "ABORTED"
