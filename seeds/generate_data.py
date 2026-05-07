# ============================================================
# CƠ SỞ DỮ LIỆU PHÂN TÁN - ĐỀ TÀI: ĐĂNG KÝ HỌC PHẦN
# Tác giả: Nhóm CSDL Phân Tán
# Mô tả: Script generate dữ liệu seed cho 3 site
#
# ID FORMAT (khớp với backend UserService.generate_id):
#   - Admin: AD + STT (VD: AD1, AD2)
#   - SinhVien: SV{site_code}{year_prefix}{ma_khoa}{stt:03d}
#     (VD: SVHD26CNTT001, SVNT26ATTT001)
#   - GiangVien: GV{site_code}{year_prefix}{ma_khoa}{stt:03d}
#     (VD: GVHD26CNTT001, GVNT26ATTT001)
#
# Site Code Mapping:
#   HADONG -> HD, NGOCTRUC -> NT, HOALAC -> HL
# ============================================================

import random
import os
from datetime import datetime, timedelta, date
from faker import Faker
from passlib.context import CryptContext

# ============================================================
# CẤU HÌNH
# ============================================================
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")
fake = Faker()

# ============================================================
# MAPPING CỐ ĐỊNH
# ============================================================

# Site code mapping (khớp với backend)
SITE_TO_CODE = {
    'HADONG': 'HD',
    'NGOCTRUC': 'NT',
    'HOALAC': 'HL',
}

# Reverse mapping
CODE_TO_SITE = {v: k for k, v in SITE_TO_CODE.items()}

# Các khoa có trong hệ thống
KHOA_LIST = ['CNTT', 'ATTT', 'VT', 'KT']

# Year prefix (lấy từ backend: str(datetime.now().year)[2:])
YEAR_PREFIX = str(datetime.now().year)[2:]

# ============================================================
# DỮ LIỆU CỐ ĐỊNH
# ============================================================

VIETNAMESE_FIRST_NAMES = [
    'An', 'Anh', 'Bảo', 'Bình', 'Cường', 'Dung', 'Em', 'Hùng', 'Hương', 'Lan',
    'Linh', 'Mai', 'Minh', 'Nam', 'Ngọc', 'Phong', 'Sơn', 'Thắm', 'Thảo', 'Trang',
    'Trung', 'Tuấn', 'Vân', 'Yến', 'An', 'Bích', 'Châu', 'Dũng', 'Giang', 'Hà',
    'Hạnh', 'Hiền', 'Hoàng', 'Huy', 'Khánh', 'Lam', 'Lâm', 'Liên', 'Loan', 'Ly',
    'My', 'Nga', 'Nghĩa', 'Oanh', 'Phát', 'Quang', 'Quỳnh', 'Sang', 'Tâm', 'Thanh',
    'Thi', 'Thịnh', 'Thu', 'Thúy', 'Tiến', 'Toàn', 'Trí', 'Trọng', 'Việt', 'Vinh'
]

VIETNAMESE_LAST_NAMES = [
    'Nguyễn', 'Trần', 'Lê', 'Phạm', 'Hoàng', 'Huỳnh', 'Đặng', 'Bùi', 'Ngô', 'Đỗ',
    'Hồ', 'Trương', 'Tạ', 'Phan', 'Trịnh', 'Cao', 'Vương', 'Lý', 'Mạc', 'Đinh',
    'Vũ', 'Trần', 'Lê', 'Phạm', 'Hoàng', 'Dương', 'Ngô', 'Đỗ', 'Hồ', 'Lưu'
]

VIETNAMESE_ADDRESSES = [
    'Hà Nội', 'Hải Phòng', 'Hải Dương', 'Bắc Ninh', 'Hưng Yên', 'Vĩnh Phúc',
    'Nam Định', 'Thái Bình', 'Ninh Bình', 'Thanh Hóa', 'Nghệ An', 'Hà Tĩnh',
    'Quảng Bình', 'Quảng Trị', 'Thừa Thiên Huế', 'Đà Nẵng', 'Quảng Nam', 'Quảng Ngãi',
    'Bình Định', 'Phú Yên', 'Khánh Hòa', 'Ninh Thuận', 'Bình Thuận'
]

# ============================================================
# CẤU HÌNH SITE
# ============================================================

SITES = {
    'HADONG': {
        'name': 'Cơ sở Hà Nội',
        'address': 'Hà Nội',
    },
    'NGOCTRUC': {
        'name': 'Cơ sở Ngọc Trục',
        'address': 'Ngọc Trục',
    },
    'HOALAC': {
        'name': 'Cơ sở Hòa Lạc',
        'address': 'Hòa Lạc',
    }
}

# ============================================================
# SỐ LƯỢNG DATA
# ============================================================

DEFAULT_COUNTS = {
    'sinh_vien': 10,       # 10 SV mỗi site (demo)
    'giang_vien': 5,       # 5 GV mỗi site (demo)
    'phong_hoc': 8,        # 8 phòng mỗi site (demo)
    'lop_hoc_phan': 10,    # 10 lớp HP mỗi site (demo)
    'lich_hoc': 2,         # 2 buổi/lớp HP
}

# Lớp có sức chứa nhỏ để test race condition
SMALL_CLASS_SIZES = [10, 12, 15]

# ============================================================
# HỌC KỲ CỐ ĐỊNH CHO DEMO
# ============================================================

CURRENT_SEMESTER = 'HK20251'

# ============================================================
# HÀM HELPER CHO ID GENERATION
# ============================================================

def get_site_code(ma_coso: str) -> str:
    """Lấy site code từ mã cơ sở"""
    return SITE_TO_CODE.get(ma_coso, 'XX')


def build_student_id(ma_coso: str, ma_khoa: str, stt: int) -> str:
    """Build student ID theo format: SV{site_code}{year_prefix}{ma_khoa}{stt:03d}"""
    site_code = get_site_code(ma_coso)
    return f"SV{site_code}{YEAR_PREFIX}{ma_khoa}{stt:03d}"


