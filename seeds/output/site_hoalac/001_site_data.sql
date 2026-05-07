-- ============================================================
-- DU LIEU CUC BO - Site HOALAC (Cơ sở Hòa Lạc)
-- Sinh: 2026-04-27 12:32:02
-- ============================================================

-- ---- SinhVien Records (pre-generated) ----
-- Da tao 10 sinh vien

-- ---- GiangVien Records (pre-generated) ----
-- Da tao 5 giang vien

-- -- ---- users (Admin) ----
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('AD1', 'admin', '$2b$12$0ZCtV6G9ImvCzMasDMhgxeOmf0Hqxg/WROhjqq9mbFL3RttaSsTpW', 'admin@ptit.edu.vn', 'Admin', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;

-- -- ---- users (SinhVien) ----
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26CNTT001', 'svhl26cntt001', '$2b$12$Y/fzKgihhnqiGc85fB593.YC1Z9Nz15UZ8p1YAtD3yJ2SNt8062C2', 'loan.bui38@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26CNTT002', 'svhl26cntt002', '$2b$12$JiUzuCsnHSF3rxpoJWajXelCwvQAoZWqzuyq0rX/WvIE8rz9SAtUK', 'tam.huynh38@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26CNTT003', 'svhl26cntt003', '$2b$12$AgsJoUw7QTnA7.6/QenIyOashN6q5kDYGgVNC5Yu9hbEwLcsQ6jzS', 'thi.nguyen60@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26ATTT001', 'svhl26attt001', '$2b$12$H.Pm93FWXG/X1HC6BOHDbu/iDJx8073LD78a76M21/F0fDogpA1L6', 'binh.phan13@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26ATTT002', 'svhl26attt002', '$2b$12$F7rfwCd5wQgI.RFN55OkH.UR.5pL9mnHnWXMwdD2b4lbcgN8EVu1C', 'hoang.trinh77@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26ATTT003', 'svhl26attt003', '$2b$12$59OQzoDnZVChsZHH9RbIUuAiveNb1R.REvx9mxAGrNjTyIwiNUBgG', 'nam.ly96@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26VT001', 'svhl26vt001', '$2b$12$sLGwBx3CMlZJIBZnlXrVnObVRbDQ.JAiQViTrh7o7r26A5Tq2r75G', 'nam.hoang16@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26VT002', 'svhl26vt002', '$2b$12$p1yAJBkzHFYit.o2aN.RGORpff6hCBExnelFuK566u66CY4B6JXp6', 'linh.ho83@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26KT001', 'svhl26kt001', '$2b$12$QfYT97Xr2nUMt0gZbMWScO5Yq7wo6tIIaKoLE72QEFpJk2HjiiZZm', 'cuong.le47@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVHL26KT002', 'svhl26kt002', '$2b$12$WAHcu9Boe6NL0Lp2FsBoJ.Mr1bxc3c1kPu.Dj4w/GnWOpRWblMr1i', 'quang.le80@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;

-- -- ---- users (GiangVien) ----
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVHL26CNTT001', 'gvhl26cntt001', '$2b$12$DWvA2YeGI04VdskPSFr7/.Lbav.ILPefR3MrmCjLodgDxc0Ajy4b2', 'tham.trinh38@gv.hl.ptit.edu.vn', 'GiangVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVHL26CNTT002', 'gvhl26cntt002', '$2b$12$a3GbmSg4Hg2tFbfh5lbuyeIpFC0uRlKekQ2Ut8F0UImKqmGGrFDGq', 'lan.hoang86@gv.hl.ptit.edu.vn', 'GiangVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVHL26ATTT001', 'gvhl26attt001', '$2b$12$P/2SuNiUMYFSuIgQaQNUvuHBFdqoTpX.IX71z.slKEboK4V69cvAi', 'huy.tran32@gv.hl.ptit.edu.vn', 'GiangVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVHL26VT001', 'gvhl26vt001', '$2b$12$zGFoAyP175hYD6wmmlVF6.5tNRC.Ig3RdvexoJe2kvikdMcXDqBDq', 'trong.hoang17@gv.hl.ptit.edu.vn', 'GiangVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVHL26KT001', 'gvhl26kt001', '$2b$12$p0LRRzrEmkvfUsLtQd.BSePmVVLnt9UqjMpLsosR.UdMzkC7xt4zy', 'my.vuong76@gv.hl.ptit.edu.vn', 'GiangVien', 'HOALAC', 'Active', '2026-04-27 12:32:02')
-- ON CONFLICT ("userId") DO NOTHING;

-- ---- SinhVien ----
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26CNTT001', 'SVHL26CNTT001', 'Bùi', 'Loan', '2005-08-04', 'Nu', '0985784991', 'Hải Dương', 'HOALAC', 'CNTT', 'BaoLuu', '2023-06-15', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26CNTT002', 'SVHL26CNTT002', 'Huỳnh', 'Tâm', '2002-05-24', 'Nu', '0993826842', 'Bắc Ninh', 'HOALAC', 'CNTT', 'BaoLuu', '2023-09-14', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26CNTT003', 'SVHL26CNTT003', 'Nguyễn', 'Thi', '2003-02-05', 'Nu', '0909679465', 'Ninh Bình', 'HOALAC', 'CNTT', 'DangHoc', '2024-04-02', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26ATTT001', 'SVHL26ATTT001', 'Phan', 'Bình', '2004-07-30', 'Nu', '0987529924', 'Hà Tĩnh', 'HOALAC', 'ATTT', 'DangHoc', '2023-09-08', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26ATTT002', 'SVHL26ATTT002', 'Trịnh', 'Hoàng', '2003-03-15', 'Nu', '0962082741', 'Khánh Hòa', 'HOALAC', 'ATTT', 'DangHoc', '2022-08-13', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26ATTT003', 'SVHL26ATTT003', 'Lý', 'Nam', '2002-12-13', 'Nu', '0966708991', 'Bình Định', 'HOALAC', 'ATTT', 'DangHoc', '2023-08-12', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26VT001', 'SVHL26VT001', 'Hoàng', 'Nam', '2002-02-18', 'Nam', '0928827787', 'Hà Tĩnh', 'HOALAC', 'VT', 'DangHoc', '2023-01-24', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26VT002', 'SVHL26VT002', 'Hồ', 'Linh', '2003-09-05', 'Nu', '0968887176', 'Thanh Hóa', 'HOALAC', 'VT', 'DangHoc', '2023-03-25', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26KT001', 'SVHL26KT001', 'Lê', 'Cường', '2003-02-16', 'Nu', '0937145156', 'Bình Thuận', 'HOALAC', 'KT', 'BaoLuu', '2023-06-04', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26KT002', 'SVHL26KT002', 'Lê', 'Quang', '2006-01-15', 'Nam', '0918564229', 'Hà Tĩnh', 'HOALAC', 'KT', 'DangHoc', '2024-04-28', '2026-04-27 12:32:02')
ON CONFLICT ("MaSV") DO NOTHING;

