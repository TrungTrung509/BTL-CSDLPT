-- ============================================================
-- DU LIEU DUNG CHUNG - Common Data
-- Sinh: 2026-04-27 12:31:49
-- Schema: CoSo, Khoa, HocKy, HocPhan
-- ============================================================

-- ---- CoSo ----
INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai")
VALUES ('HADONG', 'Cơ sở Hà Nội', 'Hà Nội', '0952453253', 'quanlyhadong@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT ("MaCoSo") DO NOTHING;
INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai")
VALUES ('NGOCTRUC', 'Cơ sở Ngọc Trục', 'Ngọc Trục', '0902029938', 'quanlyngoctruc@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT ("MaCoSo") DO NOTHING;
INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai")
VALUES ('HOALAC', 'Cơ sở Hòa Lạc', 'Hòa Lạc', '0996008165', 'quanlyhoalac@ptit.edu.vn', '2010-01-01', 'HoatDong')
ON CONFLICT ("MaCoSo") DO NOTHING;

-- ---- Khoa ----
INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai")
VALUES ('CNTT', 'Khoa Cong nghe thong tin', 'Khoa dao tao nganh CNTT', '2000-01-01', 'HoatDong')
ON CONFLICT ("MaKhoa") DO NOTHING;
INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai")
VALUES ('ATTT', 'Khoa An toan thong tin', 'Khoa dao tao nganh ATTT', '2000-01-01', 'HoatDong')
ON CONFLICT ("MaKhoa") DO NOTHING;
INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai")
VALUES ('VT', 'Khoa Vien thong', 'Khoa dao tao nganh VT', '2000-01-01', 'HoatDong')
ON CONFLICT ("MaKhoa") DO NOTHING;
INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai")
VALUES ('KT', 'Khoa Kinh te', 'Khoa dao tao nganh KT', '2000-01-01', 'HoatDong')
ON CONFLICT ("MaKhoa") DO NOTHING;

-- ---- HocKy ----
INSERT INTO "HocKy" ("MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy")
VALUES ('HK20251', '2025-2026', 1, '2025-09-01', '2025-12-31', 'DangDangKy')
ON CONFLICT ("MaHocKy") DO NOTHING;
INSERT INTO "HocKy" ("MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy")
VALUES ('HK20252', '2025-2026', 2, '2026-01-01', '2026-05-31', 'SapMo')
ON CONFLICT ("MaHocKy") DO NOTHING;
INSERT INTO "HocKy" ("MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy")
VALUES ('HK20261', '2026-2027', 1, '2026-09-01', '2026-12-31', 'SapMo')
ON CONFLICT ("MaHocKy") DO NOTHING;

-- ---- HocPhan ----
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1001', 'Nhap mon lap trinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Mon co so nganh CNTT', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1002', 'Cau truc du lieu va giai thuat', 4, 40, 30, 'BatBuoc', 'CNTT', 'Mon nen tang', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1003', 'Co so du lieu', 3, 30, 30, 'BatBuoc', 'CNTT', 'Quan tri CSDL', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1004', 'Mang may tinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Nen tang mang', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1005', 'Tri tue nhan tao', 3, 30, 30, 'TuChon', 'CNTT', 'AI co ban', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1006', 'He dieu hanh', 3, 30, 30, 'BatBuoc', 'CNTT', 'OS fundamentals', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1007', 'Phan tich va thiet ke he thong', 3, 30, 30, 'BatBuoc', 'CNTT', 'System analysis', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1008', 'Lap trinh huong doi tuong', 3, 30, 30, 'BatBuoc', 'CNTT', 'OOP', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1009', 'An toan thong tin', 3, 30, 30, 'BatBuoc', 'ATTT', 'Security basics', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1010', 'Mat ma ung dung', 3, 30, 30, 'TuChon', 'ATTT', 'Applied cryptography', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('VT2001', 'Truyen dan so', 3, 30, 30, 'BatBuoc', 'VT', 'Digital transmission', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('VT2002', 'Thong tin di dong', 3, 30, 30, 'TuChon', 'VT', 'Mobile communications', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1011', 'Cong nghe Web', 3, 30, 30, 'BatBuoc', 'CNTT', 'Web development', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1012', 'Do hoa may tinh', 3, 30, 30, 'TuChon', 'CNTT', 'Computer graphics', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1013', 'Kien truc may tinh', 3, 30, 30, 'BatBuoc', 'CNTT', 'Computer architecture', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1014', 'Toan roi rac', 3, 45, 0, 'BatBuoc', 'CNTT', 'Discrete mathematics', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1015', 'Xac suat thong ke', 3, 30, 30, 'BatBuoc', 'CNTT', 'Probability & Statistics', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('KT1001', 'Kinh te vi mo', 3, 45, 0, 'BatBuoc', 'KT', 'Microeconomics', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('KT1002', 'Kinh te vi mo', 3, 45, 0, 'BatBuoc', 'KT', 'Macroeconomics', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
VALUES ('CS1016', 'Thuc tap tot nghiep', 4, 0, 120, 'BatBuoc', 'CNTT', 'Internship', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaHP") DO NOTHING;