def build_teacher_id(ma_coso: str, ma_khoa: str, stt: int) -> str:
    """Build teacher ID theo format: GV{site_code}{year_prefix}{ma_khoa}{stt:03d}"""
    site_code = get_site_code(ma_coso)
    return f"GV{site_code}{YEAR_PREFIX}{ma_khoa}{stt:03d}"


def build_admin_id(stt: int) -> str:
    """Build admin ID theo format: AD{stt}"""
    return f"AD{stt}"


def build_username(user_id: str) -> str:
    """Build username từ user_id (viết thường)"""
    return user_id.lower()


def random_phone():
    return f"0{random.randint(90, 99)}{random.randint(1000000, 9999999)}"


def normalize_vietnamese(text: str) -> str:
    """Chuẩn hóa tiếng Việt: bỏ dấu, viết thường"""
    result = text.lower()
    replacements = [
        ('đ', 'd'), ('ă', 'a'), ('â', 'a'), ('ê', 'e'), ('ô', 'o'),
        ('ơ', 'o'), ('ư', 'u'), ('ự', 'u'),
        ('á', 'a'), ('à', 'a'), ('ả', 'a'), ('ạ', 'a'),
        ('ắ', 'a'), ('ằ', 'a'), ('ẳ', 'a'), ('ặ', 'a'),
        ('ấ', 'a'), ('ầ', 'a'), ('ẩ', 'a'), ('ậ', 'a'),
        ('é', 'e'), ('è', 'e'), ('ẻ', 'e'), ('ẽ', 'e'), ('ẹ', 'e'),
        ('ế', 'e'), ('ề', 'e'), ('ể', 'e'), ('ễ', 'e'), ('ệ', 'e'),
        ('í', 'i'), ('ì', 'i'), ('ỉ', 'i'), ('ĩ', 'i'), ('ị', 'i'),
        ('ó', 'o'), ('ò', 'o'), ('ỏ', 'o'), ('õ', 'o'), ('ọ', 'o'),
        ('ố', 'o'), ('ồ', 'o'), ('ổ', 'o'), ('ỗ', 'o'), ('ộ', 'o'),
        ('ớ', 'o'), ('ờ', 'o'), ('ở', 'o'), ('ỡ', 'o'), ('ợ', 'o'),
        ('ú', 'u'), ('ù', 'u'), ('ủ', 'u'), ('ũ', 'u'), ('ụ', 'u'),
        ('ứ', 'u'), ('ừ', 'u'), ('ử', 'u'), ('ữ', 'u'), ('ự', 'u'),
        ('ý', 'y'), ('ỳ', 'y'), ('ỷ', 'y'), ('ỹ', 'y'), ('ỵ', 'y'),
    ]
    for old, new in replacements:
        result = result.replace(old, new)
    return result


def random_email(first_name: str, last_name: str, domain: str = 'ptit.edu.vn') -> str:
    """Sinh email từ tên - không dấu tiếng Việt"""
    first_norm = normalize_vietnamese(first_name)
    last_norm = normalize_vietnamese(last_name)
    return f"{first_norm}.{last_norm}{random.randint(1, 99)}@{domain}"


def random_date(start_year: int = 2000, end_year: int = 2006) -> date:
    """Sinh ngày ngẫu nhiên"""
    start = datetime(start_year, 1, 1)
    end = datetime(end_year, 12, 31)
    delta = end - start
    random_days = random.randint(0, delta.days)
    return (start + timedelta(days=random_days)).date()


def hash_password(password: str) -> str:
    """Hash password bằng bcrypt"""
    return pwd_context.hash(password)


def format_date(d: date) -> str:
    """Format date thành chuỗi SQL"""
    return d.strftime('%Y-%m-%d')


def format_datetime(dt: datetime) -> str:
    """Format datetime thành chuỗi SQL"""
    return dt.strftime('%Y-%m-%d %H:%M:%S')


# ============================================================
# DỮ LIỆU CHUNG (COMMON) - Sinh 1 lần, dùng cho cả 3 site
# Schema: CoSo, Khoa, HocKy, HocPhan
# ============================================================

