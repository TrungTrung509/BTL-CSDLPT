# ============================================================
# CƠ SỞ DỮ LIỆU PHÂN TÁN - ĐỀ TÀI: ĐĂNG KÝ HỌC PHẦN
# Tác giả: Nhóm CSDL Phân Tán
# Mô tả: Script generate dữ liệu seed cho 3 site
# ============================================================

import random
import os
from datetime import datetime, timedelta
from faker import Faker

# ============================================================
# CẤU HÌNH
# ============================================================

fake = Faker()

# Danh sách tên tiếng Việt cố định (tránh lỗi Faker vi_VN)
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

# Mapping site - cơ sở
SITES = {
    'HADONG': {
        'name': 'Cơ sở Hà Nội',
        'address': 'Hà Nội',
        'khoa_prefix': 'CNTT-HD'
    },
    'NGOCTRUC': {
        'name': 'Cơ sở Ngọc Trục',
        'address': 'Ngọc Trục',
        'khoa_prefix': 'CNTT-NT'
    },
    'HOALAC': {
        'name': 'Cơ sở Hòa Lạc',
        'address': 'Hòa Lạc',
        'khoa_prefix': 'CNTT-HL'
    }
}

# Số lượng data mặc định
DEFAULT_COUNTS = {
    'sinh_vien': 120,       # 120 SV mỗi site
    'giang_vien': 30,       # 30 GV mỗi site
    'phong_hoc': 20,        # 20 phòng mỗi site
    'lop_hoc_phan': 25,     # 25 lớp HP mỗi site (một số nhỏ có sức chứa 15)
    'lich_hoc': 3,          # 3 buổi/lớp HP
}

# Lớp có sức chứa nhỏ để test race condition
SMALL_CLASS_SIZES = [10, 12, 15]  # Các lớp này sẽ có sức chứa 10-15

# ============================================================
# HÀM HELPER
# ============================================================

def random_phone():
    """Sinh số điện thoại ngẫu nhiên"""
    return f"0{random.randint(90, 99)}{random.randint(1000000, 9999999)}"

def random_email(first_name, last_name, domain='ptit.edu.vn'):
    """Sinh email từ tên - không dấu tiếng Việt"""
    # Chuẩn hóa: bỏ dấu tiếng Việt
    first_norm = first_name.lower().replace('đ', 'd').replace('ă', 'a').replace('â', 'a')
    first_norm = first_norm.replace('ê', 'e').replace('ô', 'o').replace('ơ', 'o').replace('ư', 'u').replace('ự', 'u')
    first_norm = first_norm.replace('á', 'a').replace('à', 'a').replace('ả', 'a').replace('ạ', 'a')
    first_norm = first_norm.replace('ắ', 'a').replace('ằ', 'a').replace('ẳ', 'a').replace('ặ', 'a')
    first_norm = first_norm.replace('ấ', 'a').replace('ầ', 'a').replace('ẩ', 'a').replace('ậ', 'a')
    first_norm = first_norm.replace('é', 'e').replace('è', 'e').replace('ẻ', 'e').replace('ẽ', 'e').replace('ẹ', 'e')
    first_norm = first_norm.replace('ế', 'e').replace('ề', 'e').replace('ể', 'e').replace('ễ', 'e').replace('ệ', 'e')
    first_norm = first_norm.replace('í', 'i').replace('ì', 'i').replace('ỉ', 'i').replace('ĩ', 'i').replace('ị', 'i')
    first_norm = first_norm.replace('ó', 'o').replace('ò', 'o').replace('ỏ', 'o').replace('õ', 'o').replace('ọ', 'o')
    first_norm = first_norm.replace('ố', 'o').replace('ồ', 'o').replace('ổ', 'o').replace('ỗ', 'o').replace('ộ', 'o')
    first_norm = first_norm.replace('ớ', 'o').replace('ờ', 'o').replace('ở', 'o').replace('ỡ', 'o').replace('ợ', 'o')
    first_norm = first_norm.replace('ú', 'u').replace('ù', 'u').replace('ủ', 'u').replace('ũ', 'u').replace('ụ', 'u')
    first_norm = first_norm.replace('ứ', 'u').replace('ừ', 'u').replace('ử', 'u').replace('ữ', 'u').replace('ự', 'u')
    first_norm = first_norm.replace('ý', 'y').replace('ỳ', 'y').replace('ỷ', 'y').replace('ỹ', 'y').replace('ỵ', 'y')

    last_norm = last_name.lower().replace('đ', 'd').replace('ă', 'a').replace('â', 'a')
    last_norm = last_norm.replace('ê', 'e').replace('ô', 'o').replace('ơ', 'o').replace('ư', 'u').replace('ự', 'u')
    last_norm = last_norm.replace('á', 'a').replace('à', 'a').replace('ả', 'a').replace('ạ', 'a')
    last_norm = last_norm.replace('ắ', 'a').replace('ằ', 'a').replace('ẳ', 'a').replace('ặ', 'a')
    last_norm = last_norm.replace('ấ', 'a').replace('ầ', 'a').replace('ẩ', 'a').replace('ậ', 'a')
    last_norm = last_norm.replace('é', 'e').replace('è', 'e').replace('ẻ', 'e').replace('ẽ', 'e').replace('ẹ', 'e')
    last_norm = last_norm.replace('ế', 'e').replace('ề', 'e').replace('ể', 'e').replace('ễ', 'e').replace('ệ', 'e')
    last_norm = last_norm.replace('í', 'i').replace('ì', 'i').replace('ỉ', 'i').replace('ĩ', 'i').replace('ị', 'i')
    last_norm = last_norm.replace('ó', 'o').replace('ò', 'o').replace('ỏ', 'o').replace('õ', 'o').replace('ọ', 'o')
    last_norm = last_norm.replace('ố', 'o').replace('ồ', 'o').replace('ổ', 'o').replace('ỗ', 'o').replace('ộ', 'o')
    last_norm = last_norm.replace('ớ', 'o').replace('ờ', 'o').replace('ở', 'o').replace('ỡ', 'o').replace('ợ', 'o')
    last_norm = last_norm.replace('ú', 'u').replace('ù', 'u').replace('ủ', 'u').replace('ũ', 'u').replace('ụ', 'u')
    last_norm = last_norm.replace('ứ', 'u').replace('ừ', 'u').replace('ử', 'u').replace('ữ', 'u').replace('ự', 'u')
    last_norm = last_norm.replace('ý', 'y').replace('ỳ', 'y').replace('ỷ', 'y').replace('ỹ', 'y').replace('ỵ', 'y')

    return f"{first_norm}.{last_norm}{random.randint(1, 999)}@{domain}"

