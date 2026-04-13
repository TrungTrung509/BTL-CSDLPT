-- ============================================================
-- DỮ LIỆU CỤC BỘ - Site HADONG (Cơ sở Hà Nội)
-- Sinh: 2026-04-10 00:43:10
-- ============================================================

-- ---- SinhVien ----
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0001', 'Nguyễn', 'Vinh', '2003-03-09', 'Nam', 'nguyen.vinh394@ptit.edu.vn', '0902499867', 'Quảng Nam', 'HADONG', 'KT', 'DangHoc', '2023-11-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0002', 'Vũ', 'An', '2005-09-14', 'Nu', 'vu.an612@ptit.edu.vn', '0924423060', 'Khánh Hòa', 'HADONG', 'CNTT', 'DangHoc', '2024-12-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0003', 'Lê', 'Phong', '2001-09-07', 'Nam', 'le.phong32@ptit.edu.vn', '0968056962', 'Hải Phòng', 'HADONG', 'ATTT', 'DangHoc', '2023-12-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0004', 'Hồ', 'Hoàng', '2004-02-22', 'Nu', 'ho.hoang725@ptit.edu.vn', '0975961394', 'Khánh Hòa', 'HADONG', 'CNTT', 'BaoLuu', '2024-11-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0005', 'Ngô', 'Bình', '2000-09-26', 'Nam', 'ngo.binh422@ptit.edu.vn', '0986414861', 'Phú Yên', 'HADONG', 'CNTT', 'DangHoc', '2020-09-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0006', 'Đỗ', 'Giang', '2004-04-15', 'Nu', 'do.giang450@ptit.edu.vn', '0924135902', 'Nghệ An', 'HADONG', 'KT', 'BaoLuu', '2020-09-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0007', 'Trương', 'Cường', '2004-06-29', 'Nam', 'truong.cuong612@ptit.edu.vn', '0909819104', 'Ninh Bình', 'HADONG', 'VT', 'DangHoc', '2024-03-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0008', 'Bùi', 'Nga', '2004-07-27', 'Nam', 'bui.nga622@ptit.edu.vn', '0931547315', 'Bắc Ninh', 'HADONG', 'ATTT', 'DangHoc', '2022-03-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0009', 'Đặng', 'Dung', '2003-02-08', 'Nu', 'dang.dung212@ptit.edu.vn', '0938973228', 'Hà Nội', 'HADONG', 'ATTT', 'DangHoc', '2021-06-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0010', 'Huỳnh', 'Em', '2002-12-03', 'Nam', 'huynh.em941@ptit.edu.vn', '0998138907', 'Ninh Bình', 'HADONG', 'VT', 'DangHoc', '2024-01-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0011', 'Hoàng', 'Nga', '2004-06-28', 'Nu', 'hoang.nga882@ptit.edu.vn', '0912452014', 'Quảng Nam', 'HADONG', 'ATTT', 'DangHoc', '2020-05-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0012', 'Ngô', 'Dung', '2002-07-17', 'Nu', 'ngo.dung577@ptit.edu.vn', '0991972925', 'Hà Nội', 'HADONG', 'KT', 'DangHoc', '2020-01-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0013', 'Vương', 'Khánh', '2000-07-23', 'Nam', 'vuong.khanh68@ptit.edu.vn', '0946573127', 'Khánh Hòa', 'HADONG', 'VT', 'DangHoc', '2024-04-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0014', 'Đinh', 'My', '2002-07-13', 'Nam', 'dinh.my741@ptit.edu.vn', '0994800768', 'Thái Bình', 'HADONG', 'VT', 'DangHoc', '2020-10-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0015', 'Đỗ', 'Tuấn', '2001-04-04', 'Nu', 'do.tuan35@ptit.edu.vn', '0916172329', 'Thừa Thiên Huế', 'HADONG', 'ATTT', 'DangHoc', '2024-11-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0016', 'Hồ', 'Tâm', '2005-05-02', 'Nam', 'ho.tam879@ptit.edu.vn', '0916014124', 'Quảng Nam', 'HADONG', 'CNTT', 'DangHoc', '2020-12-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0017', 'Huỳnh', 'Khánh', '2005-08-09', 'Nam', 'huynh.khanh168@ptit.edu.vn', '0985996835', 'Đà Nẵng', 'HADONG', 'KT', 'DangHoc', '2020-02-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0018', 'Đỗ', 'Em', '2001-06-02', 'Nu', 'do.em1@ptit.edu.vn', '0965523179', 'Quảng Nam', 'HADONG', 'VT', 'DangHoc', '2020-08-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0019', 'Nguyễn', 'Trọng', '2006-10-14', 'Nam', 'nguyen.trong895@ptit.edu.vn', '0906789434', 'Ninh Thuận', 'HADONG', 'CNTT', 'DangHoc', '2022-02-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0020', 'Tạ', 'Lan', '2001-03-25', 'Nu', 'ta.lan237@ptit.edu.vn', '0982547871', 'Hà Nội', 'HADONG', 'CNTT', 'DangHoc', '2021-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0021', 'Hồ', 'An', '2003-10-09', 'Nam', 'ho.an311@ptit.edu.vn', '0968371109', 'Hưng Yên', 'HADONG', 'ATTT', 'BaoLuu', '2023-04-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0022', 'Hồ', 'Huy', '2004-09-26', 'Nam', 'ho.huy334@ptit.edu.vn', '0908933058', 'Bắc Ninh', 'HADONG', 'KT', 'DangHoc', '2023-04-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0023', 'Đỗ', 'Toàn', '2003-03-04', 'Nam', 'do.toan648@ptit.edu.vn', '0982195852', 'Vĩnh Phúc', 'HADONG', 'ATTT', 'DangHoc', '2020-01-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0024', 'Tạ', 'Lan', '2003-12-31', 'Nu', 'ta.lan668@ptit.edu.vn', '0916250067', 'Nghệ An', 'HADONG', 'VT', 'BaoLuu', '2024-10-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0025', 'Nguyễn', 'Nghĩa', '2000-09-13', 'Nam', 'nguyen.nghia878@ptit.edu.vn', '0916205903', 'Khánh Hòa', 'HADONG', 'ATTT', 'DangHoc', '2021-02-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0026', 'Nguyễn', 'Toàn', '2001-09-18', 'Nu', 'nguyen.toan511@ptit.edu.vn', '0901321572', 'Ninh Thuận', 'HADONG', 'CNTT', 'BaoLuu', '2020-08-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0027', 'Trương', 'Thúy', '2006-04-02', 'Nu', 'truong.thuy818@ptit.edu.vn', '0957983895', 'Ninh Bình', 'HADONG', 'VT', 'DangHoc', '2024-08-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0028', 'Phạm', 'Hoàng', '2000-01-10', 'Nu', 'pham.hoang268@ptit.edu.vn', '0934130526', 'Thừa Thiên Huế', 'HADONG', 'CNTT', 'BaoLuu', '2024-01-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0029', 'Trần', 'Tuấn', '2006-03-24', 'Nam', 'tran.tuan915@ptit.edu.vn', '0964359594', 'Ninh Thuận', 'HADONG', 'VT', 'DangHoc', '2020-04-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0030', 'Lê', 'Thi', '2005-01-24', 'Nam', 'le.thi647@ptit.edu.vn', '0921468189', 'Thanh Hóa', 'HADONG', 'VT', 'BaoLuu', '2024-04-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0031', 'Ngô', 'Bình', '2002-05-07', 'Nam', 'ngo.binh875@ptit.edu.vn', '0959744811', 'Quảng Bình', 'HADONG', 'VT', 'DangHoc', '2024-04-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0032', 'Ngô', 'Khánh', '2006-01-11', 'Nu', 'ngo.khanh644@ptit.edu.vn', '0903115139', 'Phú Yên', 'HADONG', 'KT', 'DangHoc', '2023-08-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0033', 'Phạm', 'Hà', '2002-11-25', 'Nu', 'pham.ha316@ptit.edu.vn', '0935415544', 'Ninh Bình', 'HADONG', 'ATTT', 'DangHoc', '2021-11-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0034', 'Hoàng', 'My', '2001-10-15', 'Nu', 'hoang.my829@ptit.edu.vn', '0911176861', 'Ninh Bình', 'HADONG', 'ATTT', 'DangHoc', '2021-04-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0035', 'Huỳnh', 'Thảo', '2006-06-09', 'Nu', 'huynh.thao691@ptit.edu.vn', '0932515396', 'Hưng Yên', 'HADONG', 'CNTT', 'DangHoc', '2024-04-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0036', 'Lưu', 'Thịnh', '2003-03-21', 'Nam', 'luu.thinh127@ptit.edu.vn', '0936932966', 'Thanh Hóa', 'HADONG', 'CNTT', 'BaoLuu', '2023-06-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0037', 'Đỗ', 'Quang', '2004-08-01', 'Nu', 'do.quang63@ptit.edu.vn', '0931743489', 'Ninh Thuận', 'HADONG', 'CNTT', 'DangHoc', '2020-08-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0038', 'Ngô', 'Lâm', '2001-08-05', 'Nu', 'ngo.lam301@ptit.edu.vn', '0984796520', 'Ninh Bình', 'HADONG', 'KT', 'BaoLuu', '2023-03-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0039', 'Huỳnh', 'Trung', '2004-01-08', 'Nam', 'huynh.trung776@ptit.edu.vn', '0942831420', 'Quảng Bình', 'HADONG', 'KT', 'BaoLuu', '2024-08-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0040', 'Lưu', 'Ly', '2003-05-08', 'Nam', 'luu.ly178@ptit.edu.vn', '0927617075', 'Hà Tĩnh', 'HADONG', 'KT', 'DangHoc', '2024-06-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0041', 'Ngô', 'Vinh', '2003-02-12', 'Nam', 'ngo.vinh355@ptit.edu.vn', '0928880967', 'Quảng Nam', 'HADONG', 'ATTT', 'BaoLuu', '2022-06-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0042', 'Cao', 'Dung', '2006-10-07', 'Nam', 'cao.dung382@ptit.edu.vn', '0915271471', 'Hưng Yên', 'HADONG', 'KT', 'DangHoc', '2022-07-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0043', 'Hồ', 'Hùng', '2001-09-06', 'Nu', 'ho.hung689@ptit.edu.vn', '0924392177', 'Nghệ An', 'HADONG', 'CNTT', 'DangHoc', '2024-01-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0044', 'Đỗ', 'Linh', '2000-08-06', 'Nam', 'do.linh610@ptit.edu.vn', '0952870001', 'Ninh Bình', 'HADONG', 'ATTT', 'DangHoc', '2024-10-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0045', 'Phạm', 'Loan', '2001-05-11', 'Nu', 'pham.loan294@ptit.edu.vn', '0996305256', 'Quảng Ngãi', 'HADONG', 'CNTT', 'DangHoc', '2024-05-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0046', 'Lê', 'My', '2000-09-28', 'Nam', 'le.my956@ptit.edu.vn', '0987012630', 'Đà Nẵng', 'HADONG', 'CNTT', 'DangHoc', '2024-07-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0047', 'Phạm', 'Lam', '2004-03-18', 'Nam', 'pham.lam153@ptit.edu.vn', '0991827609', 'Quảng Bình', 'HADONG', 'VT', 'DangHoc', '2022-10-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0048', 'Phạm', 'Ly', '2004-05-23', 'Nu', 'pham.ly133@ptit.edu.vn', '0955897295', 'Hải Dương', 'HADONG', 'KT', 'BaoLuu', '2021-06-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0049', 'Phạm', 'An', '2005-11-13', 'Nu', 'pham.an829@ptit.edu.vn', '0952287025', 'Hà Tĩnh', 'HADONG', 'CNTT', 'BaoLuu', '2021-03-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0050', 'Trịnh', 'Huy', '2000-04-11', 'Nu', 'trinh.huy447@ptit.edu.vn', '0941723644', 'Bình Định', 'HADONG', 'KT', 'DangHoc', '2020-11-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0051', 'Phạm', 'Việt', '2006-03-19', 'Nam', 'pham.viet296@ptit.edu.vn', '0956085219', 'Bình Định', 'HADONG', 'VT', 'DangHoc', '2023-07-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0052', 'Hoàng', 'Ly', '2002-11-15', 'Nu', 'hoang.ly474@ptit.edu.vn', '0919050756', 'Bình Thuận', 'HADONG', 'CNTT', 'DangHoc', '2021-07-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0053', 'Đặng', 'Bích', '2003-06-21', 'Nu', 'dang.bich302@ptit.edu.vn', '0911679905', 'Hưng Yên', 'HADONG', 'CNTT', 'BaoLuu', '2023-03-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0054', 'Đỗ', 'Trung', '2004-01-24', 'Nu', 'do.trung474@ptit.edu.vn', '0938564344', 'Hải Dương', 'HADONG', 'VT', 'BaoLuu', '2021-06-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0055', 'Vũ', 'Quang', '2003-01-17', 'Nam', 'vu.quang469@ptit.edu.vn', '0975680350', 'Hà Tĩnh', 'HADONG', 'KT', 'DangHoc', '2020-04-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0056', 'Mạc', 'Trang', '2001-06-25', 'Nam', 'mac.trang279@ptit.edu.vn', '0985341367', 'Hải Phòng', 'HADONG', 'VT', 'DangHoc', '2021-11-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0057', 'Lưu', 'Hiền', '2003-06-12', 'Nu', 'luu.hien346@ptit.edu.vn', '0993893369', 'Phú Yên', 'HADONG', 'VT', 'DangHoc', '2022-07-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0058', 'Hồ', 'Ly', '2001-08-27', 'Nu', 'ho.ly721@ptit.edu.vn', '0902760465', 'Ninh Thuận', 'HADONG', 'VT', 'BaoLuu', '2021-10-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0059', 'Phạm', 'Anh', '2003-05-14', 'Nu', 'pham.anh351@ptit.edu.vn', '0934707764', 'Quảng Ngãi', 'HADONG', 'ATTT', 'DangHoc', '2020-09-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0060', 'Tạ', 'Loan', '2003-02-06', 'Nam', 'ta.loan240@ptit.edu.vn', '0977284848', 'Ninh Bình', 'HADONG', 'CNTT', 'DangHoc', '2024-02-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0061', 'Trần', 'Minh', '2003-01-05', 'Nam', 'tran.minh899@ptit.edu.vn', '0902936306', 'Quảng Ngãi', 'HADONG', 'KT', 'DangHoc', '2021-03-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0062', 'Đinh', 'Lam', '2004-02-29', 'Nam', 'dinh.lam357@ptit.edu.vn', '0958111359', 'Bình Thuận', 'HADONG', 'CNTT', 'DangHoc', '2021-01-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0063', 'Trịnh', 'Oanh', '2005-03-23', 'Nu', 'trinh.oanh489@ptit.edu.vn', '0907247173', 'Bình Thuận', 'HADONG', 'KT', 'DangHoc', '2020-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0064', 'Bùi', 'Hùng', '2000-06-15', 'Nu', 'bui.hung774@ptit.edu.vn', '0947523585', 'Quảng Nam', 'HADONG', 'KT', 'DangHoc', '2021-02-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0065', 'Hoàng', 'Oanh', '2003-07-27', 'Nam', 'hoang.oanh54@ptit.edu.vn', '0937244263', 'Thanh Hóa', 'HADONG', 'ATTT', 'DangHoc', '2020-09-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0066', 'Trần', 'Trang', '2000-11-19', 'Nam', 'tran.trang575@ptit.edu.vn', '0977029935', 'Vĩnh Phúc', 'HADONG', 'VT', 'DangHoc', '2022-05-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0067', 'Lê', 'Yến', '2004-05-14', 'Nu', 'le.yen462@ptit.edu.vn', '0997359151', 'Thanh Hóa', 'HADONG', 'VT', 'DangHoc', '2024-07-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0068', 'Trần', 'Phong', '2000-03-28', 'Nam', 'tran.phong576@ptit.edu.vn', '0994763734', 'Bắc Ninh', 'HADONG', 'KT', 'DangHoc', '2022-09-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0069', 'Lưu', 'Oanh', '2004-02-10', 'Nu', 'luu.oanh793@ptit.edu.vn', '0971408644', 'Hải Dương', 'HADONG', 'ATTT', 'DangHoc', '2021-08-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0070', 'Phan', 'Linh', '2000-02-06', 'Nam', 'phan.linh862@ptit.edu.vn', '0927626582', 'Quảng Bình', 'HADONG', 'CNTT', 'DangHoc', '2020-07-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0071', 'Lê', 'Thịnh', '2005-09-26', 'Nu', 'le.thinh672@ptit.edu.vn', '0975121837', 'Hải Phòng', 'HADONG', 'CNTT', 'DangHoc', '2021-04-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0072', 'Đinh', 'Lâm', '2001-01-06', 'Nam', 'dinh.lam572@ptit.edu.vn', '0946461739', 'Bình Thuận', 'HADONG', 'VT', 'BaoLuu', '2022-06-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0073', 'Đinh', 'Liên', '2004-11-25', 'Nu', 'dinh.lien160@ptit.edu.vn', '0951612385', 'Quảng Trị', 'HADONG', 'VT', 'DangHoc', '2024-09-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0074', 'Dương', 'Dũng', '2000-01-02', 'Nu', 'duong.dung949@ptit.edu.vn', '0985498406', 'Hà Nội', 'HADONG', 'CNTT', 'DangHoc', '2024-06-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0075', 'Hoàng', 'Phát', '2001-10-21', 'Nam', 'hoang.phat430@ptit.edu.vn', '0902514402', 'Nam Định', 'HADONG', 'ATTT', 'DangHoc', '2023-07-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0076', 'Dương', 'Nga', '2004-06-27', 'Nam', 'duong.nga535@ptit.edu.vn', '0956800485', 'Vĩnh Phúc', 'HADONG', 'VT', 'DangHoc', '2021-01-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0077', 'Phạm', 'An', '2003-06-03', 'Nam', 'pham.an189@ptit.edu.vn', '0936167757', 'Quảng Nam', 'HADONG', 'KT', 'DangHoc', '2020-07-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0078', 'Trương', 'Việt', '2004-03-07', 'Nu', 'truong.viet497@ptit.edu.vn', '0955173801', 'Nghệ An', 'HADONG', 'KT', 'BaoLuu', '2024-11-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0079', 'Tạ', 'Tuấn', '2002-12-11', 'Nam', 'ta.tuan550@ptit.edu.vn', '0951154444', 'Hà Nội', 'HADONG', 'KT', 'BaoLuu', '2020-01-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0080', 'Đinh', 'Vân', '2004-01-26', 'Nam', 'dinh.van381@ptit.edu.vn', '0955283192', 'Ninh Thuận', 'HADONG', 'KT', 'DangHoc', '2023-05-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0081', 'Hoàng', 'Hiền', '2000-07-02', 'Nam', 'hoang.hien417@ptit.edu.vn', '0999759259', 'Đà Nẵng', 'HADONG', 'ATTT', 'BaoLuu', '2020-07-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0082', 'Cao', 'Sang', '2000-12-24', 'Nam', 'cao.sang234@ptit.edu.vn', '0904085357', 'Bắc Ninh', 'HADONG', 'ATTT', 'BaoLuu', '2020-07-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0083', 'Trịnh', 'Yến', '2004-10-02', 'Nu', 'trinh.yen517@ptit.edu.vn', '0949047143', 'Bình Định', 'HADONG', 'KT', 'DangHoc', '2024-04-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0084', 'Lý', 'Quỳnh', '2002-02-23', 'Nu', 'ly.quynh971@ptit.edu.vn', '0934677901', 'Phú Yên', 'HADONG', 'VT', 'DangHoc', '2022-09-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0085', 'Hoàng', 'Ly', '2006-05-10', 'Nu', 'hoang.ly746@ptit.edu.vn', '0905514986', 'Quảng Trị', 'HADONG', 'KT', 'DangHoc', '2022-12-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0086', 'Trần', 'Vinh', '2006-07-24', 'Nu', 'tran.vinh527@ptit.edu.vn', '0959684165', 'Quảng Ngãi', 'HADONG', 'VT', 'DangHoc', '2021-10-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0087', 'Trần', 'Toàn', '2000-06-30', 'Nu', 'tran.toan469@ptit.edu.vn', '0946025364', 'Hải Phòng', 'HADONG', 'VT', 'DangHoc', '2023-12-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0088', 'Ngô', 'Quỳnh', '2006-07-23', 'Nu', 'ngo.quynh995@ptit.edu.vn', '0961405285', 'Bắc Ninh', 'HADONG', 'CNTT', 'BaoLuu', '2021-07-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0089', 'Vũ', 'Cường', '2000-12-27', 'Nam', 'vu.cuong67@ptit.edu.vn', '0931358123', 'Hải Dương', 'HADONG', 'CNTT', 'DangHoc', '2022-06-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0090', 'Lê', 'Oanh', '2006-10-09', 'Nam', 'le.oanh367@ptit.edu.vn', '0936678967', 'Quảng Trị', 'HADONG', 'CNTT', 'DangHoc', '2020-04-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0091', 'Lý', 'Việt', '2002-06-06', 'Nam', 'ly.viet294@ptit.edu.vn', '0987962428', 'Thừa Thiên Huế', 'HADONG', 'CNTT', 'DangHoc', '2023-12-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0092', 'Lê', 'Nam', '2005-07-15', 'Nu', 'le.nam789@ptit.edu.vn', '0925999225', 'Hà Tĩnh', 'HADONG', 'ATTT', 'DangHoc', '2020-05-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0093', 'Huỳnh', 'Châu', '2003-11-16', 'Nam', 'huynh.chau511@ptit.edu.vn', '0982882536', 'Quảng Ngãi', 'HADONG', 'KT', 'DangHoc', '2021-11-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0094', 'Lê', 'Hoàng', '2001-09-23', 'Nu', 'le.hoang843@ptit.edu.vn', '0994689537', 'Quảng Trị', 'HADONG', 'CNTT', 'DangHoc', '2020-01-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0095', 'Lê', 'Phong', '2005-01-27', 'Nu', 'le.phong414@ptit.edu.vn', '0971343155', 'Bắc Ninh', 'HADONG', 'VT', 'DangHoc', '2024-04-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0096', 'Đinh', 'Nam', '2000-05-01', 'Nu', 'dinh.nam397@ptit.edu.vn', '0929961100', 'Nam Định', 'HADONG', 'KT', 'BaoLuu', '2022-06-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0097', 'Trần', 'Phong', '2005-01-17', 'Nam', 'tran.phong476@ptit.edu.vn', '0933609745', 'Khánh Hòa', 'HADONG', 'KT', 'DangHoc', '2024-05-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0098', 'Phạm', 'Huy', '2004-08-21', 'Nam', 'pham.huy342@ptit.edu.vn', '0961079837', 'Đà Nẵng', 'HADONG', 'CNTT', 'BaoLuu', '2020-11-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0099', 'Đỗ', 'Huy', '2005-01-07', 'Nu', 'do.huy125@ptit.edu.vn', '0919575554', 'Quảng Bình', 'HADONG', 'ATTT', 'DangHoc', '2022-08-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0100', 'Hoàng', 'Việt', '2005-05-02', 'Nam', 'hoang.viet470@ptit.edu.vn', '0941967834', 'Quảng Trị', 'HADONG', 'ATTT', 'DangHoc', '2022-03-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0101', 'Ngô', 'An', '2004-11-05', 'Nu', 'ngo.an183@ptit.edu.vn', '0961433053', 'Bắc Ninh', 'HADONG', 'KT', 'DangHoc', '2023-02-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0102', 'Lê', 'Dũng', '2002-07-03', 'Nu', 'le.dung434@ptit.edu.vn', '0983118444', 'Hà Tĩnh', 'HADONG', 'ATTT', 'DangHoc', '2020-03-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0103', 'Ngô', 'Nghĩa', '2006-02-19', 'Nam', 'ngo.nghia73@ptit.edu.vn', '0972218075', 'Bắc Ninh', 'HADONG', 'ATTT', 'DangHoc', '2023-06-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0104', 'Phạm', 'Hùng', '2004-11-28', 'Nu', 'pham.hung371@ptit.edu.vn', '0937610591', 'Hưng Yên', 'HADONG', 'ATTT', 'DangHoc', '2022-12-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0105', 'Ngô', 'Minh', '2002-12-25', 'Nu', 'ngo.minh218@ptit.edu.vn', '0939458086', 'Ninh Bình', 'HADONG', 'VT', 'DangHoc', '2023-05-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0106', 'Hoàng', 'Vinh', '2001-04-14', 'Nu', 'hoang.vinh542@ptit.edu.vn', '0907848549', 'Quảng Bình', 'HADONG', 'ATTT', 'DangHoc', '2023-05-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0107', 'Trần', 'Bình', '2000-10-13', 'Nam', 'tran.binh628@ptit.edu.vn', '0926784542', 'Nam Định', 'HADONG', 'ATTT', 'DangHoc', '2020-03-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0108', 'Đặng', 'Dung', '2005-12-25', 'Nu', 'dang.dung204@ptit.edu.vn', '0924462377', 'Thanh Hóa', 'HADONG', 'ATTT', 'DangHoc', '2022-07-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0109', 'Ngô', 'Linh', '2001-08-02', 'Nu', 'ngo.linh993@ptit.edu.vn', '0964592773', 'Đà Nẵng', 'HADONG', 'KT', 'DangHoc', '2024-09-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0110', 'Đinh', 'Thúy', '2001-07-04', 'Nu', 'dinh.thuy651@ptit.edu.vn', '0929810156', 'Nghệ An', 'HADONG', 'ATTT', 'BaoLuu', '2023-06-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0111', 'Vũ', 'Ly', '2002-06-03', 'Nam', 'vu.ly646@ptit.edu.vn', '0919900441', 'Đà Nẵng', 'HADONG', 'KT', 'DangHoc', '2020-02-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0112', 'Phan', 'Trí', '2000-09-10', 'Nam', 'phan.tri451@ptit.edu.vn', '0964312295', 'Phú Yên', 'HADONG', 'CNTT', 'DangHoc', '2020-03-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0113', 'Hoàng', 'Hạnh', '2001-09-05', 'Nam', 'hoang.hanh177@ptit.edu.vn', '0951855537', 'Bắc Ninh', 'HADONG', 'CNTT', 'BaoLuu', '2022-07-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0114', 'Ngô', 'Thu', '2001-03-07', 'Nam', 'ngo.thu316@ptit.edu.vn', '0903747252', 'Hưng Yên', 'HADONG', 'KT', 'BaoLuu', '2020-01-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0115', 'Lê', 'Vân', '2004-01-29', 'Nu', 'le.van736@ptit.edu.vn', '0918701038', 'Bắc Ninh', 'HADONG', 'CNTT', 'BaoLuu', '2021-11-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0116', 'Huỳnh', 'Lan', '2000-08-03', 'Nam', 'huynh.lan903@ptit.edu.vn', '0942450869', 'Bình Thuận', 'HADONG', 'ATTT', 'DangHoc', '2023-02-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0117', 'Tạ', 'Lan', '2002-05-06', 'Nam', 'ta.lan233@ptit.edu.vn', '0948208324', 'Quảng Bình', 'HADONG', 'ATTT', 'DangHoc', '2024-08-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0118', 'Cao', 'Em', '2000-05-04', 'Nu', 'cao.em787@ptit.edu.vn', '0956552114', 'Hà Nội', 'HADONG', 'KT', 'DangHoc', '2024-10-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0119', 'Huỳnh', 'Bảo', '2002-01-25', 'Nu', 'huynh.bao92@ptit.edu.vn', '0975658814', 'Hải Dương', 'HADONG', 'CNTT', 'DangHoc', '2022-03-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0120', 'Ngô', 'Minh', '2006-11-09', 'Nu', 'ngo.minh287@ptit.edu.vn', '0974537220', 'Bắc Ninh', 'HADONG', 'KT', 'BaoLuu', '2023-03-03')
ON CONFLICT (MaSV) DO NOTHING;

