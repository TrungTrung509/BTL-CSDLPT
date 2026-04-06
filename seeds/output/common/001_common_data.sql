-- ============================================================
-- DỮ LIỆU DÙNG CHUNG - Common Data
-- Sinh: 2026-04-04 23:17:07
-- ============================================================

-- ---- CoSo ----
INSERT INTO CoSo (MaCoSo, TenCoSo, DiaChi, SoDienThoai, Email, NgayThanhLap, TrangThai)
VALUES ('HADONG', 'Cơ sở Hà Nội', 'Hà Nội', '0904175112', 'quanlyhadong@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT (MaCoSo) DO NOTHING;
INSERT INTO CoSo (MaCoSo, TenCoSo, DiaChi, SoDienThoai, Email, NgayThanhLap, TrangThai)
VALUES ('NGOCTRUC', 'Cơ sở Ngọc Trục', 'Ngọc Trục', '0942836964', 'quanlyngoctruc@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT (MaCoSo) DO NOTHING;
INSERT INTO CoSo (MaCoSo, TenCoSo, DiaChi, SoDienThoai, Email, NgayThanhLap, TrangThai)
VALUES ('HOALAC', 'Cơ sở Hòa Lạc', 'Hòa Lạc', '0964126466', 'quanlyhoalac@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT (MaCoSo) DO NOTHING;

-- ---- Khoa ----
INSERT INTO Khoa (MaKhoa, TenKhoa, MoTa, NgayThanhLap, TrangThai)
VALUES ('CNTT', 'Khoa Công nghệ thông tin', 'Khoa dao tao nganh CNTT', '2000-01-01', 'HoatDong')
ON CONFLICT (MaKhoa) DO NOTHING;
INSERT INTO Khoa (MaKhoa, TenKhoa, MoTa, NgayThanhLap, TrangThai)
VALUES ('ATTT', 'Khoa An toàn thông tin', 'Khoa dao tao nganh ATTT', '2000-01-01', 'HoatDong')
ON CONFLICT (MaKhoa) DO NOTHING;
INSERT INTO Khoa (MaKhoa, TenKhoa, MoTa, NgayThanhLap, TrangThai)
VALUES ('VT', 'Khoa Viễn thông', 'Khoa dao tao nganh VT', '2000-01-01', 'HoatDong')
ON CONFLICT (MaKhoa) DO NOTHING;
INSERT INTO Khoa (MaKhoa, TenKhoa, MoTa, NgayThanhLap, TrangThai)
VALUES ('KT', 'Khoa Kinh tế', 'Khoa dao tao nganh KT', '2000-01-01', 'HoatDong')
ON CONFLICT (MaKhoa) DO NOTHING;

-- ---- HocPhan ----
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1001', 'Nhập môn lập trình', 3, 30, 30, 'BatBuoc', 'CNTT', 'Môn học cơ sở ngành CNTT', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1002', 'Cấu trúc dữ liệu và giải thuật', 4, 40, 30, 'BatBuoc', 'CNTT', 'Môn học nền tảng', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1003', 'Cơ sở dữ liệu', 3, 30, 30, 'BatBuoc', 'CNTT', 'Quản trị CSDL', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1004', 'Mạng máy tính', 3, 30, 30, 'BatBuoc', 'CNTT', 'Nền tảng mạng', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1005', 'Trí tuệ nhân tạo', 3, 30, 30, 'TuChon', 'CNTT', 'AI cơ bản', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1006', 'Hệ điều hành', 3, 30, 30, 'BatBuoc', 'CNTT', 'OS fundamentals', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1007', 'Phân tích và thiết kế hệ thống', 3, 30, 30, 'BatBuoc', 'CNTT', 'System analysis', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1008', 'Lập trình hướng đối tượng', 3, 30, 30, 'BatBuoc', 'CNTT', 'OOP', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1009', 'An toàn thông tin', 3, 30, 30, 'BatBuoc', 'ATTT', 'Security basics', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1010', 'Mật mã ứng dụng', 3, 30, 30, 'TuChon', 'ATTT', 'Applied cryptography', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('VT2001', 'Truyền dẫn số', 3, 30, 30, 'BatBuoc', 'VT', 'Digital transmission', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('VT2002', 'Thông tin di động', 3, 30, 30, 'TuChon', 'VT', 'Mobile communications', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1011', 'Công nghệ Web', 3, 30, 30, 'BatBuoc', 'CNTT', 'Web development', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1012', 'Đồ họa máy tính', 3, 30, 30, 'TuChon', 'CNTT', 'Computer graphics', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1013', 'Kiến trúc máy tính', 3, 30, 30, 'BatBuoc', 'CNTT', 'Computer architecture', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1014', 'Toán rời rạc', 3, 45, 0, 'BatBuoc', 'CNTT', 'Discrete mathematics', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1015', 'Xác suất thống kê', 3, 30, 30, 'BatBuoc', 'CNTT', 'Probability & Statistics', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('KT1001', 'Kinh tế vi mô', 3, 45, 0, 'BatBuoc', 'KT', 'Microeconomics', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('KT1002', 'Kinh tế vĩ mô', 3, 45, 0, 'BatBuoc', 'KT', 'Macroeconomics', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;
INSERT INTO HocPhan (MaHP, TenHP, SoTinChi, SoTietLyThuyet, SoTietThucHanh, LoaiHocPhan, MaKhoa, MoTa, TrangThai)
VALUES ('CS1016', 'Thực tập tốt nghiệp', 4, 0, 120, 'BatBuoc', 'CNTT', 'Internship', 'HoatDong')
ON CONFLICT (MaHP) DO NOTHING;

-- ---- HocKy ----
INSERT INTO HocKy (MaHocKy, NamHoc, KySo, NgayBatDau, NgayKetThuc, TrangThaiHocKy)
VALUES ('HK20251', '2025-2026', 1, '2025-09-01', '2025-12-31', 'DangDangKy')
ON CONFLICT (MaHocKy) DO NOTHING;
INSERT INTO HocKy (MaHocKy, NamHoc, KySo, NgayBatDau, NgayKetThuc, TrangThaiHocKy)
VALUES ('HK20252', '2025-2026', 2, '2026-01-01', '2026-05-31', 'SapMo')
ON CONFLICT (MaHocKy) DO NOTHING;
INSERT INTO HocKy (MaHocKy, NamHoc, KySo, NgayBatDau, NgayKetThuc, TrangThaiHocKy)
VALUES ('HK20261', '2026-2027', 1, '2026-09-01', '2026-12-31', 'SapMo')
ON CONFLICT (MaHocKy) DO NOTHING;

-- ---- TienQuyet ----
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1002', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1003', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1004', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1006', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1006', 'CS1013')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1007', 'CS1002')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1008', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1005', 'CS1002')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1011', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1011', 'CS1008')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
INSERT INTO TienQuyet (MaHP, MaHP_TienQuyet)
VALUES ('CS1012', 'CS1001')
ON CONFLICT (MaHP, MaHP_TienQuyet) DO NOTHING;