def random_date(start_year=2000, end_year=2024):
    """Sinh ngày ngẫu nhiên"""
    start = datetime(start_year, 1, 1)
    end = datetime(end_year, 12, 31)
    delta = end - start
    random_days = random.randint(0, delta.days)
    return start + timedelta(days=random_days)

def random_date_between(start, end):
    """Sinh ngày ngẫu nhiên trong khoảng"""
    delta = end - start
    random_days = random.randint(0, delta.days)
    return start + timedelta(days=random_days)

# ============================================================
# DỮ LIỆU CHUNG (COMMON) - Sinh 1 lần, dùng cho cả 3 site
# ============================================================

def generate_common_data():
    """Sinh dữ liệu cho bảng dùng chung (CoSo, Khoa, HocPhan, HocKy, TienQuyet)"""
    
    output = "-- ============================================================\n"
    output += "-- DỮ LIỆU DÙNG CHUNG - Common Data\n"
    output += "-- Sinh: " + datetime.now().strftime("%Y-%m-%d %H:%M:%S") + "\n"
    output += "-- ============================================================\n\n"
    
    # ---- CoSo ----
    output += "-- ---- CoSo ----\n"
    for ma_coso, info in SITES.items():
        output += f"""INSERT INTO CoSo (MaCoSo, TenCoSo, DiaChi, SoDienThoai, Email, NgayThanhLap, TrangThai)
VALUES ('{ma_coso}', '{info['name']}', '{info['address']}', '{random_phone()}', 'quanly{ma_coso.lower()}@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT (MaCoSo) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- Khoa ----
    output += "-- ---- Khoa ----\n"
    khoas = [
        ('CNTT', 'Khoa Công nghệ thông tin', 'CNTT'),
        ('ATTT', 'Khoa An toàn thông tin', 'ATTT'),
        ('VT', 'Khoa Viễn thông', 'VT'),
        ('KT', 'Khoa Kinh tế', 'KT'),
    ]
    for ma_khoa, ten_khoa, _ in khoas:
        output += f"""INSERT INTO Khoa (MaKhoa, TenKhoa, MoTa, NgayThanhLap, TrangThai)
