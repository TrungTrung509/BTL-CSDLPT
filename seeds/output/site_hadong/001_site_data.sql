-- ============================================================
-- DỮ LIỆU CỤC BỘ - Site HADONG (Cơ sở Hà Nội)
-- Sinh: 2026-04-04 23:17:07
-- ============================================================

-- ---- SinhVien ----
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0001', 'Vũ', 'Jane', '2006-04-25', 'Nam', 'vu.jane104@ptit.edu.vn', '0906361548', '5 Đặng Hẻm
Thị xã JaneThị xã, 579210', 'HADONG', 'VT', 'DangHoc', '2021-08-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0002', 'Bùi', 'Jane', '2004-07-29', 'Nam', 'bui.jane238@ptit.edu.vn', '0923384683', '0 Trần Ngõ
JaneQuận, 328143', 'HADONG', 'ATTT', 'DangHoc', '2023-03-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0003', 'Bùi', 'Jane', '2006-02-14', 'Nu', 'bui.jane691@ptit.edu.vn', '0985637171', '4 Mai Dãy
JaneThị xã, 278288', 'HADONG', 'VT', 'DangHoc', '2024-04-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0004', 'Nguyễn', 'John', '2003-05-17', 'Nu', 'nguyen.john286@ptit.edu.vn', '0935636983', '6 John Tổ
Quận JohnHuyện, 758069', 'HADONG', 'CNTT', 'DangHoc', '2021-07-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0005', 'Dương', 'John', '2001-03-19', 'Nam', 'duong.john430@ptit.edu.vn', '0951370923', '2 John Đường
Thành phố JohnHuyện, 848617', 'HADONG', 'KT', 'DangHoc', '2024-08-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0006', 'Đặng', 'Jane', '2000-08-20', 'Nam', 'dang.jane612@ptit.edu.vn', '0917495928', '893 Phạm Ngõ
Quận JohnXã, 643812', 'HADONG', 'ATTT', 'BaoLuu', '2021-11-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0007', 'Đặng', 'Jane', '2003-12-09', 'Nu', 'dang.jane222@ptit.edu.vn', '0939521270', '84 Jane Số
JohnHuyện, 797497', 'HADONG', 'KT', 'DangHoc', '2020-11-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0008', 'Trần', 'Jane', '2000-11-09', 'Nu', 'tran.jane4@ptit.edu.vn', '0919182403', '342 Nguyễn Làng
Quận JaneHuyện, 374523', 'HADONG', 'VT', 'BaoLuu', '2024-04-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0009', 'Hoàng', 'Jane', '2003-01-10', 'Nu', 'hoang.jane832@ptit.edu.vn', '0914925768', '067 John Làng
JohnXã, 766421', 'HADONG', 'KT', 'BaoLuu', '2022-10-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0010', 'Vũ', 'John', '2005-12-03', 'Nu', 'vu.john4@ptit.edu.vn', '0995537337', '42 Lê Dãy
Thành phố JohnQuận, 855691', 'HADONG', 'VT', 'DangHoc', '2021-02-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0011', 'Hoàng', 'Jane', '2006-08-11', 'Nam', 'hoang.jane244@ptit.edu.vn', '0956592480', '754 John Dãy
JohnThành phố, 236947', 'HADONG', 'VT', 'DangHoc', '2022-03-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0012', 'Bùi', 'Jane', '2004-02-22', 'Nu', 'bui.jane466@ptit.edu.vn', '0929700781', '503 John Tổ
Quận JohnXã, 486380', 'HADONG', 'ATTT', 'DangHoc', '2020-04-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0013', 'Mai', 'Jane', '2004-05-02', 'Nu', 'mai.jane462@ptit.edu.vn', '0954348927', '09 Trần Đường
Thị xã JohnThị xã, 511003', 'HADONG', 'VT', 'DangHoc', '2023-02-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0014', 'Hoàng', 'Jane', '2004-12-20', 'Nam', 'hoang.jane870@ptit.edu.vn', '0962605580', '545 John Đường
Thành phố JaneXã, 881973', 'HADONG', 'KT', 'BaoLuu', '2024-10-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0015', 'Nguyễn', 'Jane', '2002-11-19', 'Nam', 'nguyen.jane710@ptit.edu.vn', '0966955682', '00 Bùi Hẻm
JanePhường, 503383', 'HADONG', 'CNTT', 'DangHoc', '2023-08-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0016', 'Lê', 'Jane', '2002-08-27', 'Nam', 'le.jane687@ptit.edu.vn', '0941357678', '2 Vũ Khu
JohnThành phố, 630736', 'HADONG', 'KT', 'DangHoc', '2021-01-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0017', 'Vũ', 'John', '2002-02-11', 'Nu', 'vu.john437@ptit.edu.vn', '0968563127', '666 Phạm Đường
JohnQuận, 894042', 'HADONG', 'KT', 'DangHoc', '2022-06-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0018', 'Bùi', 'John', '2003-10-04', 'Nam', 'bui.john366@ptit.edu.vn', '0978303106', '1 Hoàng Dãy
JohnPhường, 543604', 'HADONG', 'VT', 'DangHoc', '2022-10-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0019', 'Hoàng', 'John', '2002-12-16', 'Nam', 'hoang.john73@ptit.edu.vn', '0964861034', '893 Nguyễn Ngõ
JaneXã, 761217', 'HADONG', 'ATTT', 'DangHoc', '2022-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0020', 'Vũ', 'John', '2002-08-10', 'Nu', 'vu.john454@ptit.edu.vn', '0989495907', '6 John Ngõ
JohnHuyện, 846356', 'HADONG', 'CNTT', 'DangHoc', '2022-11-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0021', 'Trần', 'Jane', '2004-12-30', 'Nu', 'tran.jane119@ptit.edu.vn', '0997574088', '097 John Số
Quận JohnThành phố, 562062', 'HADONG', 'KT', 'BaoLuu', '2022-06-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0022', 'Phạm', 'John', '2006-10-27', 'Nu', 'pham.john831@ptit.edu.vn', '0959531406', '035 Lê Ngõ
JohnXã, 767855', 'HADONG', 'ATTT', 'BaoLuu', '2020-12-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0023', 'Trần', 'Jane', '2001-10-01', 'Nam', 'tran.jane436@ptit.edu.vn', '0961269407', 'Huyện JohnQuận
9 Hoàng Ngõ, 527356', 'HADONG', 'KT', 'DangHoc', '2021-02-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0024', 'Dương', 'Jane', '2004-09-18', 'Nam', 'duong.jane501@ptit.edu.vn', '0906260331', '620 Mai Số
JaneHuyện, 452528', 'HADONG', 'ATTT', 'DangHoc', '2023-02-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0025', 'Hoàng', 'Jane', '2006-01-29', 'Nam', 'hoang.jane44@ptit.edu.vn', '0978637529', '836 Jane Khu
Huyện JohnHuyện, 842789', 'HADONG', 'KT', 'DangHoc', '2020-01-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0026', 'Mai', 'Jane', '2001-03-02', 'Nu', 'mai.jane330@ptit.edu.vn', '0915202206', '503 John Đường
JohnThành phố, 760546', 'HADONG', 'VT', 'DangHoc', '2021-03-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0027', 'Vũ', 'John', '2001-01-14', 'Nu', 'vu.john731@ptit.edu.vn', '0964431748', '23 Jane Hẻm
JohnHuyện, 805534', 'HADONG', 'ATTT', 'DangHoc', '2023-07-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0028', 'Nguyễn', 'John', '2003-01-04', 'Nu', 'nguyen.john641@ptit.edu.vn', '0941731890', '55 Dương Khu
JohnThị xã, 563299', 'HADONG', 'CNTT', 'BaoLuu', '2021-06-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0029', 'Mai', 'John', '2006-01-09', 'Nam', 'mai.john550@ptit.edu.vn', '0993855045', '331 Lê Dãy
Huyện JaneThị xã, 985962', 'HADONG', 'CNTT', 'DangHoc', '2021-07-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0030', 'Vũ', 'John', '2001-05-14', 'Nu', 'vu.john67@ptit.edu.vn', '0965559650', '994 Đặng Hẻm
JaneThành phố, 868874', 'HADONG', 'CNTT', 'DangHoc', '2023-04-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0031', 'Dương', 'Jane', '2002-08-09', 'Nu', 'duong.jane856@ptit.edu.vn', '0949839075', '8 Jane Hẻm
Thành phố JohnThành phố, 193936', 'HADONG', 'ATTT', 'DangHoc', '2022-01-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0032', 'Đặng', 'Jane', '2006-09-05', 'Nam', 'dang.jane117@ptit.edu.vn', '0932198194', '407 Bùi Khu
JanePhường, 712090', 'HADONG', 'ATTT', 'DangHoc', '2022-06-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0033', 'Dương', 'Jane', '2001-03-21', 'Nu', 'duong.jane936@ptit.edu.vn', '0926955020', '92 Jane Làng
Huyện JaneThị xã, 196856', 'HADONG', 'VT', 'DangHoc', '2022-04-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0034', 'Phạm', 'John', '2005-03-09', 'Nu', 'pham.john395@ptit.edu.vn', '0941354935', '1 Dương Ngõ
JaneThị xã, 765698', 'HADONG', 'KT', 'DangHoc', '2021-10-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0035', 'Hoàng', 'Jane', '2002-02-11', 'Nam', 'hoang.jane196@ptit.edu.vn', '0975184475', '40 Dương Tổ
JohnHuyện, 237693', 'HADONG', 'CNTT', 'DangHoc', '2020-04-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0036', 'Vũ', 'John', '2002-12-19', 'Nam', 'vu.john473@ptit.edu.vn', '0927764203', '3 Đặng Dãy
JohnThành phố, 531043', 'HADONG', 'VT', 'DangHoc', '2023-09-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0037', 'Mai', 'Jane', '2002-04-01', 'Nu', 'mai.jane285@ptit.edu.vn', '0933640011', '9 John Khu
JaneHuyện, 353778', 'HADONG', 'CNTT', 'DangHoc', '2021-08-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0038', 'Bùi', 'John', '2004-08-08', 'Nu', 'bui.john610@ptit.edu.vn', '0989950945', '7 Jane Làng
JohnXã, 115338', 'HADONG', 'VT', 'BaoLuu', '2021-06-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0039', 'Dương', 'John', '2003-12-13', 'Nu', 'duong.john647@ptit.edu.vn', '0928482160', '475 Lê Tổ
Thị xã JanePhường, 870754', 'HADONG', 'VT', 'DangHoc', '2024-08-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0040', 'Trần', 'John', '2004-12-12', 'Nam', 'tran.john961@ptit.edu.vn', '0948051501', '04 Vũ Đường
JaneThành phố, 942204', 'HADONG', 'CNTT', 'DangHoc', '2021-10-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0041', 'Trần', 'Jane', '2005-09-23', 'Nam', 'tran.jane779@ptit.edu.vn', '0998419560', '5 Nguyễn Đường
Thị xã JohnXã, 254997', 'HADONG', 'VT', 'DangHoc', '2020-01-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0042', 'Trần', 'John', '2006-06-14', 'Nu', 'tran.john972@ptit.edu.vn', '0931466468', '2 Trần Đường
JaneThành phố, 395656', 'HADONG', 'VT', 'DangHoc', '2022-12-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0043', 'Nguyễn', 'Jane', '2005-06-16', 'Nam', 'nguyen.jane455@ptit.edu.vn', '0973180348', '15 Vũ Đường
JohnThành phố, 333909', 'HADONG', 'ATTT', 'DangHoc', '2021-06-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0044', 'Đặng', 'Jane', '2001-02-08', 'Nam', 'dang.jane610@ptit.edu.vn', '0909696587', '99 John Tổ
JohnThành phố, 800065', 'HADONG', 'CNTT', 'DangHoc', '2021-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0045', 'Hoàng', 'John', '2000-03-22', 'Nu', 'hoang.john205@ptit.edu.vn', '0922925327', '0 Dương Làng
JohnPhường, 628403', 'HADONG', 'VT', 'DangHoc', '2020-05-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0046', 'Trần', 'John', '2005-01-01', 'Nu', 'tran.john551@ptit.edu.vn', '0907646738', '896 Jane Hẻm
Huyện JaneQuận, 259604', 'HADONG', 'ATTT', 'DangHoc', '2023-02-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0047', 'Lê', 'John', '2001-08-20', 'Nu', 'le.john156@ptit.edu.vn', '0947807033', '333 Jane Khu
Thị xã JaneHuyện, 558431', 'HADONG', 'CNTT', 'DangHoc', '2021-03-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0048', 'Lê', 'Jane', '2000-05-06', 'Nam', 'le.jane630@ptit.edu.vn', '0958894919', '5 John Ngõ
JohnPhường, 889234', 'HADONG', 'ATTT', 'DangHoc', '2020-06-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0049', 'Hoàng', 'John', '2006-03-27', 'Nam', 'hoang.john441@ptit.edu.vn', '0962810096', '190 Nguyễn Khu
Thị xã JohnThị xã, 273972', 'HADONG', 'VT', 'BaoLuu', '2021-05-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0050', 'Trần', 'John', '2001-12-24', 'Nam', 'tran.john948@ptit.edu.vn', '0921703554', '455 Lê Khu
Quận JaneThị xã, 135938', 'HADONG', 'ATTT', 'BaoLuu', '2020-05-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0051', 'Hoàng', 'Jane', '2000-04-12', 'Nam', 'hoang.jane700@ptit.edu.vn', '0932422285', '96 Phạm Hẻm
Huyện JanePhường, 277164', 'HADONG', 'KT', 'BaoLuu', '2021-08-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0052', 'Bùi', 'John', '2000-08-02', 'Nu', 'bui.john590@ptit.edu.vn', '0952169548', '080 John Hẻm
JohnThành phố, 248132', 'HADONG', 'CNTT', 'DangHoc', '2022-03-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0053', 'Phạm', 'John', '2002-01-10', 'Nu', 'pham.john498@ptit.edu.vn', '0965844884', '11 John Số
Thị xã JohnThành phố, 878217', 'HADONG', 'ATTT', 'BaoLuu', '2021-06-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0054', 'Trần', 'Jane', '2003-07-22', 'Nu', 'tran.jane157@ptit.edu.vn', '0914112401', '1 Jane Ngõ
JaneThành phố, 582836', 'HADONG', 'ATTT', 'DangHoc', '2021-05-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0055', 'Lê', 'Jane', '2002-03-28', 'Nu', 'le.jane504@ptit.edu.vn', '0944676494', '3 Jane Tổ
Thị xã JaneThành phố, 891945', 'HADONG', 'VT', 'DangHoc', '2020-01-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0056', 'Dương', 'John', '2004-08-06', 'Nam', 'duong.john203@ptit.edu.vn', '0958709505', '774 John Số
Thành phố JohnQuận, 818716', 'HADONG', 'VT', 'BaoLuu', '2023-01-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0057', 'Vũ', 'John', '2002-07-06', 'Nu', 'vu.john842@ptit.edu.vn', '0964418504', '33 Bùi Ngõ
JaneThị xã, 635769', 'HADONG', 'ATTT', 'DangHoc', '2024-03-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0058', 'Bùi', 'John', '2000-03-06', 'Nu', 'bui.john751@ptit.edu.vn', '0998597072', '38 John Đường
Thị xã JohnXã, 396479', 'HADONG', 'ATTT', 'BaoLuu', '2022-04-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0059', 'Phạm', 'Jane', '2004-06-28', 'Nu', 'pham.jane916@ptit.edu.vn', '0994809661', '1 Jane Đường
Huyện JaneXã, 401977', 'HADONG', 'CNTT', 'DangHoc', '2020-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0060', 'Dương', 'John', '2001-05-21', 'Nam', 'duong.john253@ptit.edu.vn', '0918733088', '86 John Ngõ
Thành phố JohnThị xã, 460455', 'HADONG', 'KT', 'DangHoc', '2023-06-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0061', 'Trần', 'Jane', '2004-10-01', 'Nu', 'tran.jane658@ptit.edu.vn', '0923419402', '520 Bùi Làng
Thị xã JohnPhường, 925385', 'HADONG', 'KT', 'DangHoc', '2024-02-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0062', 'Nguyễn', 'Jane', '2002-03-15', 'Nam', 'nguyen.jane499@ptit.edu.vn', '0906271444', '90 Lê Hẻm
Thành phố JohnXã, 464312', 'HADONG', 'VT', 'DangHoc', '2023-07-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0063', 'Mai', 'Jane', '2000-06-05', 'Nu', 'mai.jane949@ptit.edu.vn', '0951662184', 'JaneQuận
07 John Ngõ, 858498', 'HADONG', 'CNTT', 'DangHoc', '2022-04-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0064', 'Hoàng', 'Jane', '2002-01-24', 'Nu', 'hoang.jane325@ptit.edu.vn', '0927988558', '88 Jane Đường
JaneThị xã, 733066', 'HADONG', 'ATTT', 'BaoLuu', '2021-03-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0065', 'Hoàng', 'Jane', '2003-08-09', 'Nam', 'hoang.jane365@ptit.edu.vn', '0912579821', '9 Mai Hẻm
JohnXã, 999987', 'HADONG', 'CNTT', 'DangHoc', '2024-01-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0066', 'Dương', 'John', '2005-11-28', 'Nam', 'duong.john229@ptit.edu.vn', '0954342006', '68 Bùi Khu
Huyện JaneThị xã, 776169', 'HADONG', 'VT', 'DangHoc', '2024-11-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0067', 'Bùi', 'John', '2003-11-24', 'Nu', 'bui.john510@ptit.edu.vn', '0925857379', '95 Jane Làng
Quận JaneXã, 207519', 'HADONG', 'KT', 'DangHoc', '2023-12-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0068', 'Phạm', 'John', '2002-07-30', 'Nam', 'pham.john992@ptit.edu.vn', '0917799197', '554 Jane Dãy
Quận JaneThành phố, 291039', 'HADONG', 'KT', 'BaoLuu', '2022-10-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0069', 'Hoàng', 'John', '2005-04-28', 'Nam', 'hoang.john502@ptit.edu.vn', '0955407781', '667 Đặng Hẻm
Huyện JohnXã, 378893', 'HADONG', 'KT', 'DangHoc', '2021-01-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0070', 'Mai', 'John', '2000-08-31', 'Nam', 'mai.john120@ptit.edu.vn', '0994099578', '7 Trần Khu
Thị xã JanePhường, 227381', 'HADONG', 'KT', 'BaoLuu', '2022-09-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0071', 'Mai', 'John', '2001-09-18', 'Nam', 'mai.john476@ptit.edu.vn', '0951529924', '3 Mai Dãy
JohnThị xã, 660619', 'HADONG', 'KT', 'DangHoc', '2023-10-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0072', 'Bùi', 'John', '2006-06-20', 'Nam', 'bui.john136@ptit.edu.vn', '0908597221', '14 John Số
Quận JaneXã, 164195', 'HADONG', 'CNTT', 'DangHoc', '2020-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0073', 'Nguyễn', 'John', '2001-02-02', 'Nu', 'nguyen.john54@ptit.edu.vn', '0935899806', '174 Jane Tổ
JohnHuyện, 874695', 'HADONG', 'KT', 'DangHoc', '2021-01-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0074', 'Mai', 'Jane', '2006-02-22', 'Nu', 'mai.jane198@ptit.edu.vn', '0955258059', '631 John Hẻm
JaneXã, 384045', 'HADONG', 'ATTT', 'DangHoc', '2020-10-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0075', 'Bùi', 'John', '2002-07-23', 'Nam', 'bui.john948@ptit.edu.vn', '0994330543', '16 John Hẻm
Huyện JaneHuyện, 102185', 'HADONG', 'CNTT', 'DangHoc', '2024-10-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0076', 'Mai', 'Jane', '2001-05-31', 'Nu', 'mai.jane874@ptit.edu.vn', '0953814003', '7 Jane Tổ
JohnXã, 101872', 'HADONG', 'VT', 'DangHoc', '2024-04-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0077', 'Phạm', 'Jane', '2005-03-20', 'Nam', 'pham.jane530@ptit.edu.vn', '0929585850', '65 Jane Khu
JaneXã, 420576', 'HADONG', 'KT', 'DangHoc', '2021-05-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0078', 'Nguyễn', 'John', '2003-03-12', 'Nu', 'nguyen.john411@ptit.edu.vn', '0971059969', '79 Phạm Khu
JohnThành phố, 404627', 'HADONG', 'KT', 'BaoLuu', '2024-05-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0079', 'Lê', 'Jane', '2002-05-16', 'Nam', 'le.jane371@ptit.edu.vn', '0944352296', '053 Jane Đường
JaneXã, 104226', 'HADONG', 'VT', 'DangHoc', '2021-11-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0080', 'Mai', 'John', '2003-04-12', 'Nu', 'mai.john657@ptit.edu.vn', '0926937109', '01 Bùi Khu
Huyện JaneHuyện, 217583', 'HADONG', 'VT', 'DangHoc', '2023-11-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0081', 'Dương', 'Jane', '2002-03-20', 'Nam', 'duong.jane790@ptit.edu.vn', '0924129956', '6 John Hẻm
JohnPhường, 408099', 'HADONG', 'VT', 'BaoLuu', '2024-08-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0082', 'Đặng', 'Jane', '2002-11-16', 'Nu', 'dang.jane399@ptit.edu.vn', '0968041059', '02 John Số
JaneThành phố, 391396', 'HADONG', 'KT', 'BaoLuu', '2023-01-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0083', 'Lê', 'John', '2001-01-01', 'Nam', 'le.john749@ptit.edu.vn', '0939154211', '436 Hoàng Số
Quận JaneThành phố, 936307', 'HADONG', 'KT', 'BaoLuu', '2020-07-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0084', 'Mai', 'John', '2001-03-28', 'Nam', 'mai.john964@ptit.edu.vn', '0941713653', '76 Bùi Đường
JaneHuyện, 469115', 'HADONG', 'VT', 'BaoLuu', '2021-07-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0085', 'Nguyễn', 'Jane', '2000-03-08', 'Nam', 'nguyen.jane349@ptit.edu.vn', '0991525347', '853 Jane Tổ
JohnPhường, 849682', 'HADONG', 'KT', 'DangHoc', '2024-08-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0086', 'Hoàng', 'John', '2001-06-02', 'Nam', 'hoang.john140@ptit.edu.vn', '0961894890', 'Huyện JohnPhường
5 Vũ Hẻm, 969914', 'HADONG', 'KT', 'DangHoc', '2020-03-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0087', 'Lê', 'Jane', '2005-07-12', 'Nu', 'le.jane472@ptit.edu.vn', '0943908895', '73 John Tổ
Thị xã JaneThành phố, 898650', 'HADONG', 'KT', 'BaoLuu', '2020-05-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0088', 'Vũ', 'John', '2003-02-09', 'Nam', 'vu.john256@ptit.edu.vn', '0921492526', '2 Mai Đường
Thị xã JohnThành phố, 357765', 'HADONG', 'ATTT', 'DangHoc', '2021-10-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0089', 'Vũ', 'Jane', '2006-10-28', 'Nam', 'vu.jane540@ptit.edu.vn', '0997524278', '1 John Đường
Huyện JaneXã, 649571', 'HADONG', 'CNTT', 'DangHoc', '2023-01-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0090', 'Lê', 'John', '2000-08-01', 'Nam', 'le.john611@ptit.edu.vn', '0994874035', '118 Nguyễn Đường
Thị xã JanePhường, 346258', 'HADONG', 'VT', 'BaoLuu', '2020-03-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0091', 'Nguyễn', 'Jane', '2002-06-29', 'Nu', 'nguyen.jane477@ptit.edu.vn', '0965708752', '2 Lê Ngõ
Huyện JohnQuận, 248113', 'HADONG', 'ATTT', 'DangHoc', '2020-07-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0092', 'Bùi', 'Jane', '2002-11-10', 'Nu', 'bui.jane777@ptit.edu.vn', '0917890153', '638 Đặng Đường
JohnThành phố, 481830', 'HADONG', 'VT', 'DangHoc', '2022-06-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0093', 'Lê', 'John', '2003-10-11', 'Nu', 'le.john351@ptit.edu.vn', '0994700102', '109 John Tổ
Thành phố JohnPhường, 258004', 'HADONG', 'ATTT', 'BaoLuu', '2024-05-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0094', 'Trần', 'Jane', '2003-12-11', 'Nam', 'tran.jane727@ptit.edu.vn', '0957936917', '605 John Dãy
Thị xã JohnThị xã, 477908', 'HADONG', 'VT', 'BaoLuu', '2022-12-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0095', 'Dương', 'Jane', '2002-05-21', 'Nam', 'duong.jane470@ptit.edu.vn', '0978644912', '424 Jane Dãy
Huyện JohnThị xã, 293861', 'HADONG', 'VT', 'DangHoc', '2024-05-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0096', 'Lê', 'Jane', '2000-09-07', 'Nam', 'le.jane749@ptit.edu.vn', '0955678983', '7 Trần Dãy
Quận JohnHuyện, 428221', 'HADONG', 'ATTT', 'BaoLuu', '2024-05-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0097', 'Phạm', 'Jane', '2004-08-05', 'Nam', 'pham.jane590@ptit.edu.vn', '0942378495', 'Thị xã JaneThành phố
9 Jane Khu, 388020', 'HADONG', 'CNTT', 'BaoLuu', '2023-04-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0098', 'Dương', 'Jane', '2004-12-07', 'Nu', 'duong.jane578@ptit.edu.vn', '0958915944', '2 Jane Làng
Huyện JaneHuyện, 506492', 'HADONG', 'ATTT', 'DangHoc', '2021-12-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0099', 'Bùi', 'Jane', '2006-09-11', 'Nu', 'bui.jane453@ptit.edu.vn', '0914646984', '02 Mai Đường
Thành phố JohnXã, 405742', 'HADONG', 'ATTT', 'BaoLuu', '2020-10-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0100', 'Dương', 'Jane', '2003-05-01', 'Nam', 'duong.jane998@ptit.edu.vn', '0937836483', '7 John Khu
Quận JohnXã, 126799', 'HADONG', 'KT', 'DangHoc', '2022-09-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0101', 'Nguyễn', 'John', '2004-01-15', 'Nam', 'nguyen.john444@ptit.edu.vn', '0964622446', '0 John Dãy
JohnHuyện, 775650', 'HADONG', 'ATTT', 'BaoLuu', '2023-07-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0102', 'Dương', 'John', '2006-07-27', 'Nu', 'duong.john230@ptit.edu.vn', '0956988327', '6 Mai Số
JanePhường, 291328', 'HADONG', 'VT', 'DangHoc', '2023-11-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0103', 'Lê', 'John', '2001-10-30', 'Nam', 'le.john590@ptit.edu.vn', '0972008762', '963 Lê Dãy
Thành phố JaneThị xã, 817633', 'HADONG', 'KT', 'DangHoc', '2024-09-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0104', 'Phạm', 'Jane', '2003-12-25', 'Nam', 'pham.jane371@ptit.edu.vn', '0985638758', '9 Đặng Số
JohnHuyện, 813413', 'HADONG', 'VT', 'DangHoc', '2024-01-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0105', 'Mai', 'Jane', '2005-07-23', 'Nu', 'mai.jane811@ptit.edu.vn', '0936769731', '568 John Làng
Quận JohnThị xã, 967720', 'HADONG', 'CNTT', 'DangHoc', '2024-03-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0106', 'Hoàng', 'John', '2001-10-10', 'Nu', 'hoang.john382@ptit.edu.vn', '0987596829', '749 Jane Đường
Quận JohnQuận, 332527', 'HADONG', 'VT', 'BaoLuu', '2020-02-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0107', 'Dương', 'John', '2005-08-17', 'Nam', 'duong.john778@ptit.edu.vn', '0931085810', '5 John Dãy
JohnXã, 755929', 'HADONG', 'CNTT', 'DangHoc', '2024-01-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0108', 'Trần', 'John', '2003-11-10', 'Nu', 'tran.john631@ptit.edu.vn', '0913752330', '931 Dương Số
JohnXã, 683494', 'HADONG', 'CNTT', 'BaoLuu', '2020-05-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0109', 'Lê', 'John', '2002-04-05', 'Nam', 'le.john278@ptit.edu.vn', '0944361230', '57 Dương Dãy
JohnThành phố, 518989', 'HADONG', 'KT', 'DangHoc', '2022-12-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0110', 'Vũ', 'Jane', '2006-03-12', 'Nu', 'vu.jane941@ptit.edu.vn', '0956922024', '88 Bùi Số
JohnThị xã, 527200', 'HADONG', 'KT', 'DangHoc', '2024-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0111', 'Đặng', 'Jane', '2004-03-04', 'Nu', 'dang.jane594@ptit.edu.vn', '0997337042', '00 Mai Số
JohnHuyện, 468349', 'HADONG', 'VT', 'DangHoc', '2021-12-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0112', 'Dương', 'John', '2004-04-21', 'Nu', 'duong.john451@ptit.edu.vn', '0919873459', '793 Phạm Hẻm
Quận JaneQuận, 938014', 'HADONG', 'KT', 'DangHoc', '2020-06-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0113', 'Lê', 'John', '2006-07-14', 'Nam', 'le.john445@ptit.edu.vn', '0904529565', '908 John Đường
Thành phố JohnXã, 206228', 'HADONG', 'CNTT', 'DangHoc', '2021-03-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0114', 'Vũ', 'John', '2005-04-15', 'Nam', 'vu.john146@ptit.edu.vn', '0937489326', '07 Bùi Khu
JohnXã, 594761', 'HADONG', 'ATTT', 'DangHoc', '2023-08-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0115', 'Lê', 'John', '2004-05-10', 'Nu', 'le.john622@ptit.edu.vn', '0908633762', '254 Đặng Khu
Quận JanePhường, 365524', 'HADONG', 'KT', 'DangHoc', '2024-02-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0116', 'Lê', 'Jane', '2005-06-03', 'Nu', 'le.jane873@ptit.edu.vn', '0999604208', '5 Hoàng Khu
JohnThành phố, 398004', 'HADONG', 'VT', 'DangHoc', '2024-03-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0117', 'Vũ', 'Jane', '2005-10-26', 'Nam', 'vu.jane236@ptit.edu.vn', '0965457604', '66 Bùi Làng
JohnThành phố, 106117', 'HADONG', 'VT', 'DangHoc', '2021-09-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0118', 'Đặng', 'John', '2004-05-22', 'Nam', 'dang.john785@ptit.edu.vn', '0964688211', '821 Đặng Hẻm
Thị xã JaneXã, 957832', 'HADONG', 'KT', 'DangHoc', '2020-04-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0119', 'Đặng', 'John', '2006-07-30', 'Nu', 'dang.john179@ptit.edu.vn', '0914003305', '408 John Dãy
Huyện JaneHuyện, 390260', 'HADONG', 'KT', 'DangHoc', '2024-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HADONGSV0120', 'Mai', 'John', '2000-07-05', 'Nu', 'mai.john715@ptit.edu.vn', '0906623504', '12 Lê Khu
Thành phố JaneHuyện, 376318', 'HADONG', 'CNTT', 'DangHoc', '2024-10-29')
ON CONFLICT (MaSV) DO NOTHING;

