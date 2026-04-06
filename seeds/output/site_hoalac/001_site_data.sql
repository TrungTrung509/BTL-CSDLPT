-- ============================================================
-- DỮ LIỆU CỤC BỘ - Site HOALAC (Cơ sở Hòa Lạc)
-- Sinh: 2026-04-04 23:17:07
-- ============================================================

-- ---- SinhVien ----
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0001', 'Bùi', 'John', '2002-06-04', 'Nu', 'bui.john474@ptit.edu.vn', '0953417848', '54 Trần Đường
Quận JaneHuyện, 152747', 'HOALAC', 'CNTT', 'DangHoc', '2020-02-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0002', 'Đặng', 'Jane', '2001-09-23', 'Nam', 'dang.jane521@ptit.edu.vn', '0987938353', '6 Lê Làng
JaneThành phố, 881289', 'HOALAC', 'ATTT', 'DangHoc', '2023-11-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0003', 'Bùi', 'Jane', '2006-10-11', 'Nu', 'bui.jane498@ptit.edu.vn', '0955854095', '01 Lê Khu
JaneQuận, 714126', 'HOALAC', 'CNTT', 'DangHoc', '2024-12-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0004', 'Mai', 'John', '2005-11-29', 'Nam', 'mai.john21@ptit.edu.vn', '0932838264', '89 John Hẻm
Quận JaneThành phố, 577209', 'HOALAC', 'ATTT', 'DangHoc', '2024-11-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0005', 'Vũ', 'Jane', '2004-03-14', 'Nu', 'vu.jane305@ptit.edu.vn', '0935498906', '9 Phạm Tổ
JohnXã, 246536', 'HOALAC', 'VT', 'DangHoc', '2023-05-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0006', 'Dương', 'Jane', '2002-07-18', 'Nu', 'duong.jane818@ptit.edu.vn', '0952301810', '5 John Dãy
JohnHuyện, 428630', 'HOALAC', 'CNTT', 'BaoLuu', '2022-10-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0007', 'Dương', 'Jane', '2003-04-17', 'Nam', 'duong.jane646@ptit.edu.vn', '0919200792', '715 Jane Khu
Thị xã JaneThành phố, 123626', 'HOALAC', 'ATTT', 'DangHoc', '2023-06-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0008', 'Lê', 'John', '2004-05-29', 'Nu', 'le.john464@ptit.edu.vn', '0945264922', '9 John Dãy
JohnHuyện, 731576', 'HOALAC', 'CNTT', 'DangHoc', '2024-05-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0009', 'Dương', 'John', '2006-04-06', 'Nam', 'duong.john963@ptit.edu.vn', '0914779686', '782 Vũ Ngõ
JohnPhường, 451532', 'HOALAC', 'KT', 'BaoLuu', '2024-05-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0010', 'Lê', 'Jane', '2005-09-06', 'Nu', 'le.jane773@ptit.edu.vn', '0937350965', '51 Jane Đường
JanePhường, 671988', 'HOALAC', 'VT', 'BaoLuu', '2021-08-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0011', 'Mai', 'John', '2003-03-12', 'Nam', 'mai.john414@ptit.edu.vn', '0972331929', '717 John Số
Thành phố JaneHuyện, 615506', 'HOALAC', 'KT', 'DangHoc', '2024-02-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0012', 'Phạm', 'Jane', '2002-12-14', 'Nam', 'pham.jane771@ptit.edu.vn', '0998918701', '95 John Số
JaneThành phố, 162835', 'HOALAC', 'ATTT', 'DangHoc', '2023-07-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0013', 'Lê', 'John', '2000-08-11', 'Nu', 'le.john76@ptit.edu.vn', '0971918094', '620 John Đường
JaneQuận, 160451', 'HOALAC', 'ATTT', 'DangHoc', '2023-11-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0014', 'Lê', 'John', '2003-07-06', 'Nam', 'le.john251@ptit.edu.vn', '0927019840', '6 Jane Khu
Huyện JohnPhường, 884289', 'HOALAC', 'CNTT', 'DangHoc', '2021-05-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0015', 'Hoàng', 'Jane', '2003-02-12', 'Nu', 'hoang.jane627@ptit.edu.vn', '0989458451', '97 Jane Khu
Thành phố JaneXã, 559491', 'HOALAC', 'KT', 'DangHoc', '2021-01-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0016', 'Bùi', 'John', '2005-06-20', 'Nam', 'bui.john176@ptit.edu.vn', '0978997422', '6 Mai Đường
JanePhường, 458388', 'HOALAC', 'KT', 'DangHoc', '2020-04-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0017', 'Đặng', 'John', '2001-03-06', 'Nam', 'dang.john263@ptit.edu.vn', '0949970194', '5 Jane Tổ
JaneXã, 416434', 'HOALAC', 'VT', 'DangHoc', '2024-07-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0018', 'Phạm', 'Jane', '2000-09-11', 'Nu', 'pham.jane387@ptit.edu.vn', '0988992275', '8 Jane Đường
Thành phố JohnQuận, 639953', 'HOALAC', 'KT', 'DangHoc', '2024-10-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0019', 'Trần', 'Jane', '2003-05-20', 'Nu', 'tran.jane943@ptit.edu.vn', '0954057789', '454 Trần Khu
JaneThị xã, 496444', 'HOALAC', 'KT', 'DangHoc', '2021-01-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0020', 'Nguyễn', 'John', '2001-12-08', 'Nam', 'nguyen.john387@ptit.edu.vn', '0961833489', '689 Jane Làng
JohnThành phố, 307309', 'HOALAC', 'CNTT', 'BaoLuu', '2020-03-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0021', 'Phạm', 'John', '2002-05-07', 'Nu', 'pham.john604@ptit.edu.vn', '0982892396', '442 John Tổ
Huyện JohnXã, 636440', 'HOALAC', 'ATTT', 'DangHoc', '2020-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0022', 'Bùi', 'Jane', '2001-02-26', 'Nam', 'bui.jane588@ptit.edu.vn', '0997072570', '34 Hoàng Số
Quận JohnHuyện, 277996', 'HOALAC', 'CNTT', 'DangHoc', '2020-09-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0023', 'Vũ', 'Jane', '2004-08-07', 'Nu', 'vu.jane8@ptit.edu.vn', '0923082327', '24 Lê Ngõ
Quận JohnXã, 691488', 'HOALAC', 'CNTT', 'DangHoc', '2021-01-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0024', 'Trần', 'Jane', '2006-06-12', 'Nu', 'tran.jane941@ptit.edu.vn', '0975498652', '90 John Số
Thị xã JaneHuyện, 618193', 'HOALAC', 'ATTT', 'DangHoc', '2023-11-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0025', 'Vũ', 'Jane', '2006-06-25', 'Nu', 'vu.jane89@ptit.edu.vn', '0953447198', '2 Vũ Dãy
JohnHuyện, 243082', 'HOALAC', 'ATTT', 'DangHoc', '2024-12-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0026', 'Hoàng', 'Jane', '2002-01-17', 'Nu', 'hoang.jane524@ptit.edu.vn', '0927918958', '0 John Số
Thành phố JaneXã, 593865', 'HOALAC', 'ATTT', 'BaoLuu', '2022-01-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0027', 'Bùi', 'John', '2000-03-30', 'Nam', 'bui.john723@ptit.edu.vn', '0925236120', '8 Lê Tổ
Quận JohnThị xã, 105837', 'HOALAC', 'ATTT', 'DangHoc', '2020-02-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0028', 'Nguyễn', 'John', '2001-01-31', 'Nu', 'nguyen.john598@ptit.edu.vn', '0953871912', '758 Nguyễn Khu
Thành phố JaneThị xã, 602137', 'HOALAC', 'ATTT', 'DangHoc', '2021-02-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0029', 'Mai', 'Jane', '2003-07-19', 'Nam', 'mai.jane906@ptit.edu.vn', '0932724827', '88 Nguyễn Hẻm
Quận JaneThị xã, 975498', 'HOALAC', 'VT', 'BaoLuu', '2023-06-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0030', 'Trần', 'John', '2005-06-28', 'Nam', 'tran.john84@ptit.edu.vn', '0991586884', '0 Hoàng Đường
Quận JaneThị xã, 581728', 'HOALAC', 'VT', 'DangHoc', '2023-08-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0031', 'Phạm', 'John', '2004-11-29', 'Nam', 'pham.john87@ptit.edu.vn', '0994060931', '95 Hoàng Ngõ
Thị xã JaneXã, 957754', 'HOALAC', 'KT', 'DangHoc', '2024-07-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0032', 'Mai', 'John', '2003-07-15', 'Nu', 'mai.john579@ptit.edu.vn', '0927620118', 'Quận JohnHuyện
71 Mai Hẻm, 659062', 'HOALAC', 'VT', 'DangHoc', '2024-09-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0033', 'Bùi', 'John', '2001-05-20', 'Nam', 'bui.john160@ptit.edu.vn', '0923561366', '240 Đặng Làng
JohnQuận, 567370', 'HOALAC', 'CNTT', 'BaoLuu', '2023-08-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0034', 'Mai', 'Jane', '2003-09-13', 'Nu', 'mai.jane760@ptit.edu.vn', '0998546518', '61 John Làng
JaneHuyện, 949859', 'HOALAC', 'KT', 'DangHoc', '2022-05-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0035', 'Nguyễn', 'John', '2006-03-06', 'Nu', 'nguyen.john337@ptit.edu.vn', '0973796399', '820 John Khu
JohnQuận, 597634', 'HOALAC', 'VT', 'BaoLuu', '2024-08-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0036', 'Bùi', 'John', '2006-07-17', 'Nam', 'bui.john996@ptit.edu.vn', '0993111670', '33 Jane Tổ
JohnThị xã, 567078', 'HOALAC', 'CNTT', 'DangHoc', '2024-06-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0037', 'Mai', 'Jane', '2002-10-21', 'Nu', 'mai.jane64@ptit.edu.vn', '0964999189', '397 Jane Dãy
Thành phố JaneHuyện, 268462', 'HOALAC', 'ATTT', 'BaoLuu', '2022-03-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0038', 'Bùi', 'John', '2001-12-19', 'Nu', 'bui.john617@ptit.edu.vn', '0921403204', '98 John Khu
JohnXã, 705017', 'HOALAC', 'VT', 'DangHoc', '2024-04-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0039', 'Dương', 'John', '2005-03-11', 'Nu', 'duong.john904@ptit.edu.vn', '0919062369', '20 Lê Ngõ
Quận JohnThị xã, 424187', 'HOALAC', 'VT', 'DangHoc', '2020-09-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0040', 'Mai', 'Jane', '2001-02-26', 'Nam', 'mai.jane239@ptit.edu.vn', '0981428275', '77 Jane Dãy
JohnQuận, 471441', 'HOALAC', 'CNTT', 'DangHoc', '2020-04-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0041', 'Dương', 'Jane', '2006-08-15', 'Nam', 'duong.jane837@ptit.edu.vn', '0942148614', '68 John Tổ
JaneHuyện, 711114', 'HOALAC', 'ATTT', 'DangHoc', '2023-11-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0042', 'Lê', 'Jane', '2005-02-13', 'Nam', 'le.jane513@ptit.edu.vn', '0969319918', '449 Vũ Đường
Thành phố JohnThành phố, 178649', 'HOALAC', 'ATTT', 'BaoLuu', '2022-01-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0043', 'Bùi', 'Jane', '2001-10-29', 'Nu', 'bui.jane748@ptit.edu.vn', '0929288588', '16 Jane Ngõ
Thành phố JohnHuyện, 120954', 'HOALAC', 'KT', 'DangHoc', '2024-05-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0044', 'Vũ', 'John', '2000-10-08', 'Nam', 'vu.john779@ptit.edu.vn', '0942683238', '56 Jane Ngõ
Huyện JaneThành phố, 693819', 'HOALAC', 'CNTT', 'BaoLuu', '2020-04-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0045', 'Lê', 'John', '2006-11-05', 'Nam', 'le.john38@ptit.edu.vn', '0979126271', '8 Vũ Dãy
JaneHuyện, 896887', 'HOALAC', 'CNTT', 'DangHoc', '2021-04-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0046', 'Vũ', 'Jane', '2004-03-18', 'Nam', 'vu.jane181@ptit.edu.vn', '0928451609', '7 Jane Đường
JohnHuyện, 747627', 'HOALAC', 'VT', 'BaoLuu', '2022-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0047', 'Lê', 'John', '2002-04-28', 'Nam', 'le.john930@ptit.edu.vn', '0999200700', '804 Bùi Số
JaneThị xã, 735975', 'HOALAC', 'KT', 'BaoLuu', '2020-07-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0048', 'Lê', 'John', '2006-08-19', 'Nam', 'le.john503@ptit.edu.vn', '0947866575', '354 Vũ Hẻm
Thị xã JohnQuận, 354664', 'HOALAC', 'VT', 'DangHoc', '2023-11-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0049', 'Hoàng', 'Jane', '2001-01-18', 'Nu', 'hoang.jane94@ptit.edu.vn', '0907905439', '8 Hoàng Ngõ
Thị xã JohnThị xã, 440714', 'HOALAC', 'KT', 'BaoLuu', '2024-06-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0050', 'Hoàng', 'Jane', '2006-10-12', 'Nam', 'hoang.jane194@ptit.edu.vn', '0919959758', '7 Phạm Đường
Thành phố JohnThành phố, 835829', 'HOALAC', 'KT', 'DangHoc', '2022-04-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0051', 'Nguyễn', 'John', '2004-06-10', 'Nam', 'nguyen.john355@ptit.edu.vn', '0951633633', '6 Hoàng Hẻm
JaneQuận, 902293', 'HOALAC', 'CNTT', 'BaoLuu', '2023-04-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0052', 'Bùi', 'John', '2002-12-27', 'Nu', 'bui.john785@ptit.edu.vn', '0981532806', '647 Phạm Khu
Huyện JaneHuyện, 309976', 'HOALAC', 'KT', 'DangHoc', '2020-01-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0053', 'Phạm', 'John', '2004-06-26', 'Nu', 'pham.john294@ptit.edu.vn', '0901532071', '71 John Số
Quận JaneThị xã, 191723', 'HOALAC', 'KT', 'BaoLuu', '2021-09-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0054', 'Trần', 'John', '2000-06-01', 'Nu', 'tran.john522@ptit.edu.vn', '0948051884', '879 Hoàng Dãy
Thị xã JaneXã, 722859', 'HOALAC', 'VT', 'DangHoc', '2024-10-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0055', 'Hoàng', 'John', '2002-08-29', 'Nu', 'hoang.john921@ptit.edu.vn', '0931700278', '684 Trần Khu
Huyện JaneThành phố, 392443', 'HOALAC', 'KT', 'DangHoc', '2020-01-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0056', 'Bùi', 'John', '2002-01-02', 'Nam', 'bui.john826@ptit.edu.vn', '0958339342', '7 John Dãy
Huyện JohnHuyện, 356169', 'HOALAC', 'ATTT', 'DangHoc', '2024-11-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0057', 'Lê', 'Jane', '2002-12-10', 'Nam', 'le.jane712@ptit.edu.vn', '0963700240', '83 John Làng
JaneHuyện, 429886', 'HOALAC', 'CNTT', 'DangHoc', '2022-01-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0058', 'Vũ', 'Jane', '2000-01-23', 'Nu', 'vu.jane45@ptit.edu.vn', '0998510179', '671 Jane Đường
JaneQuận, 245096', 'HOALAC', 'ATTT', 'DangHoc', '2023-03-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0059', 'Mai', 'Jane', '2003-07-09', 'Nam', 'mai.jane114@ptit.edu.vn', '0933108152', '9 Trần Số
Quận JaneThị xã, 999339', 'HOALAC', 'VT', 'DangHoc', '2022-11-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0060', 'Mai', 'John', '2000-08-07', 'Nu', 'mai.john582@ptit.edu.vn', '0984305858', 'Thị xã JaneHuyện
36 Jane Làng, 828299', 'HOALAC', 'VT', 'BaoLuu', '2020-09-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0061', 'Phạm', 'John', '2005-09-29', 'Nam', 'pham.john665@ptit.edu.vn', '0966761835', '405 Jane Hẻm
Thị xã JohnThành phố, 244679', 'HOALAC', 'ATTT', 'BaoLuu', '2021-12-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0062', 'Lê', 'Jane', '2003-08-05', 'Nu', 'le.jane546@ptit.edu.vn', '0958862264', '11 Mai Số
JanePhường, 465131', 'HOALAC', 'VT', 'DangHoc', '2022-07-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0063', 'Vũ', 'John', '2003-04-17', 'Nam', 'vu.john715@ptit.edu.vn', '0959203315', '23 Hoàng Tổ
Quận JanePhường, 977647', 'HOALAC', 'KT', 'DangHoc', '2020-03-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0064', 'Nguyễn', 'John', '2005-03-29', 'Nu', 'nguyen.john842@ptit.edu.vn', '0929470433', '60 Jane Dãy
JohnThị xã, 316582', 'HOALAC', 'VT', 'DangHoc', '2023-11-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0065', 'Đặng', 'Jane', '2000-07-01', 'Nu', 'dang.jane755@ptit.edu.vn', '0916621537', '9 John Dãy
Quận JohnThị xã, 213272', 'HOALAC', 'KT', 'BaoLuu', '2020-01-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0066', 'Mai', 'John', '2003-05-11', 'Nu', 'mai.john833@ptit.edu.vn', '0911530846', '29 John Đường
Huyện JaneThị xã, 363588', 'HOALAC', 'VT', 'BaoLuu', '2022-05-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0067', 'Đặng', 'John', '2004-03-27', 'Nu', 'dang.john577@ptit.edu.vn', '0985834816', '87 Dương Dãy
Thị xã JaneXã, 489778', 'HOALAC', 'KT', 'DangHoc', '2022-05-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0068', 'Nguyễn', 'Jane', '2005-01-21', 'Nam', 'nguyen.jane432@ptit.edu.vn', '0998408677', '375 Trần Tổ
JaneThành phố, 210685', 'HOALAC', 'CNTT', 'DangHoc', '2023-08-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0069', 'Dương', 'Jane', '2004-11-05', 'Nu', 'duong.jane764@ptit.edu.vn', '0981963955', '8 Jane Dãy
Thành phố JohnXã, 997031', 'HOALAC', 'CNTT', 'DangHoc', '2023-02-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0070', 'Mai', 'Jane', '2000-01-30', 'Nam', 'mai.jane422@ptit.edu.vn', '0938298564', '851 Jane Khu
Thị xã JohnQuận, 541189', 'HOALAC', 'VT', 'DangHoc', '2024-06-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0071', 'Mai', 'John', '2006-11-19', 'Nam', 'mai.john977@ptit.edu.vn', '0935901062', '425 Jane Dãy
Quận JohnHuyện, 939061', 'HOALAC', 'CNTT', 'DangHoc', '2022-11-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0072', 'Nguyễn', 'Jane', '2006-06-16', 'Nam', 'nguyen.jane956@ptit.edu.vn', '0962773364', 'Quận JaneThành phố
53 Jane Dãy, 181093', 'HOALAC', 'ATTT', 'DangHoc', '2023-08-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0073', 'Hoàng', 'John', '2004-11-26', 'Nam', 'hoang.john265@ptit.edu.vn', '0998186783', '67 Hoàng Làng
JohnThị xã, 222301', 'HOALAC', 'ATTT', 'BaoLuu', '2022-01-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0074', 'Trần', 'John', '2005-08-06', 'Nu', 'tran.john763@ptit.edu.vn', '0926151666', '52 John Đường
Huyện JanePhường, 566079', 'HOALAC', 'VT', 'DangHoc', '2021-07-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0075', 'Bùi', 'Jane', '2000-04-20', 'Nu', 'bui.jane21@ptit.edu.vn', '0951162731', '4 John Dãy
JaneXã, 236691', 'HOALAC', 'ATTT', 'BaoLuu', '2022-02-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0076', 'Đặng', 'Jane', '2001-10-16', 'Nu', 'dang.jane975@ptit.edu.vn', '0917236914', '956 Lê Làng
Thành phố JohnPhường, 996046', 'HOALAC', 'VT', 'BaoLuu', '2022-12-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0077', 'Mai', 'John', '2005-12-28', 'Nam', 'mai.john714@ptit.edu.vn', '0947989426', '5 Vũ Dãy
JohnHuyện, 334629', 'HOALAC', 'VT', 'DangHoc', '2024-06-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0078', 'Bùi', 'Jane', '2005-02-24', 'Nu', 'bui.jane67@ptit.edu.vn', '0914613967', '5 John Làng
JaneQuận, 352764', 'HOALAC', 'VT', 'DangHoc', '2021-05-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0079', 'Lê', 'Jane', '2005-02-01', 'Nam', 'le.jane939@ptit.edu.vn', '0957622173', '573 Jane Đường
Thị xã JanePhường, 955114', 'HOALAC', 'KT', 'BaoLuu', '2020-03-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0080', 'Hoàng', 'John', '2006-09-10', 'Nu', 'hoang.john480@ptit.edu.vn', '0995155848', '1 Dương Dãy
Thành phố JaneQuận, 837957', 'HOALAC', 'VT', 'BaoLuu', '2022-06-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0081', 'Dương', 'John', '2002-07-29', 'Nu', 'duong.john840@ptit.edu.vn', '0945754450', '6 John Hẻm
JaneHuyện, 784797', 'HOALAC', 'CNTT', 'BaoLuu', '2024-10-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0082', 'Dương', 'John', '2004-09-20', 'Nam', 'duong.john209@ptit.edu.vn', '0941672015', '55 John Khu
Thị xã JohnThị xã, 303380', 'HOALAC', 'KT', 'DangHoc', '2024-06-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0083', 'Nguyễn', 'Jane', '2006-05-18', 'Nam', 'nguyen.jane144@ptit.edu.vn', '0948256613', 'Thành phố JohnXã
8 Phạm Làng, 185317', 'HOALAC', 'KT', 'DangHoc', '2023-02-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0084', 'Dương', 'Jane', '2003-03-21', 'Nu', 'duong.jane382@ptit.edu.vn', '0934413077', '24 Lê Đường
Quận JohnThành phố, 377980', 'HOALAC', 'KT', 'DangHoc', '2020-06-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0085', 'Mai', 'John', '2005-12-02', 'Nam', 'mai.john373@ptit.edu.vn', '0954786296', '28 Jane Đường
Thị xã JaneQuận, 990929', 'HOALAC', 'CNTT', 'DangHoc', '2023-01-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0086', 'Vũ', 'John', '2002-05-12', 'Nam', 'vu.john879@ptit.edu.vn', '0923902162', '2 Bùi Số
JaneThị xã, 905105', 'HOALAC', 'KT', 'DangHoc', '2023-05-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0087', 'Hoàng', 'John', '2004-02-01', 'Nam', 'hoang.john812@ptit.edu.vn', '0905509601', '1 Đặng Khu
Thị xã JaneThành phố, 798713', 'HOALAC', 'ATTT', 'BaoLuu', '2023-06-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0088', 'Lê', 'Jane', '2006-04-16', 'Nam', 'le.jane878@ptit.edu.vn', '0961598500', '4 Lê Ngõ
JaneThị xã, 588722', 'HOALAC', 'ATTT', 'DangHoc', '2024-05-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0089', 'Nguyễn', 'John', '2002-04-28', 'Nam', 'nguyen.john507@ptit.edu.vn', '0992813899', '362 Nguyễn Làng
Huyện JaneQuận, 886467', 'HOALAC', 'VT', 'DangHoc', '2022-05-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0090', 'Nguyễn', 'Jane', '2005-01-01', 'Nu', 'nguyen.jane257@ptit.edu.vn', '0965369090', '72 Jane Số
JohnQuận, 576100', 'HOALAC', 'ATTT', 'DangHoc', '2020-11-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0091', 'Mai', 'Jane', '2004-07-03', 'Nam', 'mai.jane297@ptit.edu.vn', '0949334865', '404 Phạm Số
JohnQuận, 131175', 'HOALAC', 'KT', 'DangHoc', '2021-01-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0092', 'Mai', 'Jane', '2000-09-17', 'Nu', 'mai.jane937@ptit.edu.vn', '0937944083', '985 Hoàng Hẻm
Thành phố JohnThành phố, 240138', 'HOALAC', 'ATTT', 'BaoLuu', '2020-09-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0093', 'Nguyễn', 'John', '2000-10-24', 'Nu', 'nguyen.john375@ptit.edu.vn', '0912978224', '766 Hoàng Làng
JaneThị xã, 923511', 'HOALAC', 'CNTT', 'DangHoc', '2024-11-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0094', 'Lê', 'John', '2004-03-08', 'Nu', 'le.john892@ptit.edu.vn', '0951366105', '411 Bùi Khu
Quận JanePhường, 834654', 'HOALAC', 'VT', 'DangHoc', '2022-08-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0095', 'Dương', 'John', '2003-09-19', 'Nam', 'duong.john243@ptit.edu.vn', '0969870737', '920 John Làng
Huyện JohnXã, 209012', 'HOALAC', 'KT', 'BaoLuu', '2021-12-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0096', 'Vũ', 'John', '2001-05-30', 'Nu', 'vu.john626@ptit.edu.vn', '0923602276', '74 Trần Làng
JohnXã, 406962', 'HOALAC', 'KT', 'DangHoc', '2021-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0097', 'Dương', 'John', '2002-08-20', 'Nu', 'duong.john596@ptit.edu.vn', '0923008604', '4 Jane Ngõ
Thành phố JohnPhường, 499717', 'HOALAC', 'VT', 'DangHoc', '2024-09-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0098', 'Phạm', 'Jane', '2002-05-10', 'Nam', 'pham.jane993@ptit.edu.vn', '0945540105', '669 John Làng
JaneThành phố, 801389', 'HOALAC', 'CNTT', 'BaoLuu', '2023-01-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0099', 'Phạm', 'John', '2003-08-08', 'Nam', 'pham.john36@ptit.edu.vn', '0942531578', '58 John Ngõ
JaneThị xã, 191581', 'HOALAC', 'VT', 'DangHoc', '2024-12-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0100', 'Trần', 'Jane', '2004-01-30', 'Nu', 'tran.jane869@ptit.edu.vn', '0932821046', '7 Jane Hẻm
Quận JanePhường, 343093', 'HOALAC', 'ATTT', 'BaoLuu', '2020-06-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0101', 'Nguyễn', 'John', '2004-08-02', 'Nu', 'nguyen.john396@ptit.edu.vn', '0911288620', '0 Jane Hẻm
JohnHuyện, 128321', 'HOALAC', 'CNTT', 'DangHoc', '2023-10-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0102', 'Vũ', 'John', '2002-11-18', 'Nam', 'vu.john568@ptit.edu.vn', '0937442256', '011 Trần Số
JohnQuận, 322383', 'HOALAC', 'CNTT', 'DangHoc', '2022-03-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0103', 'Đặng', 'John', '2001-11-20', 'Nam', 'dang.john67@ptit.edu.vn', '0971728760', '471 Jane Số
Thành phố JaneXã, 577281', 'HOALAC', 'CNTT', 'DangHoc', '2022-06-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0104', 'Phạm', 'Jane', '2005-02-07', 'Nam', 'pham.jane617@ptit.edu.vn', '0953249542', '6 Jane Đường
JohnHuyện, 697881', 'HOALAC', 'CNTT', 'DangHoc', '2023-04-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0105', 'Mai', 'Jane', '2004-03-26', 'Nam', 'mai.jane133@ptit.edu.vn', '0918394764', '8 Jane Tổ
JaneQuận, 642565', 'HOALAC', 'VT', 'DangHoc', '2023-01-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0106', 'Dương', 'John', '2000-06-11', 'Nu', 'duong.john784@ptit.edu.vn', '0919410803', '22 Vũ Khu
JanePhường, 740707', 'HOALAC', 'VT', 'DangHoc', '2020-02-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0107', 'Hoàng', 'John', '2001-02-17', 'Nam', 'hoang.john518@ptit.edu.vn', '0924097018', '78 Jane Đường
Thành phố JaneThành phố, 630559', 'HOALAC', 'ATTT', 'DangHoc', '2022-02-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0108', 'Mai', 'Jane', '2000-01-13', 'Nu', 'mai.jane585@ptit.edu.vn', '0927817418', '304 Dương Đường
JaneHuyện, 372903', 'HOALAC', 'ATTT', 'DangHoc', '2024-11-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0109', 'Hoàng', 'Jane', '2003-06-04', 'Nam', 'hoang.jane897@ptit.edu.vn', '0901283894', '478 Jane Dãy
Thị xã JohnThị xã, 760632', 'HOALAC', 'CNTT', 'DangHoc', '2021-04-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0110', 'Phạm', 'Jane', '2006-11-19', 'Nu', 'pham.jane416@ptit.edu.vn', '0908198929', '51 Jane Khu
JanePhường, 528043', 'HOALAC', 'CNTT', 'DangHoc', '2024-03-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0111', 'Nguyễn', 'Jane', '2003-03-21', 'Nu', 'nguyen.jane994@ptit.edu.vn', '0947696693', '17 Nguyễn Dãy
Thị xã JaneHuyện, 256060', 'HOALAC', 'KT', 'DangHoc', '2022-01-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0112', 'Đặng', 'John', '2004-11-02', 'Nu', 'dang.john854@ptit.edu.vn', '0905129422', '8 Nguyễn Khu
Thành phố JaneHuyện, 366560', 'HOALAC', 'CNTT', 'DangHoc', '2024-07-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0113', 'Bùi', 'John', '2000-02-05', 'Nu', 'bui.john728@ptit.edu.vn', '0954240472', '834 John Đường
JohnThị xã, 472254', 'HOALAC', 'VT', 'DangHoc', '2021-06-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0114', 'Hoàng', 'Jane', '2001-06-19', 'Nu', 'hoang.jane752@ptit.edu.vn', '0972164460', '775 Jane Hẻm
Thị xã JaneThành phố, 751163', 'HOALAC', 'CNTT', 'DangHoc', '2020-06-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0115', 'Trần', 'Jane', '2000-11-06', 'Nam', 'tran.jane316@ptit.edu.vn', '0961360959', '82 Jane Hẻm
Quận JohnHuyện, 315732', 'HOALAC', 'ATTT', 'DangHoc', '2021-02-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0116', 'Dương', 'Jane', '2001-04-14', 'Nu', 'duong.jane880@ptit.edu.vn', '0922931853', '52 Nguyễn Hẻm
Thành phố JohnThị xã, 821572', 'HOALAC', 'KT', 'DangHoc', '2020-01-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0117', 'Đặng', 'John', '2002-06-16', 'Nu', 'dang.john949@ptit.edu.vn', '0934977538', '7 Lê Hẻm
JohnQuận, 472185', 'HOALAC', 'CNTT', 'DangHoc', '2023-09-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0118', 'Đặng', 'John', '2004-01-06', 'Nu', 'dang.john78@ptit.edu.vn', '0942517641', '541 Trần Số
Quận JaneThị xã, 568240', 'HOALAC', 'CNTT', 'DangHoc', '2022-01-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0119', 'Dương', 'Jane', '2001-11-14', 'Nam', 'duong.jane118@ptit.edu.vn', '0985486267', '11 Nguyễn Khu
JohnHuyện, 804022', 'HOALAC', 'ATTT', 'BaoLuu', '2024-02-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0120', 'Bùi', 'John', '2001-01-17', 'Nam', 'bui.john556@ptit.edu.vn', '0918959151', '0 Trần Tổ
JohnThành phố, 914467', 'HOALAC', 'CNTT', 'DangHoc', '2020-05-02')
ON CONFLICT (MaSV) DO NOTHING;