VALUES ('{ma_khoa}', '{ten_khoa}', 'Khoa dao tao nganh {ma_khoa}', '2000-01-01', 'HoatDong')
ON CONFLICT (MaKhoa) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- HocPhan ----
    output += "-- ---- HocPhan ----\n"
    hoc_phans = [
        ('CS1001', 'Nhập môn lập trình', 3, 30, 30, 'BatBuoc', 'CNTT', 'Môn học cơ sở ngành CNTT'),
        ('CS1002', 'Cấu trúc dữ liệu và giải thuật', 4, 40, 30, 'BatBuoc', 'CNTT', 'Môn học nền tảng'),
        ('CS1003', 'Cơ sở dữ liệu', 3, 30, 30, 'BatBuoc', 'CNTT', 'Quản trị CSDL'),
        ('CS1004', 'Mạng máy tính', 3, 30, 30, 'BatBuoc', 'CNTT', 'Nền tảng mạng'),
        ('CS1005', 'Trí tuệ nhân tạo', 3, 30, 30, 'TuChon', 'CNTT', 'AI cơ bản'),
        ('CS1006', 'Hệ điều hành', 3, 30, 30, 'BatBuoc', 'CNTT', 'OS fundamentals'),
        ('CS1007', 'Phân tích và thiết kế hệ thống', 3, 30, 30, 'BatBuoc', 'CNTT', 'System analysis'),
        ('CS1008', 'Lập trình hướng đối tượng', 3, 30, 30, 'BatBuoc', 'CNTT', 'OOP'),
        ('CS1009', 'An toàn thông tin', 3, 30, 30, 'BatBuoc', 'ATTT', 'Security basics'),
        ('CS1010', 'Mật mã ứng dụng', 3, 30, 30, 'TuChon', 'ATTT', 'Applied cryptography'),
        ('VT2001', 'Truyền dẫn số', 3, 30, 30, 'BatBuoc', 'VT', 'Digital transmission'),
        ('VT2002', 'Thông tin di động', 3, 30, 30, 'TuChon', 'VT', 'Mobile communications'),
        ('CS1011', 'Công nghệ Web', 3, 30, 30, 'BatBuoc', 'CNTT', 'Web development'),
        ('CS1012', 'Đồ họa máy tính', 3, 30, 30, 'TuChon', 'CNTT', 'Computer graphics'),
        ('CS1013', 'Kiến trúc máy tính', 3, 30, 30, 'BatBuoc', 'CNTT', 'Computer architecture'),
        ('CS1014', 'Toán rời rạc', 3, 45, 0, 'BatBuoc', 'CNTT', 'Discrete mathematics'),
        ('CS1015', 'Xác suất thống kê', 3, 30, 30, 'BatBuoc', 'CNTT', 'Probability & Statistics'),
        ('KT1001', 'Kinh tế vi mô', 3, 45, 0, 'BatBuoc', 'KT', 'Microeconomics'),
        ('KT1002', 'Kinh tế vĩ mô', 3, 45, 0, 'BatBuoc', 'KT', 'Macroeconomics'),
        ('CS1016', 'Thực tập tốt nghiệp', 4, 0, 120, 'BatBuoc', 'CNTT', 'Internship'),
    ]
    
    for ma_hp, ten_hp, so_tc, so_lt, so_th, loai, ma_khoa, mo_ta in hoc_phans:
        output += f"""INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('{ma_hp}', '{ten_hp}', {so_tc}, {so_lt}, {so_th}, '{loai}', '{ma_khoa}', '{mo_ta}', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- HocKy ----
    output += "-- ---- HocKy ----\n"
    hoc_ky_data = [
        ('HK20251', '2025-2026', 1, '2025-09-01', '2025-12-31', 'DangDangKy'),
        ('HK20252', '2025-2026', 2, '2026-01-01', '2026-05-31', 'SapMo'),
        ('HK20261', '2026-2027', 1, '2026-09-01', '2026-12-31', 'SapMo'),
    ]
    for ma_hk, nam_hoc, ky_so, ngay_bd, ngay_kt, trang_thai in hoc_ky_data:
        output += f"""INSERT INTO HocKy (MaHocKy, NamHoc, KySo, NgayBatDau, NgayKetThuc, TrangThaiHocKy)
VALUES ('{ma_hk}', '{nam_hoc}', {ky_so}, '{ngay_bd}', '{ngay_kt}', '{trang_thai}')
ON CONFLICT (MaHocKy) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- TienQuyet ----
    output += "-- ---- TienQuyet ----\n"
    tien_quyet = [
        ('CS1002', 'CS1001'),  # CTDL & GT cần NMLT
        ('CS1003', 'CS1001'),  # CSDL cần NMLT
        ('CS1004', 'CS1001'),  # Mạng cần NMLT
        ('CS1006', 'CS1001'),  # HĐH cần NMLT
        ('CS1006', 'CS1013'),  # HĐH cần KTMT
        ('CS1007', 'CS1002'),  # PT&THHTTT cần CTDL
        ('CS1008', 'CS1001'),  # OOP cần NMLT
        ('CS1005', 'CS1002'),  # AI cần CTDL
        ('CS1011', 'CS1001'),  # Web cần NMLT
        ('CS1011', 'CS1008'),  # Web cần OOP
        ('CS1012', 'CS1001'),  # ĐHMT cần NMLT
    ]
    for ma_hp, ma_hp_tq in tien_quyet:
        output += f"""INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('{ma_hp}', '{ma_hp_tq}')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;\n"""
    
    return output