-- ---- GiangVien ----
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHL26CNTT001', 'GVHL26CNTT001', 'Trịnh', 'Thắm', 'CN', 'PGS', '0948575130', 'HOALAC', 'CNTT', 'DangCongTac', '2011-02-14', '2026-04-27 12:32:02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHL26CNTT002', 'GVHL26CNTT002', 'Hoàng', 'Lan', 'ThS', NULL, '0981704224', 'HOALAC', 'CNTT', 'DangCongTac', '2022-06-14', '2026-04-27 12:32:02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHL26ATTT001', 'GVHL26ATTT001', 'Trần', 'Huy', 'CN', NULL, '0977108340', 'HOALAC', 'ATTT', 'DangCongTac', '2010-09-10', '2026-04-27 12:32:02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHL26VT001', 'GVHL26VT001', 'Hoàng', 'Trọng', 'CN', 'GTV', '0979234998', 'HOALAC', 'VT', 'DangCongTac', '2023-09-30', '2026-04-27 12:32:02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHL26KT001', 'GVHL26KT001', 'Vương', 'My', 'CN', NULL, '0981777349', 'HOALAC', 'KT', 'DangCongTac', '2010-04-09', '2026-04-27 12:32:02')
ON CONFLICT ("MaGV") DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO001', 'Phong 1', 'D', 2, 40, 'MayTinh', 'HOALAC', 'HoatDong', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO002', 'Phong 2', 'A', 4, 50, 'MayTinh', 'HOALAC', 'HoatDong', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO003', 'Phong 3', 'A', 3, 30, 'LyThuyet', 'HOALAC', 'BaoTri', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO004', 'Phong 4', 'C', 3, 60, 'MayTinh', 'HOALAC', 'HoatDong', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO005', 'Phong 5', 'A', 1, 40, 'ThiNghiem', 'HOALAC', 'HoatDong', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO006', 'Phong 6', 'C', 5, 50, 'MayTinh', 'HOALAC', 'BaoTri', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO007', 'Phong 7', 'C', 1, 40, 'MayTinh', 'HOALAC', 'BaoTri', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PHO008', 'Phong 8', 'A', 5, 50, 'LyThuyet', 'HOALAC', 'HoatDong', '2026-04-27 12:32:02')
ON CONFLICT ("MaPhong") DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1008-HOALAC-01', 'CS1008', 'HK20251', 'HOALAC', 'GVHL26CNTT001', 'CS1008-01', 12, 1, 'Hybrid', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-HOALAC-01', 'CS1001', 'HK20251', 'HOALAC', 'GVHL26CNTT001', 'CS1001-01', 12, 1, 'Online', 'Dong', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1004-HOALAC-01', 'CS1004', 'HK20251', 'HOALAC', 'GVHL26CNTT002', 'CS1004-01', 10, 2, 'Offline', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1009-HOALAC-01', 'CS1009', 'HK20251', 'HOALAC', 'GVHL26ATTT001', 'CS1009-01', 60, 14, 'Online', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1002-HOALAC-01', 'CS1002', 'HK20251', 'HOALAC', 'GVHL26CNTT002', 'CS1002-01', 50, 2, 'Offline', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1007-HOALAC-01', 'CS1007', 'HK20251', 'HOALAC', 'GVHL26CNTT002', 'CS1007-01', 50, 13, 'Hybrid', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1008-HOALAC-02', 'CS1008', 'HK20251', 'HOALAC', 'GVHL26CNTT002', 'CS1008-02', 60, 6, 'Online', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('VT2001-HOALAC-01', 'VT2001', 'HK20251', 'HOALAC', 'GVHL26VT001', 'VT2001-01', 50, 14, 'Online', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1011-HOALAC-01', 'CS1011', 'HK20251', 'HOALAC', 'GVHL26CNTT001', 'CS1011-01', 30, 9, 'Offline', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1010-HOALAC-01', 'CS1010', 'HK20251', 'HOALAC', 'GVHL26ATTT001', 'CS1010-01', 60, 13, 'Offline', 'Mo', '2026-04-27 12:32:02')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- ---- LichHoc ----
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0001', 'CS1008-HOALAC-01', 'PHO003', 3, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0002', 'CS1001-HOALAC-01', 'PHO008', 4, 7, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0003', 'CS1004-HOALAC-01', 'PHO004', 5, 1, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0004', 'CS1004-HOALAC-01', 'PHO006', 7, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0005', 'CS1009-HOALAC-01', 'PHO007', 7, 4, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0006', 'CS1002-HOALAC-01', 'PHO005', 3, 1, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0007', 'CS1002-HOALAC-01', 'PHO003', 2, 10, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0008', 'CS1007-HOALAC-01', 'PHO003', 3, 1, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0009', 'CS1007-HOALAC-01', 'PHO008', 7, 4, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0010', 'CS1008-HOALAC-02', 'PHO006', 3, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0011', 'CS1008-HOALAC-02', 'PHO006', 3, 10, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0012', 'VT2001-HOALAC-01', 'PHO003', 2, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0013', 'CS1011-HOALAC-01', 'PHO008', 2, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHO0014', 'CS1010-HOALAC-01', 'PHO007', 7, 4, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;

