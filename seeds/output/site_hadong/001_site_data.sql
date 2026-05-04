-- ============================================================
-- DU LIEU CUC BO - Site HADONG (Cơ sở Hà Nội)
-- Sinh: 2026-04-27 12:31:49
-- ============================================================

-- ---- SinhVien Records (pre-generated) ----
-- Da tao 10 sinh vien

-- ---- GiangVien Records (pre-generated) ----
-- Da tao 5 giang vien

-- ---- users (Admin) ----
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('AD1', 'admin', '$2b$12$3ykDudUFjxaDAOeUHHpZKOhQZl8CeH1qAbsBywbUigJLHge0Oakpy', 'admin@ptit.edu.vn', 'Admin', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;

-- ---- users (SinhVien) ----
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26CNTT001', 'svhd26cntt001', '$2b$12$/j81w3UUA7utDQgU.9j0i.tWo/LhA6HiYTqpEbofsSU7B7VzFUzQu', 'quynh.do98@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26CNTT002', 'svhd26cntt002', '$2b$12$R.ki9G5XLE.WLAHwHub4Z.Ld./Zfo3WeuqQ/dsTFoJjn7Fa4TsDo6', 'giang.luu45@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26CNTT003', 'svhd26cntt003', '$2b$12$hGezxLhShnKf2pIwtG3uL.kMwzw55IH.Py6pmJuXPYSSp9fCKby5e', 'dung.truong78@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26ATTT001', 'svhd26attt001', '$2b$12$GAQnXWXfA316g7y73Tm2/.J.Hbk1qlD8KShRqO88tcF1HUSX0p53u', 'lan.cao12@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26ATTT002', 'svhd26attt002', '$2b$12$YekNTO6vT6qoYt7meGCm5uvaSbFPUuM6izE79Owk393ZHtfSh6gu6', 'thinh.vuong84@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26ATTT003', 'svhd26attt003', '$2b$12$lBaKne3XEnNrAMav32qH9OEAI3NY6tF6sdEfSFrz4qiQ.pAJSDZLy', 'khanh.dang10@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26VT001', 'svhd26vt001', '$2b$12$jqaM/s8po6riASIFDRhnJONCmmrUFdKC/XwGBjRJ32g3xYt03oD2K', 'dung.vu21@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26VT002', 'svhd26vt002', '$2b$12$1KjvywbY2R0ChQRv6Tdh8OWqWfrJT5b5MTz39BnJrlsHlL11h9F9i', 'nga.vuong7@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26KT001', 'svhd26kt001', '$2b$12$IhHNT7QBicjUAG5BWy/x4eoiPA1o3kJ56Ri9YZ2lV60iQL4qNzha.', 'linh.phan72@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26KT002', 'svhd26kt002', '$2b$12$M4dOY47R/qQqXwI0xPgZbOq9NnqHeZOvVwsX8/YjrvK3uP46Z8y2q', 'hien.le65@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;

-- ---- users (GiangVien) ----
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('GVHD26CNTT001', 'gvhd26cntt001', '$2b$12$VKVvKXoYLb64GOc1C84UtOwe03zgiQHYhmcvLW0e4Wejr5Kt4oRpa', 'trong.nguyen30@gv.hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('GVHD26CNTT002', 'gvhd26cntt002', '$2b$12$Fb.9ojzbAZSTl38sCUp5KO6VN2B3nmp6iQAEWR7z/GqRDc3kj8BRO', 'anh.bui59@gv.hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('GVHD26ATTT001', 'gvhd26attt001', '$2b$12$lQCn1xpmxRu2BfkvepJduOMqFFWQMt1v239eD9ASoH8I0VEKxbbHS', 'hien.ngo70@gv.hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('GVHD26VT001', 'gvhd26vt001', '$2b$12$mRWsaORFeH/3FzF445C7Jedbbax.HDAJgWWHDCjc7Lk/zeIp0ewgW', 'hien.le9@gv.hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('GVHD26KT001', 'gvhd26kt001', '$2b$12$iLQ6.Gv7O6RJQhNonRBtQu7J3n1f3lBLpQD4fm8bCeR9uzfgAGkZa', 'thi.tran57@gv.hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '2026-04-27 12:31:49')
ON CONFLICT ("userId") DO NOTHING;

-- ---- SinhVien ----
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26CNTT001', 'SVHD26CNTT001', 'Đỗ', 'Quỳnh', '2006-06-26', 'Nu', '0986196841', 'Quảng Nam', 'HADONG', 'CNTT', 'DangHoc', '2024-11-14', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26CNTT002', 'SVHD26CNTT002', 'Lưu', 'Giang', '2003-03-03', 'Nam', '0953599005', 'Hà Tĩnh', 'HADONG', 'CNTT', 'DangHoc', '2024-10-06', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26CNTT003', 'SVHD26CNTT003', 'Trương', 'Dũng', '2006-03-01', 'Nu', '0988096180', 'Hà Tĩnh', 'HADONG', 'CNTT', 'DangHoc', '2022-09-09', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26ATTT001', 'SVHD26ATTT001', 'Cao', 'Lan', '2002-11-26', 'Nam', '0939687077', 'Hưng Yên', 'HADONG', 'ATTT', 'DangHoc', '2024-10-10', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26ATTT002', 'SVHD26ATTT002', 'Vương', 'Thịnh', '2006-01-01', 'Nam', '0936054619', 'Quảng Ngãi', 'HADONG', 'ATTT', 'DangHoc', '2022-01-17', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26ATTT003', 'SVHD26ATTT003', 'Đặng', 'Khánh', '2006-03-13', 'Nu', '0921813262', 'Ninh Bình', 'HADONG', 'ATTT', 'BaoLuu', '2022-02-14', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26VT001', 'SVHD26VT001', 'Vũ', 'Dũng', '2005-12-16', 'Nu', '0954340126', 'Thanh Hóa', 'HADONG', 'VT', 'DangHoc', '2022-05-22', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26VT002', 'SVHD26VT002', 'Vương', 'Nga', '2002-10-21', 'Nu', '0934317504', 'Bình Định', 'HADONG', 'VT', 'DangHoc', '2023-01-18', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26KT001', 'SVHD26KT001', 'Phan', 'Linh', '2002-02-26', 'Nu', '0995963408', 'Ninh Thuận', 'HADONG', 'KT', 'DangHoc', '2024-01-22', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26KT002', 'SVHD26KT002', 'Lê', 'Hiền', '2004-05-06', 'Nu', '0985691722', 'Hải Dương', 'HADONG', 'KT', 'DangHoc', '2022-12-20', '2026-04-27 12:31:49')
ON CONFLICT ("MaSV") DO NOTHING;

-- ---- GiangVien ----
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHD26CNTT001', 'GVHD26CNTT001', 'Nguyễn', 'Trọng', 'PGS', NULL, '0968799808', 'HADONG', 'CNTT', 'DangCongTac', '2017-10-19', '2026-04-27 12:31:49')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHD26CNTT002', 'GVHD26CNTT002', 'Bùi', 'Anh', 'ThS', 'GTV', '0988676484', 'HADONG', 'CNTT', 'DangCongTac', '2021-06-29', '2026-04-27 12:31:49')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHD26ATTT001', 'GVHD26ATTT001', 'Ngô', 'Hiền', 'ThS', 'PGS', '0955356224', 'HADONG', 'ATTT', 'DangCongTac', '2023-07-06', '2026-04-27 12:31:49')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHD26VT001', 'GVHD26VT001', 'Lê', 'Hiền', 'ThS', 'GTV', '0915538945', 'HADONG', 'VT', 'DangCongTac', '2016-10-06', '2026-04-27 12:31:49')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHD26KT001', 'GVHD26KT001', 'Trần', 'Thi', 'TS', NULL, '0988777974', 'HADONG', 'KT', 'TamNghi', '2022-09-25', '2026-04-27 12:31:49')
ON CONFLICT ("MaGV") DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA001', 'Phong 1', 'B', 3, 60, 'LyThuyet', 'HADONG', 'BaoTri', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA002', 'Phong 2', 'A', 2, 100, 'HoiTruong', 'HADONG', 'BaoTri', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA003', 'Phong 3', 'C', 5, 80, 'MayTinh', 'HADONG', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA004', 'Phong 4', 'C', 4, 100, 'LyThuyet', 'HADONG', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA005', 'Phong 5', 'B', 4, 30, 'MayTinh', 'HADONG', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA006', 'Phong 6', 'B', 2, 30, 'LyThuyet', 'HADONG', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA007', 'Phong 7', 'A', 3, 80, 'LyThuyet', 'HADONG', 'BaoTri', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHA008', 'Phong 8', 'D', 3, 30, 'MayTinh', 'HADONG', 'HoatDong', '2026-04-27 12:31:49')
ON CONFLICT ("MaPhong") DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1008-HADONG-01', 'CS1008', 'HK20251', 'HADONG', 'GVHD26CNTT002', 'CS1008-01', 10, 2, 'Offline', 'Mo', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1011-HADONG-01', 'CS1011', 'HK20251', 'HADONG', 'GVHD26CNTT002', 'CS1011-01', 12, 0, 'Offline', 'Mo', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1003-HADONG-01', 'CS1003', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1003-01', 10, 0, 'Online', 'Mo', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1006-HADONG-01', 'CS1006', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1006-01', 30, 11, 'Hybrid', 'Dong', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1004-HADONG-01', 'CS1004', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1004-01', 40, 0, 'Offline', 'Dong', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1005-HADONG-01', 'CS1005', 'HK20251', 'HADONG', 'GVHD26CNTT002', 'CS1005-01', 40, 13, 'Offline', 'Dong', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-HADONG-01', 'CS1001', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1001-01', 60, 3, 'Offline', 'Dong', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1011-HADONG-02', 'CS1011', 'HK20251', 'HADONG', 'GVHD26CNTT002', 'CS1011-02', 50, 6, 'Hybrid', 'Mo', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1007-HADONG-01', 'CS1007', 'HK20251', 'HADONG', 'GVHD26CNTT002', 'CS1007-01', 50, 9, 'Offline', 'Mo', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1004-HADONG-02', 'CS1004', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1004-02', 40, 11, 'Online', 'Mo', '2026-04-27 12:31:49')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- ---- LichHoc ----
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0001', 'CS1008-HADONG-01', 'PHA006', 6, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0002', 'CS1011-HADONG-01', 'PHA005', 3, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0003', 'CS1011-HADONG-01', 'PHA007', 3, 10, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0004', 'CS1003-HADONG-01', 'PHA008', 5, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0005', 'CS1003-HADONG-01', 'PHA008', 2, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0006', 'CS1006-HADONG-01', 'PHA006', 4, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0007', 'CS1006-HADONG-01', 'PHA005', 7, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0008', 'CS1004-HADONG-01', 'PHA002', 5, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0009', 'CS1004-HADONG-01', 'PHA005', 7, 1, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0010', 'CS1005-HADONG-01', 'PHA006', 3, 4, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0011', 'CS1005-HADONG-01', 'PHA002', 3, 10, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0012', 'CS1001-HADONG-01', 'PHA002', 5, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0013', 'CS1011-HADONG-02', 'PHA006', 3, 4, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0014', 'CS1007-HADONG-01', 'PHA004', 7, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0015', 'CS1004-HADONG-02', 'PHA001', 3, 4, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHA0016', 'CS1004-HADONG-02', 'PHA002', 2, 10, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;