# ============================================================
# DỮ LIỆU CỤC BỘ THEO SITE
# ============================================================

def generate_site_data(ma_coso, counts):
    """Sinh dữ liệu cục bộ cho một site"""
    
    info = SITES[ma_coso]
    
    output = "-- ============================================================\n"
    output += f"-- DỮ LIỆU CỤC BỘ - Site {ma_coso} ({info['name']})\n"
    output += f"-- Sinh: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n"
    output += "-- ============================================================\n\n"
    
    # ---- SinhVien ----
    output += "-- ---- SinhVien ----\n"
    gioi_tinh = ['Nam', 'Nu']
    trang_thai_sv = ['DangHoc', 'DangHoc', 'DangHoc', 'BaoLuu']  # 75% đang học

    for i in range(1, counts['sinh_vien'] + 1):
        ma_sv = f"{ma_coso}SV{i:04d}"
        ho = random.choice(VIETNAMESE_LAST_NAMES)
        ten = random.choice(VIETNAMESE_FIRST_NAMES)
        ngay_sinh = random_date(2000, 2006).strftime('%Y-%m-%d')
        gt = random.choice(gioi_tinh)
        email = random_email(ho, ten)
        sdt = random_phone()
        dia_chi = random.choice(VIETNAMESE_ADDRESSES)
        ma_khoa = random.choice(['CNTT', 'ATTT', 'VT', 'KT'])
        trang_thai = random.choice(trang_thai_sv)
        ngay_nhap_hoc = random_date(2020, 2024).strftime('%Y-%m-%d')

        output += f"""INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('{ma_sv}', '{ho}', '{ten}', '{ngay_sinh}', '{gt}', '{email}', '{sdt}', '{dia_chi}', '{ma_coso}', '{ma_khoa}', '{trang_thai}', '{ngay_nhap_hoc}')
ON CONFLICT (MaSV) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- GiangVien ----
    output += "-- ---- GiangVien ----\n"
    hoc_vi = ['CN', 'ThS', 'TS', 'PGS']
    hoc_ham = [None, None, None, 'GTV', 'PGS']
    trang_thai_gv = ['DangCongTac', 'DangCongTac', 'TamNghi']

    for i in range(1, counts['giang_vien'] + 1):
        ma_gv = f"{ma_coso}GV{i:03d}"
        ho = random.choice(VIETNAMESE_LAST_NAMES)
        ten = random.choice(VIETNAMESE_FIRST_NAMES)
        hv = random.choice(hoc_vi)
        hh = random.choice(hoc_ham)
        email = random_email(ho, ten, f'gv.{info["khoa_prefix"].lower()}.ptit.edu.vn')
        sdt = random_phone()
        ma_khoa = random.choice(['CNTT', 'ATTT', 'VT', 'KT'])
        trang_thai = random.choice(trang_thai_gv)
        ngay_vao_lam = random_date(2010, 2023).strftime('%Y-%m-%d')

        hh_str = f"'{hh}'" if hh else 'NULL'
        output += f"""INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('{ma_gv}', '{ho}', '{ten}', '{hv}', {hh_str}, '{email}', '{sdt}', '{ma_coso}', '{ma_khoa}', '{trang_thai}', '{ngay_vao_lam}')