def generate_common_data():
    """Sinh dữ liệu chung cho bảng dùng chung"""

    output = "-- ============================================================\n"
    output += "-- DU LIEU DUNG CHUNG - Common Data\n"
    output += f"-- Sinh: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    output += "-- Schema: CoSo, Khoa, HocKy, HocPhan\n"
    output += "-- ============================================================\n\n"

    # ---- CoSo ----
    output += "-- ---- CoSo ----\n"
    for ma_coso, info in SITES.items():
        output += f"""INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai")
VALUES ('{ma_coso}', '{info['name']}', '{info['address']}', '{random_phone()}', 'quanly{ma_coso.lower()}@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT ("MaCoSo") DO NOTHING;\n"""

    output += "\n"

    # ---- Khoa ----
    output += "-- ---- Khoa ----\n"
    khoas = [
        ('CNTT', 'Khoa Cong nghe thong tin'),
        ('ATTT', 'Khoa An toan thong tin'),
        ('VT', 'Khoa Vien thong'),
        ('KT', 'Khoa Kinh te'),
    ]
    for ma_khoa, ten_khoa in khoas:
        output += f"""INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai")
VALUES ('{ma_khoa}', '{ten_khoa}', 'Khoa dao tao nganh {ma_khoa}', '2000-01-01', 'HoatDong')
ON CONFLICT ("MaKhoa") DO NOTHING;\n"""

    output += "\n"

    # ---- HocKy ----
    output += "-- ---- HocKy ----\n"
    hoc_ky_data = [
        ('HK20251', '2025-2026', 1, '2025-09-01', '2025-12-31', 'DangDangKy'),
        ('HK20252', '2025-2026', 2, '2026-01-01', '2026-05-31', 'SapMo'),
        ('HK20261', '2026-2027', 1, '2026-09-01', '2026-12-31', 'SapMo'),
    ]
    for ma_hk, nam_hoc, ky_so, ngay_bd, ngay_kt, trang_thai in hoc_ky_data:
        output += f"""INSERT INTO "HocKy" ("MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy")
VALUES ('{ma_hk}', '{nam_hoc}', {ky_so}, '{ngay_bd}', '{ngay_kt}', '{trang_thai}')
ON CONFLICT ("MaHocKy") DO NOTHING;\n"""

    output += "\n"

    # ---- HocPhan ----
    output += "-- ---- HocPhan ----\n"
    hoc_phans = [
        ('CS1001', 'Nhap mon lap trinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Mon co so nganh CNTT'),
        ('CS1002', 'Cau truc du lieu va giai thuat', 4, 40, 30, 'BatBuoc', 'CNTT', 'Mon nen tang'),
        ('CS1003', 'Co so du lieu', 3, 30, 30, 'BatBuoc', 'CNTT', 'Quan tri CSDL'),
        ('CS1004', 'Mang may tinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Nen tang mang'),
        ('CS1005', 'Tri tue nhan tao', 3, 30, 30, 'TuChon', 'CNTT', 'AI co ban'),
        ('CS1006', 'He dieu hanh', 3, 30, 30, 'BatBuoc', 'CNTT', 'OS fundamentals'),
        ('CS1007', 'Phan tich va thiet ke he thong', 3, 30, 30, 'BatBuoc', 'CNTT', 'System analysis'),
        ('CS1008', 'Lap trinh huong doi tuong', 3, 30, 30, 'BatBuoc', 'CNTT', 'OOP'),
        ('CS1009', 'An toan thong tin', 3, 30, 30, 'BatBuoc', 'ATTT', 'Security basics'),
        ('CS1010', 'Mat ma ung dung', 3, 30, 30, 'TuChon', 'ATTT', 'Applied cryptography'),
        ('VT2001', 'Truyen dan so', 3, 30, 30, 'BatBuoc', 'VT', 'Digital transmission'),
        ('VT2002', 'Thong tin di dong', 3, 30, 30, 'TuChon', 'VT', 'Mobile communications'),
        ('CS1011', 'Cong nghe Web', 3, 30, 30, 'BatBuoc', 'CNTT', 'Web development'),
        ('CS1012', 'Do hoa may tinh', 3, 30, 30, 'TuChon', 'CNTT', 'Computer graphics'),
        ('CS1013', 'Kien truc may tinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Computer architecture'),
        ('CS1014', 'Toan roi rac', 3, 45, 0, 'BatBuoc', 'CNTT', 'Discrete mathematics'),
        ('CS1015', 'Xac suat thong ke', 3, 30, 30, 'BatBuoc', 'CNTT', 'Probability & Statistics'),
        ('KT1001', 'Kinh te vi mo', 3, 45, 0, 'BatBuoc', 'KT', 'Microeconomics'),
        ('KT1002', 'Kinh te vi mo', 3, 45, 0, 'BatBuoc', 'KT', 'Macroeconomics'),
        ('CS1016', 'Thuc tap tot nghiep', 4, 0, 120, 'BatBuoc', 'CNTT', 'Internship'),
    ]

    for ma_hp, ten_hp, so_tc, so_lt, so_th, loai, ma_khoa, mo_ta in hoc_phans:
        output += f"""INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('{ma_hp}', '{ten_hp}', {so_tc}, {so_lt}, {so_th}, '{loai}', '{ma_khoa}', '{mo_ta}', 'HoatDong', '{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}')
ON CONFLICT ("MaHP") DO NOTHING;\n"""

    return output


# ============================================================
# DỮ LIỆU CỤC BỘ THEO SITE
# ============================================================