-- -- ---- DangKy (Demo Enrollments) ----
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26CNTT001', 'SVHD26CNTT001', 'CS1008-HADONG-01', 'CS1008', 'HK20251', '2025-09-05 16:55:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26CNTT002', 'SVHD26CNTT002', 'CS1001-HADONG-01', 'CS1001', 'HK20251', '2025-09-05 15:31:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26CNTT002', 'SVHD26CNTT002', 'CS1005-HADONG-01', 'CS1005', 'HK20251', '2025-09-05 14:58:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26CNTT003', 'SVHD26CNTT003', 'CS1004-HADONG-02', 'CS1004', 'HK20251', '2025-09-05 08:55:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26ATTT001', 'SVHD26ATTT001', 'CS1001-HADONG-01', 'CS1001', 'HK20251', '2025-09-05 12:04:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26ATTT001', 'SVHD26ATTT001', 'CS1008-HADONG-01', 'CS1008', 'HK20251', '2025-09-05 11:22:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26ATTT001', 'SVHD26ATTT001', 'CS1006-HADONG-01', 'CS1006', 'HK20251', '2025-09-05 09:43:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26ATTT002', 'SVHD26ATTT002', 'CS1003-HADONG-01', 'CS1003', 'HK20251', '2025-09-05 10:21:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHD26ATTT002', 'SVHD26ATTT002', 'CS1011-HADONG-01', 'CS1011', 'HK20251', '2025-09-05 12:03:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;