ON CONFLICT (MaGV) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- PhongHoc ----
    output += "-- ---- PhongHoc ----\n"
    loai_phong = ['LyThuyet', 'MayTinh', 'ThiNghiem', 'HoiTruong']
    toa_nha = ['A', 'B', 'C', 'D']

    for i in range(1, counts['phong_hoc'] + 1):
        ma_phong = f"P{ma_coso[:2]}{i:03d}"
        ten_phong = f"Phòng {i}"
        toa = random.choice(toa_nha)
        tang = random.randint(1, 5)
        suc_chua = random.choice([30, 40, 50, 60, 80, 100, 120])
        loai = random.choice(loai_phong)
        trang_thai = 'HoatDong'

        output += f"""INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('{ma_phong}', 'Phong {i}', 'Toa {toa}', {tang}, {suc_chua}, '{loai}', '{ma_coso}', '{trang_thai}')
ON CONFLICT (MaPhong) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- LopHocPhan ----
    output += "-- ---- LopHocPhan ----\n"
    hoc_phans = ['CS1001', 'CS1002', 'CS1003', 'CS1004', 'CS1005', 'CS1006', 'CS1007', 'CS1008', 
                 'CS1009', 'CS1010', 'VT2001', 'CS1011', 'CS1012', 'CS1013', 'CS1014', 'CS1015']
    hinh_thuc = ['Offline', 'Offline', 'Offline', 'Online', 'Hybrid']
    hoc_ky = 'HK20251'
    nam_hoc = '2025-2026'
    nhom_counter = {}
    
    # Lưu danh sách LopHocPhan để reuse cho LichHoc
    lop_hoc_phan_list = []
    
    for i in range(1, counts['lop_hoc_phan'] + 1):
        ma_hp = random.choice(hoc_phans)

        # Đếm số lớp của HP này để tạo nhóm
        if ma_hp not in nhom_counter:
            nhom_counter[ma_hp] = 1
        else:
            nhom_counter[ma_hp] += 1
        nhom = nhom_counter[ma_hp]

        ma_lhp = f"{ma_hp}-{ma_coso}-{nhom:02d}"
        
        # Lưu vào danh sách để reuse
        lop_hoc_phan_list.append(ma_lhp)

        # Lấy GV cùng site
        ma_gv = f"{ma_coso}GV{random.randint(1, counts['giang_vien']):03d}"

        # Lấy phòng cùng site
        ma_phong = f"P{ma_coso[:2]}{random.randint(1, counts['phong_hoc']):03d}"

        # Sức chứa: một số lớp nhỏ để test race condition
        if i <= 5:  # 5 lớp đầu có sức chứa nhỏ
            si_so_max = random.choice(SMALL_CLASS_SIZES)
        else:
            si_so_max = random.choice([30, 40, 50, 60])

        si_so_hien_tai = random.randint(0, min(si_so_max // 2, 20))  # Một số có SV đăng ký rồi
        hinh_thuc = random.choice(['Offline', 'Offline', 'Offline', 'Online', 'Hybrid'])
        trang_thai = 'Mo'

        output += f"""INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('{ma_lhp}', '{ma_hp}', '{hoc_ky}', '{ma_coso}', '{ma_gv}', '{ma_hp}-{nhom:02d}', {si_so_max}, {si_so_hien_tai}, '{hinh_thuc}', '{trang_thai}')
ON CONFLICT (MaLopHP) DO NOTHING;\n"""
    
    output += "\n"
    
    # ---- LichHoc ----
    output += "-- ---- LichHoc ----\n"
    thu = [2, 3, 4, 5, 6, 7]  # Thứ 2 - CN
    tiet_bat_dau = [1, 4, 7, 10]  # Các tiết: 1, 4, 7, 10
    so_tiet = [2, 3, 4]

    # Sử dụng lại danh sách LopHocPhan đã tạo ở trên
    lich_id = 1
    for ma_lhp in lop_hoc_phan_list:
        for j in range(random.randint(2, counts['lich_hoc'])):
            ma_lich = f"L{ma_coso[:2]}{lich_id:04d}"
            ma_phong = f"P{ma_coso[:2]}{random.randint(1, counts['phong_hoc']):03d}"
            th = random.choice(thu)
            tiet = random.choice(tiet_bat_dau)
            so_t = random.choice(so_tiet)
            ngay_bd = '2025-09-01'
            ngay_kt = '2025-12-31'

            output += f"""INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('{ma_lich}', '{ma_lhp}', '{ma_phong}', {th}, {tiet}, {so_t}, '{ngay_bd}', '{ngay_kt}')
ON CONFLICT (MaLich) DO NOTHING;\n"""
            lich_id += 1

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
        site_sql = generate_site_data(ma_coso, DEFAULT_COUNTS)
        site_file = os.path.join(site_dir, '001_site_data.sql')
        with open(site_file, 'w', encoding='utf-8') as f:
            f.write(site_sql)
        print(f"  -> {site_file}")
    
    print("\n" + "="*60)
    print("Seed data generated successfully!")
    print("="*60)
    print(f"\nOutput directory: {output_dir}")
    print("\nThứ tự import:")
    print("1. db/common/01_common_tables.sql (schema)")
    print("2. seeds/output/common/001_common_data.sql (data chung)")
    print("3. db/site_*/init/01_local_tables.sql (schema local)")
    print("4. seeds/output/site_*/001_site_data.sql (data local)")
    print("\nChạy tại mỗi site!")

if __name__ == '__main__':
    main()