def generate_site_data(ma_coso: str, counts: dict):
    """Sinh dữ liệu cục bộ cho một site

    Returns:
        tuple: (output_sql, site_records)
        site_records = {
            'sv_records': [...],
            'gv_records': [...],
            'phong_records': [...],
            'lop_hoc_phan_records': [...],
            'enrollments': [...]
        }
    """

    info = SITES[ma_coso]
    site_code = get_site_code(ma_coso)
    now_str = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    output = "-- ============================================================\n"
    output += f"-- DU LIEU CUC BO - Site {ma_coso} ({info['name']})\n"
    output += f"-- Sinh: {now_str}\n"
    output += "-- ============================================================\n\n"

    # ============================================================
    # 1. SINH VIÊN - Tạo records trước để biết ID
    # ============================================================

    output += "-- ---- SinhVien Records (pre-generated) ----\n"
    sv_records = []
    sv_counter = {}  # Đếm theo từng khoa: {ma_khoa: stt}

    # Phân bổ SV cho các khoa
    sv_per_khoa = counts['sinh_vien'] // len(KHOA_LIST)
    sv_remainder = counts['sinh_vien'] % len(KHOA_LIST)

    idx = 0
    for i, ma_khoa in enumerate(KHOA_LIST):
        # Số SV cho khoa này
        num_sv = sv_per_khoa
        if i < sv_remainder:
            num_sv += 1

        for j in range(num_sv):
            stt = sv_counter.get(ma_khoa, 0) + 1
            sv_counter[ma_khoa] = stt

            ma_sv = build_student_id(ma_coso, ma_khoa, stt)
            ho = random.choice(VIETNAMESE_LAST_NAMES)
            ten = random.choice(VIETNAMESE_FIRST_NAMES)
            ngay_sinh = format_date(random_date(2002, 2006))
            gt = random.choice(['Nam', 'Nu'])
            sdt = random_phone()
            dia_chi = random.choice(VIETNAMESE_ADDRESSES)
            trang_thai = random.choice(['DangHoc', 'DangHoc', 'DangHoc', 'BaoLuu'])
            ngay_nhap_hoc = format_date(random_date(2022, 2024))

            record = {
                'ma_sv': ma_sv,
                'user_id': ma_sv,
                'ho': ho,
                'ten': ten,
                'ngay_sinh': ngay_sinh,
                'gioi_tinh': gt,
                'sdt': sdt,
                'dia_chi': dia_chi,
                'ma_khoa': ma_khoa,
                'trang_thai': trang_thai,
                'ngay_nhap_hoc': ngay_nhap_hoc,
            }
            sv_records.append(record)

    output += f"-- Da tao {len(sv_records)} sinh vien\n\n"

    # ============================================================
    # 2. GIẢNG VIÊN - Tạo records trước để biết ID
    # ============================================================

    output += "-- ---- GiangVien Records (pre-generated) ----\n"
    gv_records = []
    gv_counter = {}  # Đếm theo từng khoa: {ma_khoa: stt}

    # Phân bổ GV cho các khoa
    gv_per_khoa = counts['giang_vien'] // len(KHOA_LIST)
    gv_remainder = counts['giang_vien'] % len(KHOA_LIST)

    idx = 0
    for i, ma_khoa in enumerate(KHOA_LIST):
        # Số GV cho khoa này
        num_gv = gv_per_khoa
        if i < gv_remainder:
            num_gv += 1

        for j in range(num_gv):
            stt = gv_counter.get(ma_khoa, 0) + 1
            gv_counter[ma_khoa] = stt

            ma_gv = build_teacher_id(ma_coso, ma_khoa, stt)
            ho = random.choice(VIETNAMESE_LAST_NAMES)
            ten = random.choice(VIETNAMESE_FIRST_NAMES)
            hv = random.choice(['CN', 'ThS', 'TS', 'PGS'])
            hh = random.choice([None, None, None, 'GTV', 'PGS'])
            sdt = random_phone()
            trang_thai = random.choice(['DangCongTac', 'DangCongTac', 'TamNghi'])
            ngay_vao_lam = format_date(random_date(2010, 2023))

            record = {
                'ma_gv': ma_gv,
                'user_id': ma_gv,
                'ho': ho,
                'ten': ten,
                'hoc_vi': hv,
                'hoc_ham': hh,
                'sdt': sdt,
                'ma_khoa': ma_khoa,
                'trang_thai': trang_thai,
                'ngay_vao_lam': ngay_vao_lam,
            }
            gv_records.append(record)

    output += f"-- Da tao {len(gv_records)} giang vien\n\n"

    # ============================================================
    # 3. USERS - Admin + SinhVien + GiangVien
    # ============================================================

    output += "-- ---- users (Admin) ----\n"
    admin_id = build_admin_id(1)
    admin_hash = hash_password("admin123")
    output += f"""INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{admin_id}', 'admin', '{admin_hash}', 'admin@ptit.edu.vn', 'Admin', '{ma_coso}', 'Active', '{now_str}')
ON CONFLICT ("userId") DO NOTHING;\n"""

    output += "\n-- ---- users (SinhVien) ----\n"
    for sv in sv_records:
        email = random_email(sv['ten'], sv['ho'])
        password_hash = hash_password(sv['ma_sv'])
        output += f"""INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{sv['user_id']}', '{build_username(sv['user_id'])}', '{password_hash}', '{email}', 'SinhVien', '{ma_coso}', 'Active', '{now_str}')
ON CONFLICT ("userId") DO NOTHING;\n"""

    output += "\n-- ---- users (GiangVien) ----\n"
    for gv in gv_records:
        email = random_email(gv['ten'], gv['ho'], f'gv.{site_code.lower()}.ptit.edu.vn')
        password_hash = hash_password(gv['ma_gv'])
        output += f"""INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{gv['user_id']}', '{build_username(gv['user_id'])}', '{password_hash}', '{email}', 'GiangVien', '{ma_coso}', 'Active', '{now_str}')
ON CONFLICT ("userId") DO NOTHING;\n"""

    output += "\n"

    # ============================================================
    # 4. SinhVien
    # ============================================================

    output += "-- ---- SinhVien ----\n"
    for sv in sv_records:
        output += f"""INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('{sv['ma_sv']}', '{sv['user_id']}', '{sv['ho']}', '{sv['ten']}', '{sv['ngay_sinh']}', '{sv['gioi_tinh']}', '{sv['sdt']}', '{sv['dia_chi']}', '{ma_coso}', '{sv['ma_khoa']}', '{sv['trang_thai']}', '{sv['ngay_nhap_hoc']}', '{now_str}')
ON CONFLICT ("MaSV") DO NOTHING;\n"""

    output += "\n"

    # ============================================================
    # 5. GiangVien
    # ============================================================

    output += "-- ---- GiangVien ----\n"
    for gv in gv_records:
        hh_str = f"'{gv['hoc_ham']}'" if gv['hoc_ham'] else 'NULL'
        output += f"""INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('{gv['ma_gv']}', '{gv['user_id']}', '{gv['ho']}', '{gv['ten']}', '{gv['hoc_vi']}', {hh_str}, '{gv['sdt']}', '{ma_coso}', '{gv['ma_khoa']}', '{gv['trang_thai']}', '{gv['ngay_vao_lam']}', '{now_str}')
ON CONFLICT ("MaGV") DO NOTHING;\n"""

    output += "\n"

    # ============================================================
    # 6. PhongHoc
    # ============================================================

    output += "-- ---- PhongHoc ----\n"
    loai_phong_choices = ['LyThuyet', 'LyThuyet', 'LyThuyet', 'MayTinh', 'MayTinh', 'ThiNghiem', 'HoiTruong']
    toa_nha_choices = ['A', 'B', 'C', 'D']
    trang_thai_phong_choices = ['HoatDong', 'HoatDong', 'HoatDong', 'BaoTri']

    phong_records = []
    for i in range(1, counts['phong_hoc'] + 1):
        ma_phong = f"P{ma_coso[:2]}{i:03d}"
        ten_phong = f"Phong {i}"
        toa = random.choice(toa_nha_choices)
        tang = random.randint(1, 5)
        suc_chua = random.choice([30, 40, 50, 60, 80, 100])
        loai = random.choice(loai_phong_choices)
        trang_thai = random.choice(trang_thai_phong_choices)

        phong_records.append({
            'ma_phong': ma_phong,
            'ten_phong': ten_phong,
        })

        output += f"""INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('{ma_phong}', '{ten_phong}', '{toa}', {tang}, {suc_chua}, '{loai}', '{ma_coso}', '{trang_thai}', '{now_str}')
ON CONFLICT ("MaPhong") DO NOTHING;\n"""

    output += "\n"

    # ============================================================
    # 7. LopHocPhan
    # ============================================================

    output += "-- ---- LopHocPhan ----\n"
    hoc_phans_for_site = ['CS1001', 'CS1002', 'CS1003', 'CS1004', 'CS1005', 'CS1006',
                          'CS1007', 'CS1008', 'CS1009', 'CS1010', 'VT2001', 'CS1011']
    hinh_thuc_choices = ['Offline', 'Offline', 'Offline', 'Online', 'Hybrid']
    trang_thai_lop_choices = ['Mo', 'Mo', 'Mo', 'Mo', 'Dong']  # Phần lớn đang mở

    lop_hoc_phan_records = []
    nhom_counter = {}

    for i in range(1, counts['lop_hoc_phan'] + 1):
        ma_hp = random.choice(hoc_phans_for_site)

        if ma_hp not in nhom_counter:
            nhom_counter[ma_hp] = 1
        else:
            nhom_counter[ma_hp] += 1
        nhom = nhom_counter[ma_hp]

        ma_lhp = f"{ma_hp}-{ma_coso}-{nhom:02d}"

        # Lấy GV cùng khoa với HocPhan (hoặc fallback)
        hp_khoa = next((hp[6] for hp in [
            ('CS1001', 'Nhap mon lap trinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Mon co so'),
            ('CS1002', 'Cau truc du lieu', 4, 40, 30, 'BatBuoc', 'CNTT', 'Mon nen tang'),
            ('CS1003', 'Co so du lieu', 3, 30, 30, 'BatBuoc', 'CNTT', 'Quan tri CSDL'),
            ('CS1004', 'Mang may tinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Nen tang mang'),
            ('CS1005', 'Tri tue nhan tao', 3, 30, 30, 'TuChon', 'CNTT', 'AI co ban'),
            ('CS1006', 'He dieu hanh', 3, 30, 30, 'BatBuoc', 'CNTT', 'OS fundamentals'),
            ('CS1007', 'Phan tich va thiet ke', 3, 30, 30, 'BatBuoc', 'CNTT', 'System analysis'),
            ('CS1008', 'Lap trinh huong doi tuong', 3, 30, 30, 'BatBuoc', 'CNTT', 'OOP'),
            ('CS1009', 'An toan thong tin', 3, 30, 30, 'BatBuoc', 'ATTT', 'Security basics'),
            ('CS1010', 'Mat ma ung dung', 3, 30, 30, 'TuChon', 'ATTT', 'Applied cryptography'),
            ('VT2001', 'Truyen dan so', 3, 30, 30, 'BatBuoc', 'VT', 'Digital transmission'),
            ('VT2002', 'Thong tin di dong', 3, 30, 30, 'TuChon', 'VT', 'Mobile communications'),
            ('CS1011', 'Cong nghe Web', 3, 30, 30, 'BatBuoc', 'CNTT', 'Web development'),
        ] if hp[0] == ma_hp), 'CNTT')

        # Tìm GV cùng khoa
        gv_same_khoa = [g for g in gv_records if g['ma_khoa'] == hp_khoa]
        if gv_same_khoa:
            selected_gv = random.choice(gv_same_khoa)
        else:
            selected_gv = random.choice(gv_records)
        ma_gv = selected_gv['ma_gv']

        # Sức chứa: một số lớp nhỏ để test
        if i <= 3:
            si_so_max = random.choice(SMALL_CLASS_SIZES)
        else:
            si_so_max = random.choice([30, 40, 50, 60])

        # Một số lớp đã có SV đăng ký
        si_so_hien_tai = random.randint(0, min(si_so_max // 2, 15))
        hinh_thuc = random.choice(hinh_thuc_choices)
        trang_thai = random.choice(trang_thai_lop_choices)

        lop_hoc_phan_records.append({
            'ma_lhp': ma_lhp,
            'ma_hp': ma_hp,
            'ma_gv': ma_gv,
            'si_so_max': si_so_max,
            'si_so_hien_tai': si_so_hien_tai,
        })

        output += f"""INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('{ma_lhp}', '{ma_hp}', '{CURRENT_SEMESTER}', '{ma_coso}', '{ma_gv}', '{ma_hp}-{nhom:02d}', {si_so_max}, {si_so_hien_tai}, '{hinh_thuc}', '{trang_thai}', '{now_str}')
ON CONFLICT ("MaLopHP") DO NOTHING;\n"""

    output += "\n"

    # ============================================================
    # 8. LichHoc
    # ============================================================

    output += "-- ---- LichHoc ----\n"
    thu_choices = [2, 3, 4, 5, 6, 7]
    tiet_bat_dau_choices = [1, 4, 7, 10]
    so_tiet_choices = [2, 3, 4]

    ngay_bd_hk = date(2025, 9, 1)
    ngay_kt_hk = date(2025, 12, 31)

    lich_id = 1
    lich_records = []
    for lhp in lop_hoc_phan_records:
        for j in range(random.randint(1, counts['lich_hoc'])):
            ma_lich = f"L{ma_coso[:2]}{lich_id:04d}"
            ma_phong = random.choice(phong_records)['ma_phong']
            thu = random.choice(thu_choices)
            tiet = random.choice(tiet_bat_dau_choices)
            so_tiet = random.choice(so_tiet_choices)

            lich_records.append({
                'ma_lich': ma_lich,
                'ma_lhp': lhp['ma_lhp'],
                'ma_phong': ma_phong,
            })

            output += f"""INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('{ma_lich}', '{lhp['ma_lhp']}', '{ma_phong}', {thu}, {tiet}, {so_tiet}, '{format_date(ngay_bd_hk)}', '{format_date(ngay_kt_hk)}', NULL)
ON CONFLICT ("MaLich") DO NOTHING;\n"""
            lich_id += 1

    output += "\n"

    # ============================================================
    # 9. DangKy (ĐĂNG KÝ MẪU)
    # MaDangKy là autoincrement - không cần insert thủ công
    # ============================================================

    output += "-- ---- DangKy (Demo Enrollments) ----\n"

    dk_id = 1
    used_combinations = set()  # Tránh trùng (userId, MaHP, MaHocKy)
    enrollment_list = []

    # Mỗi SV đăng ký 2-3 môn
    for sv in sv_records[:5]:  # 5 SV đầu có đăng ký mẫu
        num_enrollments = random.randint(2, 3)
        enrolled_lophp = []

        for _ in range(num_enrollments):
            if not lop_hoc_phan_records:
                break

            lhp = random.choice(lop_hoc_phan_records)
            if lhp['ma_lhp'] in enrolled_lophp:
                continue

            combo_key = (sv['user_id'], lhp['ma_hp'], CURRENT_SEMESTER)
            if combo_key in used_combinations:
                continue

            used_combinations.add(combo_key)
            enrolled_lophp.append(lhp['ma_lhp'])

            ngay_dk = format_datetime(datetime(2025, 9, 5, random.randint(8, 17), random.randint(0, 59)))

            enrollment_list.append({
                'userId': sv['user_id'],
                'MaSV': sv['ma_sv'],
                'MaLopHP': lhp['ma_lhp'],
                'MaHP': lhp['ma_hp'],
                'MaHocKy': CURRENT_SEMESTER,
                'NgayDangKy': ngay_dk,
                'TrangThaiDangKy': 'DaDangKy',
                'LanDangKy': 1,
            })

            output += f"""INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
VALUES ('{sv['user_id']}', '{sv['ma_sv']}', '{lhp['ma_lhp']}', '{lhp['ma_hp']}', '{CURRENT_SEMESTER}', '{ngay_dk}', 'DaDangKy', 1, NULL)
ON CONFLICT DO NOTHING;\n"""
            dk_id += 1

    output += "\n"

    site_records = {
        'sv_records': sv_records,
        'gv_records': gv_records,
        'phong_records': phong_records,
        'lop_hoc_phan_records': lop_hoc_phan_records,
        'lich_records': lich_records,
        'enrollments': enrollment_list,
    }

    return output, site_records


# ============================================================
# DỮ LIỆU DEMO ĐẶC BIỆT
# ============================================================

def generate_demo_accounts(site_records_all: dict):
    """Tạo SQL cho các demo accounts cố định

    Args:
        site_records_all: dict chứa records của tất cả sites
    """

    output = "-- ============================================================\n"
    output += "-- DU LIEU DEMO ACCOUNTS\n"
    output += "-- Cac tai khoan nay co the login thuc su\n"
    output += f"-- Sinh: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    output += "-- ============================================================\n\n"

    now_str = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # === ADMIN ===
    output += "-- Admin HADONG (login: admin / admin123)\n"
    admin_id = build_admin_id(1)
    admin_hash = hash_password("admin123")
    output += f"""INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{admin_id}', 'admin', '{admin_hash}', 'admin@ptit.edu.vn', 'Admin', 'HADONG', 'Active', '{now_str}')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password", "username" = EXCLUDED."username";
"""

    # === SINH VIÊN DEMO - HADONG ===
    # Tìm SV CNTT đầu tiên của HADONG
    hadong_sv = None
    for sv in site_records_all['HADONG']['sv_records']:
        if sv['ma_khoa'] == 'CNTT':
            hadong_sv = sv
            break

    if hadong_sv:
        output += f"""
-- Student HADONG CNTT (login: {hadong_sv['ma_sv'].lower()} / {hadong_sv['ma_sv']})
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{hadong_sv['user_id']}', '{build_username(hadong_sv['user_id'])}', '{hash_password(hadong_sv['ma_sv'])}', 'student.hadong@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '{now_str}')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password", "username" = EXCLUDED."username";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('{hadong_sv['ma_sv']}', '{hadong_sv['user_id']}', 'Nguyen', 'Minh', '2003-05-15', 'Nam', '0912345678', 'Ha Noi', 'HADONG', 'CNTT', 'DangHoc', '2021-09-01', '{now_str}')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";
"""
    else:
        # Fallback: tạo SV demo nếu chưa có
        demo_sv_id = build_student_id('HADONG', 'CNTT', 999)
        output += f"""
-- Student HADONG CNTT (fallback, login: {demo_sv_id.lower()} / {demo_sv_id})
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{demo_sv_id}', '{demo_sv_id.lower()}', '{hash_password(demo_sv_id)}', 'student.hadong@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '{now_str}')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('{demo_sv_id}', '{demo_sv_id}', 'Nguyen', 'Minh', '2003-05-15', 'Nam', '0912345678', 'Ha Noi', 'HADONG', 'CNTT', 'DangHoc', '2021-09-01', '{now_str}')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";
"""

    # === GIẢNG VIÊN DEMO - HADONG ===
    hadong_gv = None
    for gv in site_records_all['HADONG']['gv_records']:
        if gv['ma_khoa'] == 'CNTT':
            hadong_gv = gv
            break

    if hadong_gv:
        output += f"""
-- Teacher HADONG CNTT (login: {hadong_gv['ma_gv'].lower()} / {hadong_gv['ma_gv']})
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{hadong_gv['user_id']}', '{build_username(hadong_gv['user_id'])}', '{hash_password(hadong_gv['ma_gv'])}', 'teacher.hadong@ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '{now_str}')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password", "username" = EXCLUDED."username";

INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('{hadong_gv['ma_gv']}', '{hadong_gv['user_id']}', 'Tran', 'Anh', 'TS', 'GTV', '0987654321', 'HADONG', 'CNTT', 'DangCongTac', '2015-09-01', '{now_str}')
ON CONFLICT ("MaGV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";
"""

    # === SINH VIÊN NGOCTRUC ===
    ngoctruc_sv = None
    for sv in site_records_all['NGOCTRUC']['sv_records']:
        if sv['ma_khoa'] == 'CNTT':
            ngoctruc_sv = sv
            break

    if ngoctruc_sv:
        output += f"""
-- Student NGOCTRUC CNTT (login: {ngoctruc_sv['ma_sv'].lower()} / {ngoctruc_sv['ma_sv']})
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{ngoctruc_sv['user_id']}', '{build_username(ngoctruc_sv['user_id'])}', '{hash_password(ngoctruc_sv['ma_sv'])}', 'student.ngoctruc@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '{now_str}')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('{ngoctruc_sv['ma_sv']}', '{ngoctruc_sv['user_id']}', 'Le', 'Binh', '2003-08-20', 'Nam', '0901234567', 'Hai Phong', 'NGOCTRUC', 'CNTT', 'DangHoc', '2021-09-01', '{now_str}')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";
"""

    # === SINH VIÊN HOALAC ===
    hoalac_sv = None
    for sv in site_records_all['HOALAC']['sv_records']:
        if sv['ma_khoa'] == 'CNTT':
            hoalac_sv = sv
            break

    if hoalac_sv:
        output += f"""
-- Student HOALAC CNTT (login: {hoalac_sv['ma_sv'].lower()} / {hoalac_sv['ma_sv']})
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('{hoalac_sv['user_id']}', '{build_username(hoalac_sv['user_id'])}', '{hash_password(hoalac_sv['ma_sv'])}', 'student.hoalac@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '{now_str}')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('{hoalac_sv['ma_sv']}', '{hoalac_sv['user_id']}', 'Pham', 'Lan', '2003-03-10', 'Nu', '0909876543', 'Hoa Lac', 'HOALAC', 'CNTT', 'DangHoc', '2021-09-01', '{now_str}')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";
"""

    output += "\n"
    return output


# ============================================================
# DỮ LIỆU DEMO ENROLLMENTS
# ============================================================

def generate_demo_enrollments(site_records_all: dict):
    """Tạo dữ liệu đăng ký demo"""

    output = "-- ============================================================\n"
    output += "-- DU LIEU DEMO ENROLLMENTS\n"
    output += "-- Phuc vu demo: register/cancel/history\n"
    output += f"-- Sinh: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    output += "-- ============================================================\n\n"

    # Lấy SV demo của HADONG
    hadong_sv = None
    for sv in site_records_all['HADONG']['sv_records']:
        if sv['ma_khoa'] == 'CNTT':
            hadong_sv = sv
            break

    if hadong_sv:
        # Tìm lớp để đăng ký
        lop_list = site_records_all['HADONG']['lop_hoc_phan_records']
        if len(lop_list) >= 2:
            lhp1 = lop_list[0]
            lhp2 = lop_list[1]

            ngay_dk1 = format_datetime(datetime(2025, 9, 5, 9, 0))
            ngay_dk2 = format_datetime(datetime(2025, 9, 5, 10, 30))

            output += f"""-- Enrollment cho {hadong_sv['ma_sv']} (co the huy)
INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
VALUES ('{hadong_sv['user_id']}', '{hadong_sv['ma_sv']}', '{lhp1['ma_lhp']}', '{lhp1['ma_hp']}', '{CURRENT_SEMESTER}', '{ngay_dk1}', 'DaDangKy', 1, 'Mon co so')
ON CONFLICT DO NOTHING;

INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
VALUES ('{hadong_sv['user_id']}', '{hadong_sv['ma_sv']}', '{lhp2['ma_lhp']}', '{lhp2['ma_hp']}', '{CURRENT_SEMESTER}', '{ngay_dk2}', 'DaDangKy', 1, 'Mon nen tang')
ON CONFLICT DO NOTHING;

-- Update SiSoHienTai
UPDATE "LopHocPhan" SET "SiSoHienTai" = "SiSoHienTai" + 1 WHERE "MaLopHP" IN ('{lhp1['ma_lhp']}', '{lhp2['ma_lhp']}');
"""

    output += "\n"
    return output


# ============================================================
# DỮ LIỆU DEMO CLASS SECTIONS
# ============================================================

def generate_demo_class_sections(site_records_all: dict):
    """Tạo dữ liệu lớp học phần demo"""

    output = "-- ============================================================\n"
    output += "-- DU LIEU DEMO CLASS SECTIONS\n"
    output += "-- Lop hoc phan cho demo: register/cancel/history\n"
    output += f"-- Sinh: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    output += "-- ============================================================\n\n"

    now_str = datetime.now().strftime('%Y-%m-%d %H:%M:%S')

    # === Lớp cho HADONG ===
    hadong_gv = None
    for gv in site_records_all['HADONG']['gv_records']:
        if gv['ma_khoa'] == 'CNTT':
            hadong_gv = gv
            break

    if hadong_gv:
        output += f"""-- Lop HADONG CNTT
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-HADONG-01', 'CS1001', '{CURRENT_SEMESTER}', 'HADONG', '{hadong_gv['ma_gv']}', 'CS1001-01', 40, 1, 'Offline', 'Mo', '{now_str}')
ON CONFLICT ("MaLopHP") DO NOTHING;

INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1002-HADONG-01', 'CS1002', '{CURRENT_SEMESTER}', 'HADONG', '{hadong_gv['ma_gv']}', 'CS1002-01', 15, 15, 'Offline', 'Mo', '{now_str}')
ON CONFLICT ("MaLopHP") DO NOTHING;
"""

    # === Lớp cho NGOCTRUC ===
    ngoctruc_gv = None
    for gv in site_records_all['NGOCTRUC']['gv_records']:
        if gv['ma_khoa'] == 'CNTT':
            ngoctruc_gv = gv
            break

    if ngoctruc_gv:
        output += f"""
-- Lop NGOCTRUC CNTT
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-NGOCTRUC-01', 'CS1001', '{CURRENT_SEMESTER}', 'NGOCTRUC', '{ngoctruc_gv['ma_gv']}', 'CS1001-01', 40, 0, 'Offline', 'Mo', '{now_str}')
ON CONFLICT ("MaLopHP") DO NOTHING;
"""

    # === Lớp cho HOALAC ===
    hoalac_gv = None
    for gv in site_records_all['HOALAC']['gv_records']:
        if gv['ma_khoa'] == 'CNTT':
            hoalac_gv = gv
            break

    if hoalac_gv:
        output += f"""
-- Lop HOALAC CNTT
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-HOALAC-01', 'CS1001', '{CURRENT_SEMESTER}', 'HOALAC', '{hoalac_gv['ma_gv']}', 'CS1001-01', 40, 0, 'Offline', 'Mo', '{now_str}')
ON CONFLICT ("MaLopHP") DO NOTHING;
"""

    # === LichHoc demo ===
    # Sử dụng phòng thực từ site HADONG
    hadong_phong = site_records_all['HADONG']['phong_records'][0] if site_records_all['HADONG']['phong_records'] else None
    if hadong_phong:
        output += f"""
-- LichHoc demo cho CS1001-HADONG-01
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHD001', 'CS1001-HADONG-01', '{hadong_phong['ma_phong']}', 2, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;

INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHD002', 'CS1001-HADONG-01', '{hadong_phong['ma_phong']}', 4, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
"""

    output += "\n"
    return output


# ============================================================
# MAIN - Generate tất cả data
# ============================================================

def main():
    """Generate tất cả dữ liệu seed"""

    # Tạo thư mục output
    output_dir = os.path.join(os.path.dirname(__file__), 'output')
    common_dir = os.path.join(output_dir, 'common')
    site_dirs = {
        'HADONG': os.path.join(output_dir, 'site_hadong'),
        'NGOCTRUC': os.path.join(output_dir, 'site_ngoctruc'),
        'HOALAC': os.path.join(output_dir, 'site_hoalac'),
    }

    for d in [output_dir, common_dir] + list(site_dirs.values()):
        os.makedirs(d, exist_ok=True)

    # Lưu records của tất cả sites để dùng cho demo
    site_records_all = {}

    # 1. Generate dữ liệu CHUNG
    print("Generating common data...")
    common_sql = generate_common_data()
    common_file = os.path.join(common_dir, '001_common_data.sql')
    with open(common_file, 'w', encoding='utf-8') as f:
        f.write(common_sql)
    print(f"  -> {common_file}")

    # 2. Generate dữ liệu cho từng SITE
    for ma_coso, site_dir in site_dirs.items():
        print(f"Generating data for {ma_coso}...")
        site_sql, site_records = generate_site_data(ma_coso, DEFAULT_COUNTS)
        site_records_all[ma_coso] = site_records
        site_file = os.path.join(site_dir, '001_site_data.sql')
        with open(site_file, 'w', encoding='utf-8') as f:
            f.write(site_sql)
        print(f"  -> {site_file}")

    # 3. Generate demo accounts
    print("Generating demo accounts...")
    demo_sql = generate_demo_accounts(site_records_all)
    demo_file = os.path.join(output_dir, 'demo_accounts.sql')
    with open(demo_file, 'w', encoding='utf-8') as f:
        f.write(demo_sql)
    print(f"  -> {demo_file}")

    # 4. Generate demo enrollments
    print("Generating demo enrollments...")
    enroll_sql = generate_demo_enrollments(site_records_all)
    enroll_file = os.path.join(output_dir, 'demo_enrollments.sql')
    with open(enroll_file, 'w', encoding='utf-8') as f:
        f.write(enroll_sql)
    print(f"  -> {enroll_file}")

    # 5. Generate demo class sections
    print("Generating demo class sections...")
    class_sql = generate_demo_class_sections(site_records_all)
    class_file = os.path.join(output_dir, 'demo_class_sections.sql')
    with open(class_file, 'w', encoding='utf-8') as f:
        f.write(class_sql)
    print(f"  -> {class_file}")

    # Print demo accounts info
    print("\n" + "=" * 60)
    print("Seed data generated successfully!")
    print("=" * 60)
    print(f"\nOutput directory: {output_dir}")

    # Lấy thông tin demo accounts
    hd_sv = site_records_all['HADONG']['sv_records'][0] if site_records_all['HADONG']['sv_records'] else None
    nt_sv = site_records_all['NGOCTRUC']['sv_records'][0] if site_records_all['NGOCTRUC']['sv_records'] else None
    hl_sv = site_records_all['HOALAC']['sv_records'][0] if site_records_all['HOALAC']['sv_records'] else None
    hd_gv = site_records_all['HADONG']['gv_records'][0] if site_records_all['HADONG']['gv_records'] else None

    print("\n" + "=" * 60)
    print("DEMO ACCOUNTS:")
    print("=" * 60)
    print(f"Admin HADONG: username=admin, password=admin123")
    if hd_sv:
        print(f"Student HADONG: username={hd_sv['ma_sv'].lower()}, password={hd_sv['ma_sv']}")
    if hd_gv:
        print(f"Teacher HADONG: username={hd_gv['ma_gv'].lower()}, password={hd_gv['ma_gv']}")
    if nt_sv:
        print(f"Student NGOCTRUC: username={nt_sv['ma_sv'].lower()}, password={nt_sv['ma_sv']}")
    if hl_sv:
        print(f"Student HOALAC: username={hl_sv['ma_sv'].lower()}, password={hl_sv['ma_sv']}")
    print("=" * 60)


if __name__ == '__main__':
    main()