-- -- ---- DangKy (Demo Enrollments) ----
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT001', 'SVHL26CNTT001', 'CS1001-HOALAC-01', 'CS1001', 'HK20251', '2025-09-05 11:48:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT001', 'SVHL26CNTT001', 'CS1008-HOALAC-01', 'CS1008', 'HK20251', '2025-09-05 16:41:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT002', 'SVHL26CNTT002', 'CS1009-HOALAC-01', 'CS1009', 'HK20251', '2025-09-05 15:17:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT002', 'SVHL26CNTT002', 'CS1008-HOALAC-01', 'CS1008', 'HK20251', '2025-09-05 09:19:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT002', 'SVHL26CNTT002', 'CS1011-HOALAC-01', 'CS1011', 'HK20251', '2025-09-05 10:32:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT003', 'SVHL26CNTT003', 'CS1001-HOALAC-01', 'CS1001', 'HK20251', '2025-09-05 10:37:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT003', 'SVHL26CNTT003', 'CS1011-HOALAC-01', 'CS1011', 'HK20251', '2025-09-05 10:13:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26CNTT003', 'SVHL26CNTT003', 'CS1009-HOALAC-01', 'CS1009', 'HK20251', '2025-09-05 10:31:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26ATTT001', 'SVHL26ATTT001', 'CS1008-HOALAC-02', 'CS1008', 'HK20251', '2025-09-05 09:30:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26ATTT001', 'SVHL26ATTT001', 'CS1009-HOALAC-01', 'CS1009', 'HK20251', '2025-09-05 17:35:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26ATTT002', 'SVHL26ATTT002', 'CS1008-HOALAC-02', 'CS1008', 'HK20251', '2025-09-05 09:52:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26ATTT002', 'SVHL26ATTT002', 'VT2001-HOALAC-01', 'VT2001', 'HK20251', '2025-09-05 10:17:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVHL26ATTT002', 'SVHL26ATTT002', 'CS1004-HOALAC-01', 'CS1004', 'HK20251', '2025-09-05 11:19:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;

