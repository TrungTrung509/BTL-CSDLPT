-- ============================================================
-- DU LIEU CUC BO - Site NGOCTRUC (Cơ sở Ngọc Trục)
-- Sinh: 2026-04-27 12:31:55
-- ============================================================

-- ---- SinhVien Records (pre-generated) ----
-- Da tao 10 sinh vien

-- ---- GiangVien Records (pre-generated) ----
-- Da tao 5 giang vien

-- -- ---- users (Admin) ----
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('AD1', 'admin', '$2b$12$O7VYMzk01/Adak9Pg.Gb4esVbAcVVyAX2D/4RCogtxXyh3iO5kK62', 'admin@ptit.edu.vn', 'Admin', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;

-- -- ---- users (SinhVien) ----
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26CNTT001', 'svnt26cntt001', '$2b$12$TSm/Jn/0O7uIv9b/SnTt6.rdY/FlYc4v2VziHLW1J2bnFd2Q/7hDu', 'trang.vu63@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26CNTT002', 'svnt26cntt002', '$2b$12$ydHVqXtClcBXPyhPSFczX.3QzWJ9O33I2O.HONu1tJipdNbLrT3UO', 'phat.ngo4@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26CNTT003', 'svnt26cntt003', '$2b$12$sWHfLxKkq.ZcoKG.TvGkh.q4UNAPOhi.hVEVDTShDCOF0WLDqjQU.', 'huong.hoang22@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26ATTT001', 'svnt26attt001', '$2b$12$BwGZwI0kU7O9KDV6Jrhf9Ohxx7ZlXa.7BRVdfH/9ZWu79vog1kwoS', 'lam.duong51@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26ATTT002', 'svnt26attt002', '$2b$12$48FLf0x65JmNI6vyWrKAPurqFS9d8eWz2VemWn44bkcu6FMpQcGNq', 'vinh.duong85@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26ATTT003', 'svnt26attt003', '$2b$12$50dy.Qt7wkOn8rjbNUxubOdVCyI8ZyfNwmhL1FdGZvT.ytNt9Q0h2', 'thanh.le9@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26VT001', 'svnt26vt001', '$2b$12$I8xIJXJHjbQWuJVFFWwIhuPe/IEC5OvtGm0vThiq0pSyo.ACU8z8K', 'anh.hoang9@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26VT002', 'svnt26vt002', '$2b$12$5ecZKU6iwNvr80b10LPYEuGiu0MPf25ELQQbkLgqzj4pN2YCLuiOO', 'bich.vuong79@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26KT001', 'svnt26kt001', '$2b$12$wgrdnKntHSKG1T9aBRm2v.zSKjrsF7w9jtSX63HcRtyrnQWBTb5NG', 'tam.ho97@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('SVNT26KT002', 'svnt26kt002', '$2b$12$QHqfCWhiYFRmMqkXZoYzKeUMdwy/ONzNncBaucpnDD.KZY69I4Afu', 'van.ho97@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;

-- -- ---- users (GiangVien) ----
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVNT26CNTT001', 'gvnt26cntt001', '$2b$12$yeMtEFD7bk2IU8caGISUleFm1XPjiqME5fPPcvy4mGpJGW9we1NCG', 'huong.ly17@gv.nt.ptit.edu.vn', 'GiangVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVNT26CNTT002', 'gvnt26cntt002', '$2b$12$rA4PnDxCtTOX5KbgMVKACe9YoOc/o.52aqKGp76A6AxWCj/anj6yW', 'dung.hoang82@gv.nt.ptit.edu.vn', 'GiangVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVNT26ATTT001', 'gvnt26attt001', '$2b$12$yTln6.QXH2GnDZhNtofd5uZzNaf67hh7qI5a/upjX39DqZXHLxLMy', 'oanh.duong68@gv.nt.ptit.edu.vn', 'GiangVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVNT26VT001', 'gvnt26vt001', '$2b$12$UHyzHY3pggacqA2vrG6XXu2DGWO5p2YvYM0AnP1pz4pArTjmiVqCa', 'khanh.ho62@gv.nt.ptit.edu.vn', 'GiangVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;
-- INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
-- VALUES ('GVNT26KT001', 'gvnt26kt001', '$2b$12$9YWIqyWqt.E3UMJDr897LeutcsoH4JCVERHfjTSs9gk.3lXUutqCi', 'bao.nguyen64@gv.nt.ptit.edu.vn', 'GiangVien', 'NGOCTRUC', 'Active', '2026-04-27 12:31:55')
-- ON CONFLICT ("userId") DO NOTHING;

-- ---- SinhVien ----
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26CNTT001', 'SVNT26CNTT001', 'Vũ', 'Trang', '2006-03-07', 'Nam', '0969339278', 'Nghệ An', 'NGOCTRUC', 'CNTT', 'DangHoc', '2022-02-14', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26CNTT002', 'SVNT26CNTT002', 'Ngô', 'Phát', '2006-06-23', 'Nu', '0998806085', 'Thái Bình', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2024-08-11', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26CNTT003', 'SVNT26CNTT003', 'Hoàng', 'Hương', '2005-04-25', 'Nu', '0998104844', 'Ninh Bình', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2023-10-31', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26ATTT001', 'SVNT26ATTT001', 'Dương', 'Lam', '2005-11-13', 'Nam', '0919723752', 'Quảng Trị', 'NGOCTRUC', 'ATTT', 'DangHoc', '2024-07-19', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26ATTT002', 'SVNT26ATTT002', 'Dương', 'Vinh', '2005-04-07', 'Nu', '0978812948', 'Thái Bình', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2023-12-13', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26ATTT003', 'SVNT26ATTT003', 'Lê', 'Thanh', '2002-02-23', 'Nam', '0981090441', 'Hà Nội', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2023-07-21', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26VT001', 'SVNT26VT001', 'Hoàng', 'Anh', '2006-01-23', 'Nam', '0998122022', 'Bắc Ninh', 'NGOCTRUC', 'VT', 'BaoLuu', '2023-07-16', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26VT002', 'SVNT26VT002', 'Vương', 'Bích', '2006-09-29', 'Nam', '0904480409', 'Quảng Nam', 'NGOCTRUC', 'VT', 'BaoLuu', '2023-08-20', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26KT001', 'SVNT26KT001', 'Hồ', 'Tâm', '2002-07-19', 'Nu', '0922841119', 'Phú Yên', 'NGOCTRUC', 'KT', 'BaoLuu', '2024-06-11', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26KT002', 'SVNT26KT002', 'Hồ', 'Vân', '2004-09-09', 'Nu', '0954641094', 'Hà Nội', 'NGOCTRUC', 'KT', 'DangHoc', '2022-07-04', '2026-04-27 12:31:55')
ON CONFLICT ("MaSV") DO NOTHING;

-- ---- GiangVien ----
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVNT26CNTT001', 'GVNT26CNTT001', 'Lý', 'Hương', 'PGS', NULL, '0972856303', 'NGOCTRUC', 'CNTT', 'DangCongTac', '2016-05-15', '2026-04-27 12:31:55')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVNT26CNTT002', 'GVNT26CNTT002', 'Hoàng', 'Dũng', 'CN', NULL, '0965428206', 'NGOCTRUC', 'CNTT', 'TamNghi', '2014-12-04', '2026-04-27 12:31:55')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVNT26ATTT001', 'GVNT26ATTT001', 'Dương', 'Oanh', 'CN', NULL, '0983691673', 'NGOCTRUC', 'ATTT', 'DangCongTac', '2011-12-15', '2026-04-27 12:31:55')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVNT26VT001', 'GVNT26VT001', 'Hồ', 'Khánh', 'CN', 'PGS', '0925746150', 'NGOCTRUC', 'VT', 'DangCongTac', '2015-02-03', '2026-04-27 12:31:55')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVNT26KT001', 'GVNT26KT001', 'Nguyễn', 'Bảo', 'TS', NULL, '0951917123', 'NGOCTRUC', 'KT', 'TamNghi', '2014-12-04', '2026-04-27 12:31:55')
ON CONFLICT ("MaGV") DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG001', 'Phong 1', 'D', 4, 100, 'LyThuyet', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG002', 'Phong 2', 'B', 3, 50, 'LyThuyet', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG003', 'Phong 3', 'C', 1, 40, 'LyThuyet', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG004', 'Phong 4', 'D', 3, 40, 'HoiTruong', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG005', 'Phong 5', 'D', 4, 60, 'MayTinh', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG006', 'Phong 6', 'B', 5, 50, 'MayTinh', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG007', 'Phong 7', 'C', 2, 80, 'LyThuyet', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao")
VALUES ('PNG008', 'Phong 8', 'B', 1, 30, 'LyThuyet', 'NGOCTRUC', 'HoatDong', '2026-04-27 12:31:55')
ON CONFLICT ("MaPhong") DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1009-NGOCTRUC-01', 'CS1009', 'HK20251', 'NGOCTRUC', 'GVNT26ATTT001', 'CS1009-01', 10, 3, 'Hybrid', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1006-NGOCTRUC-01', 'CS1006', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT001', 'CS1006-01', 10, 1, 'Hybrid', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1005-NGOCTRUC-01', 'CS1005', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT002', 'CS1005-01', 12, 5, 'Offline', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1003-NGOCTRUC-01', 'CS1003', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT002', 'CS1003-01', 40, 10, 'Offline', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1010-NGOCTRUC-01', 'CS1010', 'HK20251', 'NGOCTRUC', 'GVNT26ATTT001', 'CS1010-01', 30, 1, 'Online', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1002-NGOCTRUC-01', 'CS1002', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT002', 'CS1002-01', 50, 13, 'Offline', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1008-NGOCTRUC-01', 'CS1008', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT001', 'CS1008-01', 40, 8, 'Offline', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1006-NGOCTRUC-02', 'CS1006', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT001', 'CS1006-02', 60, 9, 'Online', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1007-NGOCTRUC-01', 'CS1007', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT001', 'CS1007-01', 30, 0, 'Offline', 'Dong', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1003-NGOCTRUC-02', 'CS1003', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT001', 'CS1003-02', 50, 13, 'Offline', 'Mo', '2026-04-27 12:31:55')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- ---- LichHoc ----
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0001', 'CS1009-NGOCTRUC-01', 'PNG002', 6, 10, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0002', 'CS1006-NGOCTRUC-01', 'PNG008', 3, 1, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0003', 'CS1005-NGOCTRUC-01', 'PNG008', 3, 1, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0004', 'CS1003-NGOCTRUC-01', 'PNG002', 2, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0005', 'CS1010-NGOCTRUC-01', 'PNG006', 4, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0006', 'CS1010-NGOCTRUC-01', 'PNG003', 4, 1, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0007', 'CS1002-NGOCTRUC-01', 'PNG002', 5, 4, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0008', 'CS1002-NGOCTRUC-01', 'PNG007', 5, 10, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0009', 'CS1008-NGOCTRUC-01', 'PNG008', 3, 1, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0010', 'CS1008-NGOCTRUC-01', 'PNG008', 6, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0011', 'CS1006-NGOCTRUC-02', 'PNG002', 5, 1, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0012', 'CS1007-NGOCTRUC-01', 'PNG005', 7, 7, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0013', 'CS1007-NGOCTRUC-01', 'PNG008', 7, 10, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0014', 'CS1003-NGOCTRUC-02', 'PNG004', 6, 10, 4, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LNG0015', 'CS1003-NGOCTRUC-02', 'PNG002', 5, 7, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;

