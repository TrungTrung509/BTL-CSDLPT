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
    KIEM_TRA_SO_BO = "KIEM_TRA_SO_BO"  # snapshot_check_eligibility
    KHOA_PHAN_TAN = "KHOA_PHAN_TAN"    # acquire_locks
    KHOA_LOP_HP_DB = "KHOA_LOP_HP_DB"  # SELECT FOR UPDATE Khóa lớp cũ
    KHOA_DANG_KY_CU = "KHOA_DANG_KY_CU"    # SELECT FOR UPDATE Enrollment cũ (khi đổi lớp)
    KIEM_TRA_SI_SO_CUOI = "KIEM_TRA_SI_SO_CUOI"  # Check sĩ số sau khi đã có Row Lock
    INSERT = "INSERT"
    PRE_COMMIT = "PRE_COMMIT"
    COMMIT = "COMMIT"
    ROLLBACK = "ROLLBACK"
    FAILED = "FAILED"
    RETRY = "RETRY"

    # --- Legacy (tương thích với EnrollmentService cũ) ---
    KIEM_TRA_LICH_HOC = "KIEM_TRA_LICH_HOC"
    DA_KHOA = "DA_KHOA"
    KIEM_TRA_SI_SO = "KIEM_TRA_SI_SO"
    
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

class EnrollmentAction(str, Enum):
    REGISTER = "REGISTER"
    SWITCH = "SWITCH"
    CANCEL = "CANCEL"

class RecoveryAction(str, Enum):
    FORCED_COMMIT = "FORCED_COMMIT"
    FORCED_ABORT = "FORCED_ABORT"