-- ---- GiangVien ----
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV001', 'Đặng', 'Jane', 'CN', NULL, 'dang.jane180@gv.cntt-hd.ptit.edu.vn', '0946164596', 'HADONG', 'VT', 'TamNghi', '2023-10-12')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV002', 'Hoàng', 'John', 'CN', 'PGS', 'hoang.john397@gv.cntt-hd.ptit.edu.vn', '0959780894', 'HADONG', 'ATTT', 'TamNghi', '2017-01-15')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV003', 'Đặng', 'John', 'TS', NULL, 'dang.john644@gv.cntt-hd.ptit.edu.vn', '0976544612', 'HADONG', 'KT', 'TamNghi', '2012-04-25')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV004', 'Bùi', 'John', 'PGS', 'GTV', 'bui.john720@gv.cntt-hd.ptit.edu.vn', '0992252124', 'HADONG', 'ATTT', 'DangCongTac', '2015-07-03')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV005', 'Trần', 'Jane', 'ThS', 'PGS', 'tran.jane384@gv.cntt-hd.ptit.edu.vn', '0937513355', 'HADONG', 'CNTT', 'TamNghi', '2021-01-23')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV006', 'Đặng', 'John', 'ThS', 'GTV', 'dang.john286@gv.cntt-hd.ptit.edu.vn', '0948664983', 'HADONG', 'ATTT', 'DangCongTac', '2016-04-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV007', 'Mai', 'Jane', 'CN', 'PGS', 'mai.jane187@gv.cntt-hd.ptit.edu.vn', '0959193883', 'HADONG', 'ATTT', 'TamNghi', '2016-03-20')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV008', 'Đặng', 'Jane', 'CN', 'GTV', 'dang.jane185@gv.cntt-hd.ptit.edu.vn', '0941990780', 'HADONG', 'VT', 'DangCongTac', '2011-12-01')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV009', 'Phạm', 'Jane', 'PGS', 'PGS', 'pham.jane326@gv.cntt-hd.ptit.edu.vn', '0997029696', 'HADONG', 'KT', 'DangCongTac', '2015-01-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV010', 'Trần', 'Jane', 'ThS', 'GTV', 'tran.jane43@gv.cntt-hd.ptit.edu.vn', '0984824305', 'HADONG', 'CNTT', 'DangCongTac', '2021-10-15')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV011', 'Nguyễn', 'Jane', 'TS', NULL, 'nguyen.jane648@gv.cntt-hd.ptit.edu.vn', '0972931404', 'HADONG', 'CNTT', 'DangCongTac', '2021-06-14')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV012', 'Bùi', 'Jane', 'CN', NULL, 'bui.jane3@gv.cntt-hd.ptit.edu.vn', '0928413211', 'HADONG', 'CNTT', 'DangCongTac', '2020-06-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV013', 'Nguyễn', 'Jane', 'CN', NULL, 'nguyen.jane206@gv.cntt-hd.ptit.edu.vn', '0943101605', 'HADONG', 'KT', 'DangCongTac', '2020-10-13')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV014', 'Lê', 'John', 'ThS', 'PGS', 'le.john893@gv.cntt-hd.ptit.edu.vn', '0922958002', 'HADONG', 'KT', 'TamNghi', '2022-10-18')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV015', 'Lê', 'John', 'ThS', NULL, 'le.john296@gv.cntt-hd.ptit.edu.vn', '0908123461', 'HADONG', 'KT', 'DangCongTac', '2015-03-27')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV016', 'Nguyễn', 'Jane', 'TS', NULL, 'nguyen.jane457@gv.cntt-hd.ptit.edu.vn', '0922433395', 'HADONG', 'CNTT', 'DangCongTac', '2020-09-17')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV017', 'Bùi', 'John', 'ThS', NULL, 'bui.john220@gv.cntt-hd.ptit.edu.vn', '0943305064', 'HADONG', 'ATTT', 'DangCongTac', '2018-12-27')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV018', 'Mai', 'Jane', 'CN', NULL, 'mai.jane338@gv.cntt-hd.ptit.edu.vn', '0917224637', 'HADONG', 'ATTT', 'TamNghi', '2018-06-24')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV019', 'Vũ', 'Jane', 'TS', 'PGS', 'vu.jane289@gv.cntt-hd.ptit.edu.vn', '0902723132', 'HADONG', 'CNTT', 'DangCongTac', '2022-11-25')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV020', 'Bùi', 'John', 'ThS', NULL, 'bui.john584@gv.cntt-hd.ptit.edu.vn', '0985884396', 'HADONG', 'ATTT', 'DangCongTac', '2011-06-18')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV021', 'Nguyễn', 'John', 'CN', NULL, 'nguyen.john653@gv.cntt-hd.ptit.edu.vn', '0981640072', 'HADONG', 'ATTT', 'DangCongTac', '2011-02-05')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV022', 'Lê', 'John', 'PGS', 'PGS', 'le.john117@gv.cntt-hd.ptit.edu.vn', '0983919174', 'HADONG', 'VT', 'DangCongTac', '2014-02-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV023', 'Lê', 'Jane', 'CN', NULL, 'le.jane727@gv.cntt-hd.ptit.edu.vn', '0996961270', 'HADONG', 'ATTT', 'DangCongTac', '2017-05-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV024', 'Nguyễn', 'Jane', 'CN', NULL, 'nguyen.jane542@gv.cntt-hd.ptit.edu.vn', '0977940372', 'HADONG', 'VT', 'DangCongTac', '2019-08-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV025', 'Lê', 'Jane', 'PGS', 'PGS', 'le.jane715@gv.cntt-hd.ptit.edu.vn', '0997793788', 'HADONG', 'CNTT', 'TamNghi', '2015-03-27')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV026', 'Đặng', 'John', 'CN', NULL, 'dang.john396@gv.cntt-hd.ptit.edu.vn', '0909663887', 'HADONG', 'VT', 'DangCongTac', '2013-10-20')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV027', 'Đặng', 'Jane', 'PGS', NULL, 'dang.jane955@gv.cntt-hd.ptit.edu.vn', '0956450089', 'HADONG', 'CNTT', 'DangCongTac', '2020-10-14')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV028', 'Hoàng', 'Jane', 'TS', NULL, 'hoang.jane240@gv.cntt-hd.ptit.edu.vn', '0967697256', 'HADONG', 'CNTT', 'DangCongTac', '2012-09-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV029', 'Mai', 'Jane', 'PGS', 'GTV', 'mai.jane379@gv.cntt-hd.ptit.edu.vn', '0988772113', 'HADONG', 'VT', 'DangCongTac', '2010-05-11')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HADONGGV030', 'Bùi', 'John', 'PGS', NULL, 'bui.john15@gv.cntt-hd.ptit.edu.vn', '0938731701', 'HADONG', 'ATTT', 'TamNghi', '2022-06-10')
ON CONFLICT (MaGV) DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA001', 'Phong 1', 'Toa D', 4, 30, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA002', 'Phong 2', 'Toa C', 4, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA003', 'Phong 3', 'Toa D', 4, 50, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA004', 'Phong 4', 'Toa A', 3, 30, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA005', 'Phong 5', 'Toa B', 5, 50, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA006', 'Phong 6', 'Toa A', 3, 30, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA007', 'Phong 7', 'Toa A', 4, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA008', 'Phong 8', 'Toa B', 1, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA009', 'Phong 9', 'Toa C', 2, 100, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA010', 'Phong 10', 'Toa D', 4, 100, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA011', 'Phong 11', 'Toa A', 3, 100, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA012', 'Phong 12', 'Toa B', 2, 120, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA013', 'Phong 13', 'Toa D', 1, 40, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA014', 'Phong 14', 'Toa D', 2, 120, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA015', 'Phong 15', 'Toa B', 1, 30, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA016', 'Phong 16', 'Toa C', 3, 80, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA017', 'Phong 17', 'Toa B', 4, 50, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA018', 'Phong 18', 'Toa C', 3, 30, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA019', 'Phong 19', 'Toa A', 1, 40, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHA020', 'Phong 20', 'Toa D', 3, 50, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-HADONG-01', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV021', 'CS1013-01', 15, 4, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HADONG-01', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV019', 'CS1009-01', 15, 3, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1007-HADONG-01', 'CS1007', 'HK20251', 'HADONG', 'HADONGGV030', 'CS1007-01', 12, 2, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HADONG-01', 'CS1008', 'HK20251', 'HADONG', 'HADONGGV023', 'CS1008-01', 10, 0, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1003-HADONG-01', 'CS1003', 'HK20251', 'HADONG', 'HADONGGV018', 'CS1003-01', 10, 0, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HADONG-02', 'CS1008', 'HK20251', 'HADONG', 'HADONGGV003', 'CS1008-02', 40, 14, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HADONG-01', 'CS1004', 'HK20251', 'HADONG', 'HADONGGV004', 'CS1004-01', 30, 12, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HADONG-01', 'CS1010', 'HK20251', 'HADONG', 'HADONGGV029', 'CS1010-01', 50, 9, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HADONG-02', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV011', 'CS1009-02', 30, 12, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HADONG-01', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV022', 'CS1015-01', 50, 20, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1005-HADONG-01', 'CS1005', 'HK20251', 'HADONG', 'HADONGGV026', 'CS1005-01', 60, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HADONG-01', 'CS1001', 'HK20251', 'HADONG', 'HADONGGV016', 'CS1001-01', 30, 10, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-HADONG-01', 'CS1012', 'HK20251', 'HADONG', 'HADONGGV001', 'CS1012-01', 50, 19, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HADONG-02', 'CS1004', 'HK20251', 'HADONG', 'HADONGGV022', 'CS1004-02', 40, 0, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1003-HADONG-02', 'CS1003', 'HK20251', 'HADONG', 'HADONGGV008', 'CS1003-02', 50, 15, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HADONG-02', 'CS1001', 'HK20251', 'HADONG', 'HADONGGV008', 'CS1001-02', 60, 2, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HADONG-03', 'CS1004', 'HK20251', 'HADONG', 'HADONGGV020', 'CS1004-03', 40, 15, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1005-HADONG-02', 'CS1005', 'HK20251', 'HADONG', 'HADONGGV006', 'CS1005-02', 60, 6, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('VT2001-HADONG-01', 'VT2001', 'HK20251', 'HADONG', 'HADONGGV017', 'VT2001-01', 50, 10, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HADONG-02', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV020', 'CS1015-02', 60, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HADONG-03', 'CS1001', 'HK20251', 'HADONG', 'HADONGGV001', 'CS1001-03', 40, 4, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HADONG-03', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV015', 'CS1009-03', 30, 6, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HADONG-03', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV014', 'CS1015-03', 40, 13, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HADONG-02', 'CS1010', 'HK20251', 'HADONG', 'HADONGGV012', 'CS1010-02', 30, 1, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HADONG-04', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV011', 'CS1009-04', 30, 10, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;

-- ---- LichHoc ----
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0001', 'CS1013-HADONG-01', 'PHA018', 2, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0002', 'CS1013-HADONG-01', 'PHA002', 3, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0003', 'CS1013-HADONG-01', 'PHA015', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0004', 'CS1009-HADONG-01', 'PHA006', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0005', 'CS1009-HADONG-01', 'PHA018', 4, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0006', 'CS1007-HADONG-01', 'PHA016', 2, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0007', 'CS1007-HADONG-01', 'PHA007', 6, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0008', 'CS1008-HADONG-01', 'PHA002', 6, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0009', 'CS1008-HADONG-01', 'PHA006', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0010', 'CS1003-HADONG-01', 'PHA002', 4, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0011', 'CS1003-HADONG-01', 'PHA010', 5, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0012', 'CS1003-HADONG-01', 'PHA002', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0013', 'CS1008-HADONG-02', 'PHA005', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0014', 'CS1008-HADONG-02', 'PHA005', 5, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0015', 'CS1008-HADONG-02', 'PHA002', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0016', 'CS1004-HADONG-01', 'PHA016', 7, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0017', 'CS1004-HADONG-01', 'PHA011', 7, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0018', 'CS1010-HADONG-01', 'PHA018', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0019', 'CS1010-HADONG-01', 'PHA009', 7, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0020', 'CS1009-HADONG-02', 'PHA016', 4, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0021', 'CS1009-HADONG-02', 'PHA011', 3, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0022', 'CS1015-HADONG-01', 'PHA011', 4, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0023', 'CS1015-HADONG-01', 'PHA001', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0024', 'CS1005-HADONG-01', 'PHA018', 5, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0025', 'CS1005-HADONG-01', 'PHA016', 7, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0026', 'CS1005-HADONG-01', 'PHA002', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0027', 'CS1001-HADONG-01', 'PHA016', 5, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0028', 'CS1001-HADONG-01', 'PHA017', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0029', 'CS1012-HADONG-01', 'PHA015', 7, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0030', 'CS1012-HADONG-01', 'PHA019', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0031', 'CS1004-HADONG-02', 'PHA012', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0032', 'CS1004-HADONG-02', 'PHA005', 7, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0033', 'CS1003-HADONG-02', 'PHA004', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0034', 'CS1003-HADONG-02', 'PHA002', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0035', 'CS1001-HADONG-02', 'PHA013', 2, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0036', 'CS1001-HADONG-02', 'PHA013', 3, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0037', 'CS1001-HADONG-02', 'PHA005', 6, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0038', 'CS1004-HADONG-03', 'PHA004', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0039', 'CS1004-HADONG-03', 'PHA020', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0040', 'CS1005-HADONG-02', 'PHA012', 6, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0041', 'CS1005-HADONG-02', 'PHA008', 3, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0042', 'CS1005-HADONG-02', 'PHA014', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0043', 'VT2001-HADONG-01', 'PHA017', 6, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0044', 'VT2001-HADONG-01', 'PHA011', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0045', 'CS1015-HADONG-02', 'PHA015', 3, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0046', 'CS1015-HADONG-02', 'PHA003', 4, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0047', 'CS1015-HADONG-02', 'PHA003', 4, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0048', 'CS1001-HADONG-03', 'PHA018', 3, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0049', 'CS1001-HADONG-03', 'PHA001', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0050', 'CS1001-HADONG-03', 'PHA013', 2, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0051', 'CS1009-HADONG-03', 'PHA019', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0052', 'CS1009-HADONG-03', 'PHA009', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0053', 'CS1015-HADONG-03', 'PHA019', 5, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0054', 'CS1015-HADONG-03', 'PHA009', 5, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0055', 'CS1015-HADONG-03', 'PHA020', 7, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0056', 'CS1010-HADONG-02', 'PHA012', 6, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0057', 'CS1010-HADONG-02', 'PHA017', 7, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0058', 'CS1009-HADONG-04', 'PHA003', 3, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHA0059', 'CS1009-HADONG-04', 'PHA011', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