-- -- ---- DangKy (Demo Enrollments) ----
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT001', 'SVNT26CNTT001', 'CS1008-NGOCTRUC-01', 'CS1008', 'HK20251', '2025-09-05 13:52:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT001', 'SVNT26CNTT001', 'CS1005-NGOCTRUC-01', 'CS1005', 'HK20251', '2025-09-05 14:44:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT002', 'SVNT26CNTT002', 'CS1008-NGOCTRUC-01', 'CS1008', 'HK20251', '2025-09-05 13:40:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT002', 'SVNT26CNTT002', 'CS1003-NGOCTRUC-01', 'CS1003', 'HK20251', '2025-09-05 10:57:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT003', 'SVNT26CNTT003', 'CS1007-NGOCTRUC-01', 'CS1007', 'HK20251', '2025-09-05 13:22:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT003', 'SVNT26CNTT003', 'CS1006-NGOCTRUC-02', 'CS1006', 'HK20251', '2025-09-05 11:58:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26CNTT003', 'SVNT26CNTT003', 'CS1008-NGOCTRUC-01', 'CS1008', 'HK20251', '2025-09-05 08:24:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26ATTT001', 'SVNT26ATTT001', 'CS1002-NGOCTRUC-01', 'CS1002', 'HK20251', '2025-09-05 17:17:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26ATTT001', 'SVNT26ATTT001', 'CS1010-NGOCTRUC-01', 'CS1010', 'HK20251', '2025-09-05 11:01:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26ATTT002', 'SVNT26ATTT002', 'CS1003-NGOCTRUC-01', 'CS1003', 'HK20251', '2025-09-05 11:34:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;
-- INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
-- VALUES ('SVNT26ATTT002', 'SVNT26ATTT002', 'CS1002-NGOCTRUC-01', 'CS1002', 'HK20251', '2025-09-05 11:57:00', 'DaDangKy', 1, NULL)
-- ON CONFLICT DO NOTHING;