-- ---- GiangVien ----
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV001', 'Nguyễn', 'Việt', 'PGS', NULL, 'nguyen.viet365@gv.cntt-hd.ptit.edu.vn', '0977696226', 'HADONG', 'CNTT', 'DangCongTac', '2023-07-03')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV002', 'Phạm', 'An', 'CN', NULL, 'pham.an996@gv.cntt-hd.ptit.edu.vn', '0969786539', 'HADONG', 'ATTT', 'DangCongTac', '2015-08-01')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV003', 'Đỗ', 'Ngọc', 'TS', 'GTV', 'do.ngoc213@gv.cntt-hd.ptit.edu.vn', '0964501209', 'HADONG', 'ATTT', 'DangCongTac', '2018-03-31')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV004', 'Phạm', 'Em', 'ThS', 'PGS', 'pham.em926@gv.cntt-hd.ptit.edu.vn', '0948016831', 'HADONG', 'ATTT', 'TamNghi', '2020-01-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV005', 'Hoàng', 'Thúy', 'PGS', NULL, 'hoang.thuy660@gv.cntt-hd.ptit.edu.vn', '0953536296', 'HADONG', 'VT', 'TamNghi', '2012-04-23')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV006', 'Hồ', 'Khánh', 'ThS', 'PGS', 'ho.khanh584@gv.cntt-hd.ptit.edu.vn', '0996062417', 'HADONG', 'KT', 'TamNghi', '2013-11-30')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV007', 'Mạc', 'Việt', 'TS', NULL, 'mac.viet45@gv.cntt-hd.ptit.edu.vn', '0915526827', 'HADONG', 'VT', 'DangCongTac', '2014-01-16')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV008', 'Vương', 'Liên', 'ThS', 'GTV', 'vuong.lien20@gv.cntt-hd.ptit.edu.vn', '0912925836', 'HADONG', 'KT', 'DangCongTac', '2014-08-29')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV009', 'Lưu', 'Linh', 'ThS', NULL, 'luu.linh86@gv.cntt-hd.ptit.edu.vn', '0971831711', 'HADONG', 'KT', 'DangCongTac', '2016-06-06')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV010', 'Đặng', 'Tuấn', 'CN', NULL, 'dang.tuan273@gv.cntt-hd.ptit.edu.vn', '0973173500', 'HADONG', 'CNTT', 'DangCongTac', '2010-06-16')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV011', 'Lê', 'Tuấn', 'CN', 'GTV', 'le.tuan307@gv.cntt-hd.ptit.edu.vn', '0909501829', 'HADONG', 'VT', 'DangCongTac', '2023-07-11')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV012', 'Trần', 'Oanh', 'ThS', 'PGS', 'tran.oanh659@gv.cntt-hd.ptit.edu.vn', '0951051441', 'HADONG', 'VT', 'TamNghi', '2013-05-24')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV013', 'Mạc', 'Giang', 'ThS', 'PGS', 'mac.giang145@gv.cntt-hd.ptit.edu.vn', '0989323644', 'HADONG', 'ATTT', 'DangCongTac', '2022-08-14')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV014', 'Vương', 'Phong', 'TS', NULL, 'vuong.phong52@gv.cntt-hd.ptit.edu.vn', '0979387975', 'HADONG', 'CNTT', 'TamNghi', '2012-07-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV015', 'Phạm', 'Tuấn', 'TS', 'PGS', 'pham.tuan69@gv.cntt-hd.ptit.edu.vn', '0979411290', 'HADONG', 'KT', 'TamNghi', '2014-06-16')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV016', 'Nguyễn', 'Bích', 'CN', NULL, 'nguyen.bich799@gv.cntt-hd.ptit.edu.vn', '0915594215', 'HADONG', 'KT', 'TamNghi', '2013-05-30')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV017', 'Bùi', 'Ngọc', 'ThS', 'GTV', 'bui.ngoc679@gv.cntt-hd.ptit.edu.vn', '0961478888', 'HADONG', 'KT', 'TamNghi', '2021-05-16')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV018', 'Trương', 'Nam', 'ThS', NULL, 'truong.nam197@gv.cntt-hd.ptit.edu.vn', '0905147757', 'HADONG', 'KT', 'DangCongTac', '2014-08-03')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV019', 'Trần', 'Sang', 'ThS', NULL, 'tran.sang677@gv.cntt-hd.ptit.edu.vn', '0932280869', 'HADONG', 'KT', 'DangCongTac', '2015-02-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV020', 'Vương', 'An', 'ThS', NULL, 'vuong.an692@gv.cntt-hd.ptit.edu.vn', '0953954313', 'HADONG', 'KT', 'DangCongTac', '2013-06-08')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV021', 'Tạ', 'Loan', 'PGS', 'GTV', 'ta.loan697@gv.cntt-hd.ptit.edu.vn', '0983032094', 'HADONG', 'VT', 'DangCongTac', '2015-10-25')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV022', 'Tạ', 'Vân', 'CN', NULL, 'ta.van417@gv.cntt-hd.ptit.edu.vn', '0981311779', 'HADONG', 'KT', 'DangCongTac', '2011-03-17')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV023', 'Lý', 'Hà', 'PGS', NULL, 'ly.ha576@gv.cntt-hd.ptit.edu.vn', '0998258600', 'HADONG', 'VT', 'DangCongTac', '2013-12-04')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV024', 'Tạ', 'Anh', 'ThS', NULL, 'ta.anh34@gv.cntt-hd.ptit.edu.vn', '0986542387', 'HADONG', 'VT', 'DangCongTac', '2012-07-31')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV025', 'Đặng', 'Ngọc', 'CN', NULL, 'dang.ngoc64@gv.cntt-hd.ptit.edu.vn', '0957221137', 'HADONG', 'ATTT', 'DangCongTac', '2016-07-24')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV026', 'Ngô', 'Hương', 'ThS', NULL, 'ngo.huong570@gv.cntt-hd.ptit.edu.vn', '0994226709', 'HADONG', 'KT', 'TamNghi', '2018-03-18')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV027', 'Hoàng', 'Anh', 'ThS', 'PGS', 'hoang.anh199@gv.cntt-hd.ptit.edu.vn', '0995017334', 'HADONG', 'VT', 'DangCongTac', '2022-01-19')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV028', 'Lê', 'Hương', 'CN', 'PGS', 'le.huong802@gv.cntt-hd.ptit.edu.vn', '0952920616', 'HADONG', 'CNTT', 'TamNghi', '2023-03-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV029', 'Ngô', 'Thảo', 'TS', 'PGS', 'ngo.thao490@gv.cntt-hd.ptit.edu.vn', '0952594079', 'HADONG', 'ATTT', 'TamNghi', '2015-03-17')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV030', 'Đặng', 'Khánh', 'PGS', 'PGS', 'dang.khanh23@gv.cntt-hd.ptit.edu.vn', '0986578649', 'HADONG', 'VT', 'DangCongTac', '2019-12-02')
ON CONFLICT (MaGV) DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA001', 'Phong 1', 'Toa B', 2, 120, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA002', 'Phong 2', 'Toa B', 1, 100, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA003', 'Phong 3', 'Toa D', 3, 80, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA004', 'Phong 4', 'Toa C', 3, 120, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA005', 'Phong 5', 'Toa D', 4, 40, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA006', 'Phong 6', 'Toa C', 4, 30, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA007', 'Phong 7', 'Toa B', 2, 30, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA008', 'Phong 8', 'Toa B', 5, 120, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA009', 'Phong 9', 'Toa C', 4, 40, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA010', 'Phong 10', 'Toa C', 2, 50, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA011', 'Phong 11', 'Toa A', 4, 30, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA012', 'Phong 12', 'Toa A', 1, 80, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA013', 'Phong 13', 'Toa C', 2, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA014', 'Phong 14', 'Toa B', 4, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA015', 'Phong 15', 'Toa D', 1, 60, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA016', 'Phong 16', 'Toa D', 1, 80, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA017', 'Phong 17', 'Toa B', 3, 60, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA018', 'Phong 18', 'Toa B', 5, 80, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA019', 'Phong 19', 'Toa C', 1, 50, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA020', 'Phong 20', 'Toa D', 5, 120, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('VT2001-HADONG-01', 'VT2001', 'HK20251', 'HADONG', 'HADONGGV018', 'VT2001-01', 15, 6, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HADONG-01', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV029', 'CS1015-01', 12, 6, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1005-HADONG-01', 'CS1005', 'HK20251', 'HADONG', 'HADONGGV024', 'CS1005-01', 15, 0, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-HADONG-01', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV002', 'CS1013-01', 12, 2, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1011-HADONG-01', 'CS1011', 'HK20251', 'HADONG', 'HADONGGV017', 'CS1011-01', 12, 3, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1011-HADONG-02', 'CS1011', 'HK20251', 'HADONG', 'HADONGGV010', 'CS1011-02', 50, 16, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HADONG-01', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV013', 'CS1009-01', 30, 10, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HADONG-01', 'CS1006', 'HK20251', 'HADONG', 'HADONGGV023', 'CS1006-01', 60, 10, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-HADONG-02', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV026', 'CS1013-02', 60, 5, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HADONG-02', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV019', 'CS1015-02', 50, 1, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HADONG-01', 'CS1002', 'HK20251', 'HADONG', 'HADONGGV001', 'CS1002-01', 50, 12, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HADONG-02', 'CS1002', 'HK20251', 'HADONG', 'HADONGGV021', 'CS1002-02', 50, 20, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HADONG-03', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV002', 'CS1015-03', 50, 19, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HADONG-03', 'CS1002', 'HK20251', 'HADONG', 'HADONGGV014', 'CS1002-03', 40, 8, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-HADONG-03', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV002', 'CS1013-03', 50, 4, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HADONG-01', 'CS1004', 'HK20251', 'HADONG', 'HADONGGV016', 'CS1004-01', 40, 13, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HADONG-01', 'CS1008', 'HK20251', 'HADONG', 'HADONGGV030', 'CS1008-01', 40, 18, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HADONG-01', 'CS1001', 'HK20251', 'HADONG', 'HADONGGV007', 'CS1001-01', 40, 0, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HADONG-02', 'CS1008', 'HK20251', 'HADONG', 'HADONGGV028', 'CS1008-02', 60, 20, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HADONG-03', 'CS1008', 'HK20251', 'HADONG', 'HADONGGV028', 'CS1008-03', 40, 13, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HADONG-02', 'CS1001', 'HK20251', 'HADONG', 'HADONGGV018', 'CS1001-02', 50, 18, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HADONG-02', 'CS1006', 'HK20251', 'HADONG', 'HADONGGV026', 'CS1006-02', 50, 14, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HADONG-02', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV023', 'CS1009-02', 60, 1, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HADONG-03', 'CS1006', 'HK20251', 'HADONG', 'HADONGGV006', 'CS1006-03', 40, 14, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HADONG-03', 'CS1001', 'HK20251', 'HADONG', 'HADONGGV012', 'CS1001-03', 60, 18, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;

-- ---- LichHoc ----
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0001', 'VT2001-HADONG-01', 'PHA008', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0002', 'VT2001-HADONG-01', 'PHA006', 4, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0003', 'VT2001-HADONG-01', 'PHA008', 2, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0004', 'CS1015-HADONG-01', 'PHA012', 7, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0005', 'CS1015-HADONG-01', 'PHA018', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0006', 'CS1015-HADONG-01', 'PHA014', 6, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0007', 'CS1005-HADONG-01', 'PHA011', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0008', 'CS1005-HADONG-01', 'PHA008', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0009', 'CS1013-HADONG-01', 'PHA011', 2, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0010', 'CS1013-HADONG-01', 'PHA020', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0011', 'CS1011-HADONG-01', 'PHA018', 3, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0012', 'CS1011-HADONG-01', 'PHA001', 4, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0013', 'CS1011-HADONG-02', 'PHA020', 7, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0014', 'CS1011-HADONG-02', 'PHA003', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0015', 'CS1011-HADONG-02', 'PHA012', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0016', 'CS1009-HADONG-01', 'PHA015', 6, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0017', 'CS1009-HADONG-01', 'PHA015', 7, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0018', 'CS1006-HADONG-01', 'PHA015', 5, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0019', 'CS1006-HADONG-01', 'PHA005', 6, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0020', 'CS1006-HADONG-01', 'PHA006', 2, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0021', 'CS1013-HADONG-02', 'PHA008', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0022', 'CS1013-HADONG-02', 'PHA015', 2, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0023', 'CS1015-HADONG-02', 'PHA005', 5, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0024', 'CS1015-HADONG-02', 'PHA002', 7, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0025', 'CS1002-HADONG-01', 'PHA003', 2, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0026', 'CS1002-HADONG-01', 'PHA001', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0027', 'CS1002-HADONG-02', 'PHA010', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0028', 'CS1002-HADONG-02', 'PHA009', 5, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0029', 'CS1015-HADONG-03', 'PHA009', 6, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0030', 'CS1015-HADONG-03', 'PHA001', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0031', 'CS1015-HADONG-03', 'PHA006', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0032', 'CS1002-HADONG-03', 'PHA010', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0033', 'CS1002-HADONG-03', 'PHA012', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0034', 'CS1002-HADONG-03', 'PHA003', 7, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0035', 'CS1013-HADONG-03', 'PHA014', 3, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0036', 'CS1013-HADONG-03', 'PHA003', 6, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0037', 'CS1013-HADONG-03', 'PHA012', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0038', 'CS1004-HADONG-01', 'PHA002', 3, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0039', 'CS1004-HADONG-01', 'PHA010', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0040', 'CS1008-HADONG-01', 'PHA017', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0041', 'CS1008-HADONG-01', 'PHA020', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0042', 'CS1008-HADONG-01', 'PHA016', 2, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0043', 'CS1001-HADONG-01', 'PHA019', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0044', 'CS1001-HADONG-01', 'PHA018', 7, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0045', 'CS1001-HADONG-01', 'PHA017', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0046', 'CS1008-HADONG-02', 'PHA010', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0047', 'CS1008-HADONG-02', 'PHA001', 3, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0048', 'CS1008-HADONG-03', 'PHA014', 7, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0049', 'CS1008-HADONG-03', 'PHA015', 3, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0050', 'CS1008-HADONG-03', 'PHA014', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0051', 'CS1001-HADONG-02', 'PHA004', 7, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0052', 'CS1001-HADONG-02', 'PHA018', 3, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0053', 'CS1006-HADONG-02', 'PHA013', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0054', 'CS1006-HADONG-02', 'PHA013', 7, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0055', 'CS1006-HADONG-02', 'PHA019', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0056', 'CS1009-HADONG-02', 'PHA015', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0057', 'CS1009-HADONG-02', 'PHA001', 4, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0058', 'CS1009-HADONG-02', 'PHA016', 4, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0059', 'CS1006-HADONG-03', 'PHA015', 6, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0060', 'CS1006-HADONG-03', 'PHA015', 5, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0061', 'CS1001-HADONG-03', 'PHA004', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0062', 'CS1001-HADONG-03', 'PHA005', 2, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0063', 'CS1001-HADONG-03', 'PHA007', 2, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