-- ---- GiangVien ----
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV001', 'Phạm', 'Jane', 'ThS', NULL, 'pham.jane299@gv.cntt-hl.ptit.edu.vn', '0996911287', 'HOALAC', 'VT', 'TamNghi', '2016-04-10')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV002', 'Vũ', 'John', 'TS', 'GTV', 'vu.john475@gv.cntt-hl.ptit.edu.vn', '0951176751', 'HOALAC', 'ATTT', 'DangCongTac', '2012-08-13')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV003', 'Bùi', 'Jane', 'CN', NULL, 'bui.jane468@gv.cntt-hl.ptit.edu.vn', '0987655854', 'HOALAC', 'VT', 'TamNghi', '2015-01-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV004', 'Phạm', 'Jane', 'CN', NULL, 'pham.jane420@gv.cntt-hl.ptit.edu.vn', '0992006653', 'HOALAC', 'VT', 'TamNghi', '2016-12-20')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV005', 'Bùi', 'John', 'PGS', NULL, 'bui.john754@gv.cntt-hl.ptit.edu.vn', '0975704458', 'HOALAC', 'VT', 'TamNghi', '2018-01-12')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV006', 'Phạm', 'Jane', 'ThS', 'PGS', 'pham.jane184@gv.cntt-hl.ptit.edu.vn', '0914754083', 'HOALAC', 'ATTT', 'TamNghi', '2018-04-18')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV007', 'Đặng', 'Jane', 'ThS', 'GTV', 'dang.jane451@gv.cntt-hl.ptit.edu.vn', '0906739794', 'HOALAC', 'CNTT', 'DangCongTac', '2012-06-24')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV008', 'Nguyễn', 'Jane', 'TS', 'PGS', 'nguyen.jane581@gv.cntt-hl.ptit.edu.vn', '0928271201', 'HOALAC', 'KT', 'TamNghi', '2015-06-17')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV009', 'Mai', 'John', 'ThS', 'PGS', 'mai.john598@gv.cntt-hl.ptit.edu.vn', '0932362956', 'HOALAC', 'CNTT', 'DangCongTac', '2023-06-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV010', 'Phạm', 'Jane', 'PGS', 'PGS', 'pham.jane79@gv.cntt-hl.ptit.edu.vn', '0909751670', 'HOALAC', 'KT', 'DangCongTac', '2021-04-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV011', 'Vũ', 'Jane', 'ThS', NULL, 'vu.jane479@gv.cntt-hl.ptit.edu.vn', '0938506711', 'HOALAC', 'ATTT', 'TamNghi', '2019-02-03')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV012', 'Nguyễn', 'John', 'PGS', 'PGS', 'nguyen.john171@gv.cntt-hl.ptit.edu.vn', '0938504528', 'HOALAC', 'VT', 'DangCongTac', '2010-09-15')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV013', 'Mai', 'Jane', 'CN', NULL, 'mai.jane269@gv.cntt-hl.ptit.edu.vn', '0997463011', 'HOALAC', 'ATTT', 'DangCongTac', '2014-03-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV014', 'Dương', 'John', 'TS', 'GTV', 'duong.john698@gv.cntt-hl.ptit.edu.vn', '0954730341', 'HOALAC', 'CNTT', 'TamNghi', '2019-12-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV015', 'Bùi', 'John', 'ThS', NULL, 'bui.john234@gv.cntt-hl.ptit.edu.vn', '0937018870', 'HOALAC', 'VT', 'TamNghi', '2015-07-06')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV016', 'Dương', 'John', 'PGS', NULL, 'duong.john589@gv.cntt-hl.ptit.edu.vn', '0999802169', 'HOALAC', 'KT', 'TamNghi', '2012-09-16')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV017', 'Dương', 'Jane', 'TS', NULL, 'duong.jane166@gv.cntt-hl.ptit.edu.vn', '0999239778', 'HOALAC', 'KT', 'TamNghi', '2022-08-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV018', 'Phạm', 'John', 'ThS', NULL, 'pham.john813@gv.cntt-hl.ptit.edu.vn', '0999823321', 'HOALAC', 'VT', 'TamNghi', '2012-06-14')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV019', 'Đặng', 'Jane', 'PGS', 'PGS', 'dang.jane921@gv.cntt-hl.ptit.edu.vn', '0925413377', 'HOALAC', 'ATTT', 'DangCongTac', '2018-09-25')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV020', 'Bùi', 'John', 'PGS', NULL, 'bui.john953@gv.cntt-hl.ptit.edu.vn', '0906631083', 'HOALAC', 'KT', 'TamNghi', '2023-05-10')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV021', 'Phạm', 'John', 'TS', NULL, 'pham.john869@gv.cntt-hl.ptit.edu.vn', '0922736527', 'HOALAC', 'VT', 'DangCongTac', '2017-01-17')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV022', 'Dương', 'John', 'CN', NULL, 'duong.john397@gv.cntt-hl.ptit.edu.vn', '0963911902', 'HOALAC', 'CNTT', 'DangCongTac', '2017-06-02')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV023', 'Đặng', 'Jane', 'ThS', NULL, 'dang.jane993@gv.cntt-hl.ptit.edu.vn', '0968815577', 'HOALAC', 'KT', 'DangCongTac', '2022-02-08')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV024', 'Đặng', 'Jane', 'ThS', 'PGS', 'dang.jane512@gv.cntt-hl.ptit.edu.vn', '0909255648', 'HOALAC', 'KT', 'DangCongTac', '2020-01-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV025', 'Phạm', 'John', 'CN', 'GTV', 'pham.john550@gv.cntt-hl.ptit.edu.vn', '0962273847', 'HOALAC', 'VT', 'TamNghi', '2018-10-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV026', 'Vũ', 'John', 'CN', 'PGS', 'vu.john577@gv.cntt-hl.ptit.edu.vn', '0955278162', 'HOALAC', 'KT', 'DangCongTac', '2021-08-20')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV027', 'Hoàng', 'Jane', 'CN', 'GTV', 'hoang.jane184@gv.cntt-hl.ptit.edu.vn', '0934691653', 'HOALAC', 'VT', 'DangCongTac', '2016-01-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV028', 'Trần', 'Jane', 'TS', 'GTV', 'tran.jane303@gv.cntt-hl.ptit.edu.vn', '0932048254', 'HOALAC', 'CNTT', 'DangCongTac', '2021-10-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV029', 'Mai', 'Jane', 'TS', NULL, 'mai.jane482@gv.cntt-hl.ptit.edu.vn', '0921577726', 'HOALAC', 'KT', 'DangCongTac', '2015-06-08')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV030', 'Lê', 'Jane', 'PGS', NULL, 'le.jane869@gv.cntt-hl.ptit.edu.vn', '0916739370', 'HOALAC', 'CNTT', 'DangCongTac', '2013-10-08')
ON CONFLICT (MaGV) DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO001', 'Phong 1', 'Toa B', 3, 60, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO002', 'Phong 2', 'Toa C', 3, 120, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO003', 'Phong 3', 'Toa D', 2, 120, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO004', 'Phong 4', 'Toa C', 1, 40, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO005', 'Phong 5', 'Toa C', 4, 30, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO006', 'Phong 6', 'Toa C', 4, 100, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO007', 'Phong 7', 'Toa A', 1, 120, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO008', 'Phong 8', 'Toa A', 4, 50, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO009', 'Phong 9', 'Toa B', 3, 80, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO010', 'Phong 10', 'Toa B', 2, 50, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO011', 'Phong 11', 'Toa A', 3, 120, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO012', 'Phong 12', 'Toa B', 3, 120, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO013', 'Phong 13', 'Toa B', 1, 50, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO014', 'Phong 14', 'Toa B', 3, 40, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO015', 'Phong 15', 'Toa D', 4, 80, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO016', 'Phong 16', 'Toa B', 2, 80, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO017', 'Phong 17', 'Toa B', 5, 40, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO018', 'Phong 18', 'Toa D', 5, 50, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO019', 'Phong 19', 'Toa A', 3, 80, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO020', 'Phong 20', 'Toa B', 3, 120, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-HOALAC-01', 'CS1013', 'HK20251', 'HOALAC', 'HOALACGV021', 'CS1013-01', 12, 3, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HOALAC-01', 'CS1006', 'HK20251', 'HOALAC', 'HOALACGV012', 'CS1006-01', 10, 1, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('VT2001-HOALAC-01', 'VT2001', 'HK20251', 'HOALAC', 'HOALACGV011', 'VT2001-01', 12, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HOALAC-01', 'CS1010', 'HK20251', 'HOALAC', 'HOALACGV006', 'CS1010-01', 10, 4, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HOALAC-01', 'CS1015', 'HK20251', 'HOALAC', 'HOALACGV015', 'CS1015-01', 12, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HOALAC-02', 'CS1006', 'HK20251', 'HOALAC', 'HOALACGV017', 'CS1006-02', 60, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HOALAC-01', 'CS1008', 'HK20251', 'HOALAC', 'HOALACGV028', 'CS1008-01', 50, 17, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HOALAC-02', 'CS1015', 'HK20251', 'HOALAC', 'HOALACGV006', 'CS1015-02', 40, 4, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HOALAC-02', 'CS1008', 'HK20251', 'HOALAC', 'HOALACGV020', 'CS1008-02', 50, 6, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HOALAC-02', 'CS1010', 'HK20251', 'HOALAC', 'HOALACGV007', 'CS1010-02', 50, 14, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HOALAC-01', 'CS1002', 'HK20251', 'HOALAC', 'HOALACGV030', 'CS1002-01', 60, 4, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-01', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV025', 'CS1001-01', 30, 2, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-HOALAC-01', 'CS1012', 'HK20251', 'HOALAC', 'HOALACGV018', 'CS1012-01', 40, 3, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1005-HOALAC-01', 'CS1005', 'HK20251', 'HOALAC', 'HOALACGV020', 'CS1005-01', 40, 12, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HOALAC-02', 'CS1002', 'HK20251', 'HOALAC', 'HOALACGV012', 'CS1002-02', 50, 19, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HOALAC-03', 'CS1002', 'HK20251', 'HOALAC', 'HOALACGV009', 'CS1002-03', 30, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1011-HOALAC-01', 'CS1011', 'HK20251', 'HOALAC', 'HOALACGV008', 'CS1011-01', 30, 1, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1007-HOALAC-01', 'CS1007', 'HK20251', 'HOALAC', 'HOALACGV020', 'CS1007-01', 50, 16, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HOALAC-01', 'CS1004', 'HK20251', 'HOALAC', 'HOALACGV014', 'CS1004-01', 40, 9, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HOALAC-01', 'CS1009', 'HK20251', 'HOALAC', 'HOALACGV018', 'CS1009-01', 30, 8, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1014-HOALAC-01', 'CS1014', 'HK20251', 'HOALAC', 'HOALACGV002', 'CS1014-01', 40, 15, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-HOALAC-02', 'CS1012', 'HK20251', 'HOALAC', 'HOALACGV017', 'CS1012-02', 60, 12, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-02', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV015', 'CS1001-02', 60, 2, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HOALAC-03', 'CS1006', 'HK20251', 'HOALAC', 'HOALACGV007', 'CS1006-03', 30, 5, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HOALAC-02', 'CS1004', 'HK20251', 'HOALAC', 'HOALACGV011', 'CS1004-02', 60, 9, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;

-- ---- LichHoc ----
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0001', 'CS1013-HOALAC-01', 'PHO002', 3, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0002', 'CS1013-HOALAC-01', 'PHO015', 5, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0003', 'CS1006-HOALAC-01', 'PHO004', 6, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0004', 'CS1006-HOALAC-01', 'PHO013', 4, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0005', 'CS1006-HOALAC-01', 'PHO018', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0006', 'VT2001-HOALAC-01', 'PHO001', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0007', 'VT2001-HOALAC-01', 'PHO012', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0008', 'VT2001-HOALAC-01', 'PHO013', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0009', 'CS1010-HOALAC-01', 'PHO014', 6, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0010', 'CS1010-HOALAC-01', 'PHO019', 6, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0011', 'CS1010-HOALAC-01', 'PHO015', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0012', 'CS1015-HOALAC-01', 'PHO015', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0013', 'CS1015-HOALAC-01', 'PHO006', 6, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0014', 'CS1006-HOALAC-02', 'PHO004', 6, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0015', 'CS1006-HOALAC-02', 'PHO004', 5, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0016', 'CS1006-HOALAC-02', 'PHO011', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0017', 'CS1008-HOALAC-01', 'PHO015', 2, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0018', 'CS1008-HOALAC-01', 'PHO010', 6, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0019', 'CS1008-HOALAC-01', 'PHO018', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0020', 'CS1015-HOALAC-02', 'PHO002', 7, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0021', 'CS1015-HOALAC-02', 'PHO003', 3, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0022', 'CS1015-HOALAC-02', 'PHO014', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0023', 'CS1008-HOALAC-02', 'PHO008', 3, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0024', 'CS1008-HOALAC-02', 'PHO020', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0025', 'CS1008-HOALAC-02', 'PHO001', 3, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0026', 'CS1010-HOALAC-02', 'PHO012', 2, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0027', 'CS1010-HOALAC-02', 'PHO012', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0028', 'CS1002-HOALAC-01', 'PHO011', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0029', 'CS1002-HOALAC-01', 'PHO015', 2, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0030', 'CS1001-HOALAC-01', 'PHO018', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0031', 'CS1001-HOALAC-01', 'PHO013', 7, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0032', 'CS1012-HOALAC-01', 'PHO007', 7, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0033', 'CS1012-HOALAC-01', 'PHO009', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0034', 'CS1012-HOALAC-01', 'PHO004', 6, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0035', 'CS1005-HOALAC-01', 'PHO011', 5, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0036', 'CS1005-HOALAC-01', 'PHO018', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0037', 'CS1005-HOALAC-01', 'PHO019', 7, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0038', 'CS1002-HOALAC-02', 'PHO011', 5, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0039', 'CS1002-HOALAC-02', 'PHO015', 2, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0040', 'CS1002-HOALAC-02', 'PHO001', 5, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0041', 'CS1002-HOALAC-03', 'PHO019', 3, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0042', 'CS1002-HOALAC-03', 'PHO014', 3, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0043', 'CS1002-HOALAC-03', 'PHO011', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0044', 'CS1011-HOALAC-01', 'PHO017', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0045', 'CS1011-HOALAC-01', 'PHO009', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0046', 'CS1007-HOALAC-01', 'PHO011', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0047', 'CS1007-HOALAC-01', 'PHO006', 6, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0048', 'CS1007-HOALAC-01', 'PHO004', 3, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0049', 'CS1004-HOALAC-01', 'PHO017', 6, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0050', 'CS1004-HOALAC-01', 'PHO001', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0051', 'CS1009-HOALAC-01', 'PHO001', 4, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0052', 'CS1009-HOALAC-01', 'PHO006', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0053', 'CS1014-HOALAC-01', 'PHO005', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0054', 'CS1014-HOALAC-01', 'PHO011', 5, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0055', 'CS1012-HOALAC-02', 'PHO018', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0056', 'CS1012-HOALAC-02', 'PHO010', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0057', 'CS1001-HOALAC-02', 'PHO018', 3, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0058', 'CS1001-HOALAC-02', 'PHO016', 7, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0059', 'CS1001-HOALAC-02', 'PHO013', 5, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0060', 'CS1006-HOALAC-03', 'PHO020', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0061', 'CS1006-HOALAC-03', 'PHO013', 4, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0062', 'CS1004-HOALAC-02', 'PHO006', 6, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0063', 'CS1004-HOALAC-02', 'PHO002', 4, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0064', 'CS1004-HOALAC-02', 'PHO013', 3, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
