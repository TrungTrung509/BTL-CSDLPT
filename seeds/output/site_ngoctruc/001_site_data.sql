-- ============================================================
-- DỮ LIỆU CỤC BỘ - Site NGOCTRUC (Cơ sở Ngọc Trục)
-- Sinh: 2026-04-04 23:17:07
-- ============================================================

-- ---- SinhVien ----
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0001', 'Vũ', 'Jane', '2000-11-17', 'Nu', 'vu.jane738@ptit.edu.vn', '0904118141', '911 Jane Khu
JaneXã, 260402', 'NGOCTRUC', 'VT', 'DangHoc', '2022-01-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0002', 'Bùi', 'John', '2006-01-21', 'Nu', 'bui.john79@ptit.edu.vn', '0918231418', '485 Jane Khu
Huyện JaneQuận, 519148', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2024-11-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0003', 'Trần', 'Jane', '2003-10-21', 'Nam', 'tran.jane437@ptit.edu.vn', '0968771573', '844 Đặng Ngõ
JaneHuyện, 225405', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2024-02-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0004', 'Dương', 'John', '2000-12-25', 'Nu', 'duong.john237@ptit.edu.vn', '0988604280', '914 Phạm Làng
Thành phố JaneQuận, 306192', 'NGOCTRUC', 'VT', 'DangHoc', '2022-09-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0005', 'Trần', 'John', '2001-11-25', 'Nam', 'tran.john768@ptit.edu.vn', '0968762021', '558 Bùi Hẻm
JaneThị xã, 723842', 'NGOCTRUC', 'CNTT', 'DangHoc', '2024-11-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0006', 'Vũ', 'John', '2005-08-01', 'Nam', 'vu.john404@ptit.edu.vn', '0921919819', '466 Lê Khu
JaneThị xã, 761971', 'NGOCTRUC', 'KT', 'DangHoc', '2020-05-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0007', 'Hoàng', 'Jane', '2002-07-07', 'Nu', 'hoang.jane787@ptit.edu.vn', '0935601294', '9 John Hẻm
Quận JohnPhường, 236267', 'NGOCTRUC', 'KT', 'BaoLuu', '2024-09-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0008', 'Mai', 'John', '2004-06-03', 'Nam', 'mai.john52@ptit.edu.vn', '0965208115', '3 Đặng Làng
JanePhường, 263237', 'NGOCTRUC', 'KT', 'DangHoc', '2024-12-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0009', 'Trần', 'John', '2006-10-21', 'Nam', 'tran.john77@ptit.edu.vn', '0983395286', '729 John Ngõ
Quận JohnHuyện, 851187', 'NGOCTRUC', 'KT', 'DangHoc', '2024-07-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0010', 'Mai', 'John', '2001-04-09', 'Nu', 'mai.john460@ptit.edu.vn', '0936385665', '12 John Hẻm
Huyện JohnPhường, 947935', 'NGOCTRUC', 'KT', 'DangHoc', '2021-12-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0011', 'Bùi', 'John', '2004-03-09', 'Nam', 'bui.john276@ptit.edu.vn', '0952714271', '207 Hoàng Đường
Thị xã JaneQuận, 440394', 'NGOCTRUC', 'ATTT', 'DangHoc', '2022-02-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0012', 'Bùi', 'John', '2002-11-18', 'Nam', 'bui.john782@ptit.edu.vn', '0935890412', '94 John Đường
Thị xã JaneHuyện, 197205', 'NGOCTRUC', 'ATTT', 'DangHoc', '2020-05-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0013', 'Phạm', 'John', '2001-01-08', 'Nam', 'pham.john598@ptit.edu.vn', '0991438346', '556 John Ngõ
Thị xã JohnThành phố, 413860', 'NGOCTRUC', 'VT', 'DangHoc', '2022-05-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0014', 'Bùi', 'Jane', '2000-03-06', 'Nu', 'bui.jane947@ptit.edu.vn', '0947648987', '45 Jane Làng
JaneXã, 980264', 'NGOCTRUC', 'KT', 'BaoLuu', '2020-10-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0015', 'Phạm', 'John', '2000-10-08', 'Nam', 'pham.john919@ptit.edu.vn', '0927955147', 'Huyện JaneHuyện
446 Jane Làng, 249932', 'NGOCTRUC', 'CNTT', 'DangHoc', '2024-02-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0016', 'Mai', 'John', '2003-06-01', 'Nu', 'mai.john564@ptit.edu.vn', '0908460948', '237 Mai Đường
JaneXã, 966840', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-10-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0017', 'Bùi', 'John', '2002-05-10', 'Nam', 'bui.john329@ptit.edu.vn', '0931875774', '16 Bùi Tổ
Quận JohnThị xã, 526740', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2023-05-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0018', 'Dương', 'Jane', '2001-12-12', 'Nam', 'duong.jane17@ptit.edu.vn', '0954305748', '330 Jane Đường
JohnPhường, 478666', 'NGOCTRUC', 'KT', 'DangHoc', '2024-05-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0019', 'Vũ', 'Jane', '2003-12-12', 'Nu', 'vu.jane405@ptit.edu.vn', '0929051789', '139 Jane Tổ
JohnQuận, 658033', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-11-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0020', 'Mai', 'Jane', '2005-03-09', 'Nu', 'mai.jane31@ptit.edu.vn', '0915997230', '091 Jane Ngõ
JohnXã, 660164', 'NGOCTRUC', 'ATTT', 'DangHoc', '2020-03-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0021', 'Bùi', 'Jane', '2000-07-09', 'Nam', 'bui.jane287@ptit.edu.vn', '0918935967', '17 Jane Đường
Thành phố JohnQuận, 741622', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2021-09-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0022', 'Bùi', 'Jane', '2001-11-25', 'Nu', 'bui.jane892@ptit.edu.vn', '0981393188', '2 John Dãy
Quận JaneThị xã, 225820', 'NGOCTRUC', 'VT', 'DangHoc', '2022-12-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0023', 'Phạm', 'John', '2004-10-18', 'Nu', 'pham.john543@ptit.edu.vn', '0977086055', '5 John Đường
Huyện JohnThị xã, 658163', 'NGOCTRUC', 'VT', 'DangHoc', '2022-09-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0024', 'Bùi', 'John', '2006-08-03', 'Nu', 'bui.john765@ptit.edu.vn', '0905799755', '35 Jane Số
JaneXã, 962098', 'NGOCTRUC', 'KT', 'DangHoc', '2023-06-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0025', 'Trần', 'John', '2004-04-11', 'Nam', 'tran.john451@ptit.edu.vn', '0986487092', '599 Trần Khu
JohnQuận, 258661', 'NGOCTRUC', 'VT', 'DangHoc', '2023-05-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0026', 'Nguyễn', 'John', '2004-12-31', 'Nam', 'nguyen.john122@ptit.edu.vn', '0988081594', '935 Jane Số
JohnHuyện, 773511', 'NGOCTRUC', 'CNTT', 'DangHoc', '2024-04-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0027', 'Phạm', 'Jane', '2000-03-24', 'Nu', 'pham.jane724@ptit.edu.vn', '0947534937', '0 Vũ Tổ
JaneXã, 237777', 'NGOCTRUC', 'CNTT', 'DangHoc', '2024-06-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0028', 'Hoàng', 'Jane', '2005-08-29', 'Nu', 'hoang.jane974@ptit.edu.vn', '0943158116', '91 John Làng
JohnPhường, 142676', 'NGOCTRUC', 'KT', 'DangHoc', '2021-07-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0029', 'Dương', 'John', '2006-02-01', 'Nu', 'duong.john173@ptit.edu.vn', '0964493952', '2 John Đường
Huyện JohnThành phố, 335213', 'NGOCTRUC', 'VT', 'DangHoc', '2024-08-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0030', 'Bùi', 'Jane', '2006-07-30', 'Nu', 'bui.jane470@ptit.edu.vn', '0973351342', '2 Jane Đường
Huyện JohnQuận, 468094', 'NGOCTRUC', 'VT', 'BaoLuu', '2022-10-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0031', 'Dương', 'Jane', '2001-12-14', 'Nam', 'duong.jane804@ptit.edu.vn', '0931484969', '5 Trần Tổ
JohnQuận, 627817', 'NGOCTRUC', 'VT', 'DangHoc', '2023-04-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0032', 'Trần', 'Jane', '2001-01-04', 'Nu', 'tran.jane219@ptit.edu.vn', '0992989786', '4 Phạm Hẻm
Huyện JaneQuận, 142823', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-02-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0033', 'Mai', 'Jane', '2004-12-18', 'Nam', 'mai.jane726@ptit.edu.vn', '0962750951', '2 John Hẻm
JanePhường, 662507', 'NGOCTRUC', 'ATTT', 'DangHoc', '2022-12-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0034', 'Mai', 'John', '2003-08-19', 'Nam', 'mai.john82@ptit.edu.vn', '0937465204', '1 Phạm Dãy
JaneThành phố, 530310', 'NGOCTRUC', 'VT', 'DangHoc', '2022-02-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0035', 'Vũ', 'John', '2003-06-02', 'Nu', 'vu.john580@ptit.edu.vn', '0988276689', '7 Jane Khu
JohnHuyện, 797349', 'NGOCTRUC', 'KT', 'BaoLuu', '2024-06-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0036', 'Nguyễn', 'Jane', '2004-08-08', 'Nam', 'nguyen.jane891@ptit.edu.vn', '0923083344', '31 Dương Đường
Quận JohnThành phố, 219144', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2020-12-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0037', 'Dương', 'John', '2002-06-01', 'Nu', 'duong.john223@ptit.edu.vn', '0969586073', '854 John Đường
JohnXã, 943213', 'NGOCTRUC', 'KT', 'DangHoc', '2022-12-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0038', 'Bùi', 'John', '2001-04-07', 'Nu', 'bui.john305@ptit.edu.vn', '0909060847', '3 Jane Tổ
Quận JaneThành phố, 965725', 'NGOCTRUC', 'KT', 'DangHoc', '2024-03-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0039', 'Lê', 'Jane', '2000-07-08', 'Nu', 'le.jane712@ptit.edu.vn', '0966566683', '8 Hoàng Số
Thành phố JaneHuyện, 583555', 'NGOCTRUC', 'VT', 'DangHoc', '2021-04-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0040', 'Bùi', 'John', '2000-08-07', 'Nam', 'bui.john366@ptit.edu.vn', '0973704553', '48 John Đường
Huyện JohnHuyện, 865551', 'NGOCTRUC', 'VT', 'DangHoc', '2023-05-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0041', 'Bùi', 'Jane', '2003-04-27', 'Nam', 'bui.jane265@ptit.edu.vn', '0948010456', '488 Mai Làng
JohnHuyện, 259160', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-11-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0042', 'Đặng', 'Jane', '2001-04-15', 'Nu', 'dang.jane295@ptit.edu.vn', '0903771848', '5 Jane Dãy
Quận JaneThị xã, 761616', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2021-02-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0043', 'Mai', 'John', '2006-01-23', 'Nam', 'mai.john236@ptit.edu.vn', '0993183849', '3 Jane Làng
JohnThành phố, 342095', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2022-09-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0044', 'Trần', 'John', '2001-10-19', 'Nam', 'tran.john67@ptit.edu.vn', '0991843832', '431 John Hẻm
Thành phố JaneXã, 629151', 'NGOCTRUC', 'VT', 'DangHoc', '2023-06-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0045', 'Đặng', 'John', '2005-07-26', 'Nam', 'dang.john45@ptit.edu.vn', '0907492132', '552 Đặng Làng
Thị xã JohnXã, 230606', 'NGOCTRUC', 'KT', 'DangHoc', '2021-07-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0046', 'Dương', 'John', '2006-09-23', 'Nam', 'duong.john196@ptit.edu.vn', '0948308096', '5 John Khu
JaneHuyện, 469217', 'NGOCTRUC', 'ATTT', 'DangHoc', '2021-02-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0047', 'Nguyễn', 'John', '2003-12-14', 'Nu', 'nguyen.john316@ptit.edu.vn', '0901684888', '247 Vũ Dãy
JohnQuận, 689308', 'NGOCTRUC', 'ATTT', 'DangHoc', '2021-09-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0048', 'Lê', 'John', '2002-07-03', 'Nam', 'le.john914@ptit.edu.vn', '0947029886', '4 Vũ Ngõ
Huyện JohnPhường, 891856', 'NGOCTRUC', 'KT', 'DangHoc', '2022-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0049', 'Hoàng', 'John', '2002-03-24', 'Nam', 'hoang.john848@ptit.edu.vn', '0916333675', '70 John Khu
Thành phố JohnHuyện, 605775', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2022-04-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0050', 'Phạm', 'John', '2004-07-09', 'Nu', 'pham.john76@ptit.edu.vn', '0951249666', 'JohnThị xã
468 Jane Làng, 385941', 'NGOCTRUC', 'KT', 'DangHoc', '2024-02-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0051', 'Phạm', 'John', '2004-10-19', 'Nu', 'pham.john953@ptit.edu.vn', '0942737216', '5 Phạm Đường
Quận JaneThành phố, 271650', 'NGOCTRUC', 'VT', 'BaoLuu', '2021-04-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0052', 'Bùi', 'John', '2003-06-02', 'Nu', 'bui.john700@ptit.edu.vn', '0914367030', '66 Đặng Tổ
Quận JaneThị xã, 774411', 'NGOCTRUC', 'VT', 'DangHoc', '2020-09-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0053', 'Lê', 'Jane', '2005-12-10', 'Nu', 'le.jane983@ptit.edu.vn', '0908541219', '03 Bùi Hẻm
Thị xã JanePhường, 776869', 'NGOCTRUC', 'VT', 'DangHoc', '2021-10-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0054', 'Dương', 'Jane', '2005-07-30', 'Nu', 'duong.jane342@ptit.edu.vn', '0947933359', '880 Trần Dãy
JohnHuyện, 995263', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2020-03-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0055', 'Mai', 'Jane', '2003-03-25', 'Nu', 'mai.jane246@ptit.edu.vn', '0955403733', '26 Hoàng Số
Thị xã JohnPhường, 285698', 'NGOCTRUC', 'VT', 'BaoLuu', '2020-07-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0056', 'Nguyễn', 'John', '2001-05-16', 'Nu', 'nguyen.john323@ptit.edu.vn', '0973852170', 'JaneXã
57 Jane Dãy, 734582', 'NGOCTRUC', 'KT', 'DangHoc', '2023-09-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0057', 'Hoàng', 'John', '2004-09-24', 'Nam', 'hoang.john745@ptit.edu.vn', '0933088647', '86 John Hẻm
Thị xã JohnPhường, 733669', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2022-04-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0058', 'Bùi', 'Jane', '2000-02-05', 'Nam', 'bui.jane179@ptit.edu.vn', '0993393138', '162 Lê Số
JanePhường, 837047', 'NGOCTRUC', 'KT', 'DangHoc', '2023-02-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0059', 'Hoàng', 'Jane', '2000-05-23', 'Nam', 'hoang.jane765@ptit.edu.vn', '0965830178', '82 Nguyễn Hẻm
JanePhường, 717668', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-09-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0060', 'Dương', 'Jane', '2005-08-31', 'Nam', 'duong.jane395@ptit.edu.vn', '0905675399', '96 John Ngõ
JohnXã, 966610', 'NGOCTRUC', 'VT', 'DangHoc', '2021-09-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0061', 'Hoàng', 'John', '2003-05-23', 'Nam', 'hoang.john376@ptit.edu.vn', '0965289864', '48 John Số
Huyện JohnQuận, 753108', 'NGOCTRUC', 'VT', 'BaoLuu', '2023-02-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0062', 'Đặng', 'John', '2003-07-28', 'Nam', 'dang.john197@ptit.edu.vn', '0971368847', '52 Jane Hẻm
JohnXã, 458035', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-11-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0063', 'Vũ', 'Jane', '2005-10-14', 'Nu', 'vu.jane270@ptit.edu.vn', '0962587286', '521 Nguyễn Làng
Huyện JohnQuận, 731885', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2023-06-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0064', 'Bùi', 'John', '2005-07-19', 'Nam', 'bui.john77@ptit.edu.vn', '0963597008', '244 John Đường
JohnQuận, 446326', 'NGOCTRUC', 'VT', 'DangHoc', '2021-02-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0065', 'Đặng', 'John', '2001-06-30', 'Nam', 'dang.john181@ptit.edu.vn', '0947532631', '987 Jane Làng
JohnPhường, 303283', 'NGOCTRUC', 'VT', 'DangHoc', '2022-09-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0066', 'Đặng', 'Jane', '2003-10-18', 'Nam', 'dang.jane866@ptit.edu.vn', '0958558777', '660 Dương Ngõ
Thị xã JohnPhường, 988956', 'NGOCTRUC', 'KT', 'DangHoc', '2022-02-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0067', 'Lê', 'John', '2005-04-28', 'Nam', 'le.john6@ptit.edu.vn', '0933552375', '69 John Đường
Thành phố JaneThị xã, 759536', 'NGOCTRUC', 'CNTT', 'DangHoc', '2022-07-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0068', 'Phạm', 'Jane', '2006-01-12', 'Nu', 'pham.jane282@ptit.edu.vn', '0919511693', '393 Vũ Dãy
Quận JaneQuận, 975229', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2024-02-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0069', 'Mai', 'Jane', '2003-08-04', 'Nam', 'mai.jane349@ptit.edu.vn', '0908390729', '232 Đặng Tổ
JohnThành phố, 406523', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-02-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0070', 'Trần', 'John', '2005-07-27', 'Nu', 'tran.john214@ptit.edu.vn', '0966802967', '52 Dương Làng
Thành phố JaneHuyện, 432481', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2021-07-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0071', 'Dương', 'Jane', '2001-07-25', 'Nam', 'duong.jane273@ptit.edu.vn', '0981514995', '378 John Tổ
JaneHuyện, 191745', 'NGOCTRUC', 'VT', 'DangHoc', '2021-06-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0072', 'Phạm', 'Jane', '2005-09-22', 'Nam', 'pham.jane369@ptit.edu.vn', '0925367488', '01 John Đường
Thị xã JohnXã, 885875', 'NGOCTRUC', 'KT', 'DangHoc', '2023-02-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0073', 'Đặng', 'Jane', '2005-01-18', 'Nam', 'dang.jane188@ptit.edu.vn', '0947223749', '2 John Làng
Quận JohnXã, 546986', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-03-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0074', 'Nguyễn', 'Jane', '2002-03-10', 'Nu', 'nguyen.jane355@ptit.edu.vn', '0915183206', '5 Đặng Đường
Quận JohnThị xã, 902087', 'NGOCTRUC', 'ATTT', 'DangHoc', '2020-06-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0075', 'Nguyễn', 'Jane', '2001-12-29', 'Nam', 'nguyen.jane377@ptit.edu.vn', '0913813915', '9 Jane Dãy
JohnPhường, 653276', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-06-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0076', 'Nguyễn', 'Jane', '2004-01-03', 'Nu', 'nguyen.jane504@ptit.edu.vn', '0908395777', '448 Mai Tổ
JohnPhường, 564200', 'NGOCTRUC', 'ATTT', 'DangHoc', '2021-08-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0077', 'Mai', 'John', '2003-08-17', 'Nam', 'mai.john997@ptit.edu.vn', '0964044524', '0 John Khu
Thị xã JanePhường, 845735', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2023-05-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0078', 'Trần', 'John', '2000-09-06', 'Nu', 'tran.john458@ptit.edu.vn', '0905035849', '963 Dương Hẻm
Huyện JohnThị xã, 909987', 'NGOCTRUC', 'CNTT', 'DangHoc', '2021-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0079', 'Mai', 'John', '2003-03-30', 'Nam', 'mai.john217@ptit.edu.vn', '0953975476', '4 John Khu
JaneXã, 442886', 'NGOCTRUC', 'VT', 'DangHoc', '2022-07-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0080', 'Lê', 'Jane', '2003-03-03', 'Nam', 'le.jane424@ptit.edu.vn', '0984444915', '899 John Tổ
JaneThị xã, 817501', 'NGOCTRUC', 'KT', 'DangHoc', '2024-03-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0081', 'Phạm', 'John', '2000-09-19', 'Nu', 'pham.john844@ptit.edu.vn', '0932037978', '632 Hoàng Dãy
JohnHuyện, 389829', 'NGOCTRUC', 'KT', 'DangHoc', '2022-10-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0082', 'Phạm', 'Jane', '2006-03-28', 'Nam', 'pham.jane923@ptit.edu.vn', '0969849337', '0 John Số
JaneThành phố, 902695', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-09-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0083', 'Trần', 'Jane', '2000-01-17', 'Nam', 'tran.jane376@ptit.edu.vn', '0975359983', '703 Hoàng Số
JohnThị xã, 154640', 'NGOCTRUC', 'VT', 'DangHoc', '2024-01-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0084', 'Mai', 'Jane', '2005-10-19', 'Nu', 'mai.jane296@ptit.edu.vn', '0916483956', '743 Jane Dãy
JohnQuận, 203494', 'NGOCTRUC', 'KT', 'DangHoc', '2024-12-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0085', 'Nguyễn', 'John', '2005-08-07', 'Nam', 'nguyen.john273@ptit.edu.vn', '0905796545', '27 Jane Ngõ
Quận JohnThành phố, 220555', 'NGOCTRUC', 'KT', 'DangHoc', '2022-03-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0086', 'Hoàng', 'John', '2000-09-05', 'Nam', 'hoang.john734@ptit.edu.vn', '0906133605', '9 Jane Số
Huyện JohnHuyện, 460802', 'NGOCTRUC', 'KT', 'DangHoc', '2021-08-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0087', 'Lê', 'Jane', '2005-07-09', 'Nu', 'le.jane27@ptit.edu.vn', '0955391414', '497 Jane Đường
Thị xã JaneThành phố, 944983', 'NGOCTRUC', 'KT', 'BaoLuu', '2023-12-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0088', 'Bùi', 'Jane', '2001-05-15', 'Nam', 'bui.jane789@ptit.edu.vn', '0924085089', '4 Dương Tổ
JohnThành phố, 117661', 'NGOCTRUC', 'VT', 'BaoLuu', '2022-04-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0089', 'Trần', 'John', '2003-12-14', 'Nu', 'tran.john610@ptit.edu.vn', '0925026901', '479 John Hẻm
JanePhường, 937709', 'NGOCTRUC', 'CNTT', 'DangHoc', '2022-03-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0090', 'Hoàng', 'Jane', '2003-02-25', 'Nu', 'hoang.jane888@ptit.edu.vn', '0984763212', 'Thị xã JohnQuận
30 Phạm Khu, 832126', 'NGOCTRUC', 'VT', 'DangHoc', '2022-10-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0091', 'Lê', 'Jane', '2001-12-12', 'Nu', 'le.jane467@ptit.edu.vn', '0933736752', '683 Vũ Tổ
JaneThành phố, 601764', 'NGOCTRUC', 'VT', 'DangHoc', '2024-11-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0092', 'Nguyễn', 'John', '2003-04-11', 'Nam', 'nguyen.john187@ptit.edu.vn', '0911439881', '7 John Làng
Quận JohnXã, 705333', 'NGOCTRUC', 'KT', 'DangHoc', '2024-01-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0093', 'Lê', 'John', '2003-07-10', 'Nu', 'le.john962@ptit.edu.vn', '0954048961', '447 Hoàng Dãy
Huyện JaneQuận, 107590', 'NGOCTRUC', 'KT', 'DangHoc', '2020-12-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0094', 'Nguyễn', 'Jane', '2006-05-24', 'Nu', 'nguyen.jane186@ptit.edu.vn', '0903837890', '7 John Tổ
Quận JanePhường, 501874', 'NGOCTRUC', 'ATTT', 'DangHoc', '2020-01-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0095', 'Trần', 'John', '2000-10-13', 'Nu', 'tran.john699@ptit.edu.vn', '0944552988', '735 Jane Khu
JohnThị xã, 928157', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0096', 'Bùi', 'Jane', '2001-10-16', 'Nam', 'bui.jane65@ptit.edu.vn', '0905371805', '7 Jane Khu
Thành phố JanePhường, 456301', 'NGOCTRUC', 'VT', 'DangHoc', '2021-11-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0097', 'Mai', 'Jane', '2002-10-09', 'Nu', 'mai.jane100@ptit.edu.vn', '0949461693', '53 Nguyễn Khu
Thành phố JaneThị xã, 422690', 'NGOCTRUC', 'ATTT', 'DangHoc', '2021-05-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0098', 'Đặng', 'John', '2001-02-12', 'Nu', 'dang.john767@ptit.edu.vn', '0926774352', '734 Đặng Đường
JohnHuyện, 202469', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2024-11-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0099', 'Dương', 'John', '2000-09-17', 'Nu', 'duong.john794@ptit.edu.vn', '0979935537', '4 Dương Số
JohnXã, 598393', 'NGOCTRUC', 'VT', 'DangHoc', '2024-09-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0100', 'Hoàng', 'John', '2006-12-26', 'Nam', 'hoang.john451@ptit.edu.vn', '0976099147', '393 Hoàng Số
Huyện JohnPhường, 655379', 'NGOCTRUC', 'CNTT', 'DangHoc', '2023-02-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0101', 'Mai', 'Jane', '2003-01-23', 'Nu', 'mai.jane224@ptit.edu.vn', '0988939796', '181 Jane Đường
JaneThị xã, 240436', 'NGOCTRUC', 'ATTT', 'DangHoc', '2022-11-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0102', 'Vũ', 'Jane', '2003-12-18', 'Nu', 'vu.jane607@ptit.edu.vn', '0983868508', '191 John Đường
Thị xã JohnThị xã, 184128', 'NGOCTRUC', 'ATTT', 'DangHoc', '2022-12-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0103', 'Đặng', 'John', '2004-11-23', 'Nam', 'dang.john744@ptit.edu.vn', '0939654176', '519 Mai Hẻm
Thành phố JohnThị xã, 685705', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2023-02-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0104', 'Lê', 'John', '2002-08-22', 'Nu', 'le.john5@ptit.edu.vn', '0924927976', '221 Lê Số
JaneXã, 775052', 'NGOCTRUC', 'ATTT', 'DangHoc', '2021-10-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0105', 'Phạm', 'John', '2006-02-24', 'Nam', 'pham.john182@ptit.edu.vn', '0934394535', '088 John Ngõ
JanePhường, 571178', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-02-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0106', 'Mai', 'Jane', '2006-08-10', 'Nu', 'mai.jane5@ptit.edu.vn', '0958360298', '7 John Số
JaneThành phố, 194149', 'NGOCTRUC', 'VT', 'DangHoc', '2020-03-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0107', 'Đặng', 'John', '2004-01-27', 'Nu', 'dang.john547@ptit.edu.vn', '0929380754', '152 Hoàng Ngõ
Thành phố JohnXã, 809704', 'NGOCTRUC', 'ATTT', 'DangHoc', '2024-11-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0108', 'Nguyễn', 'Jane', '2006-11-12', 'Nam', 'nguyen.jane375@ptit.edu.vn', '0949287061', '43 Jane Dãy
JohnQuận, 792345', 'NGOCTRUC', 'ATTT', 'BaoLuu', '2021-04-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0109', 'Nguyễn', 'John', '2002-11-29', 'Nu', 'nguyen.john874@ptit.edu.vn', '0907027045', '86 John Hẻm
JohnThị xã, 376682', 'NGOCTRUC', 'CNTT', 'DangHoc', '2022-10-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0110', 'Đặng', 'John', '2005-05-23', 'Nam', 'dang.john673@ptit.edu.vn', '0915346302', '679 Jane Dãy
Huyện JaneThị xã, 247462', 'NGOCTRUC', 'CNTT', 'DangHoc', '2022-05-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0111', 'Hoàng', 'Jane', '2000-09-15', 'Nu', 'hoang.jane1@ptit.edu.vn', '0963691533', '502 Jane Dãy
JohnPhường, 831840', 'NGOCTRUC', 'KT', 'BaoLuu', '2024-10-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0112', 'Dương', 'Jane', '2002-03-26', 'Nam', 'duong.jane485@ptit.edu.vn', '0901934205', '4 Phạm Khu
JohnThành phố, 290201', 'NGOCTRUC', 'CNTT', 'DangHoc', '2021-04-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0113', 'Mai', 'Jane', '2000-03-26', 'Nu', 'mai.jane154@ptit.edu.vn', '0999511773', 'JohnQuận
14 John Đường, 418931', 'NGOCTRUC', 'CNTT', 'DangHoc', '2020-02-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0114', 'Dương', 'John', '2005-08-17', 'Nu', 'duong.john732@ptit.edu.vn', '0954579060', '9 Dương Số
Quận JaneXã, 979043', 'NGOCTRUC', 'KT', 'BaoLuu', '2020-03-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0115', 'Mai', 'Jane', '2006-06-19', 'Nam', 'mai.jane653@ptit.edu.vn', '0995314475', '69 Vũ Dãy
JohnThành phố, 900720', 'NGOCTRUC', 'ATTT', 'DangHoc', '2021-07-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0116', 'Vũ', 'Jane', '2000-03-22', 'Nu', 'vu.jane581@ptit.edu.vn', '0974346865', '8 Hoàng Ngõ
JohnXã, 279368', 'NGOCTRUC', 'VT', 'DangHoc', '2023-09-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0117', 'Mai', 'John', '2003-05-28', 'Nam', 'mai.john306@ptit.edu.vn', '0941761840', '650 John Số
JaneQuận, 667622', 'NGOCTRUC', 'CNTT', 'BaoLuu', '2022-08-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0118', 'Trần', 'John', '2003-08-02', 'Nu', 'tran.john197@ptit.edu.vn', '0905085791', '6 Lê Làng
JohnQuận, 524369', 'NGOCTRUC', 'KT', 'BaoLuu', '2020-02-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0119', 'Vũ', 'John', '2001-04-15', 'Nu', 'vu.john532@ptit.edu.vn', '0919183645', '06 Lê Khu
Quận JohnThị xã, 158005', 'NGOCTRUC', 'ATTT', 'DangHoc', '2022-10-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('NGOCTRUCSV0120', 'Hoàng', 'John', '2003-06-21', 'Nu', 'hoang.john920@ptit.edu.vn', '0985658500', 'JaneThành phố
72 John Tổ, 932128', 'NGOCTRUC', 'VT', 'DangHoc', '2023-06-22')
ON CONFLICT (MaSV) DO NOTHING;

-- ---- GiangVien ----
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV001', 'Nguyễn', 'John', 'ThS', NULL, 'nguyen.john271@gv.cntt-nt.ptit.edu.vn', '0966860409', 'NGOCTRUC', 'KT', 'TamNghi', '2022-09-11')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV002', 'Mai', 'John', 'PGS', NULL, 'mai.john118@gv.cntt-nt.ptit.edu.vn', '0984258640', 'NGOCTRUC', 'ATTT', 'TamNghi', '2015-02-01')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV003', 'Phạm', 'Jane', 'TS', NULL, 'pham.jane60@gv.cntt-nt.ptit.edu.vn', '0976201939', 'NGOCTRUC', 'ATTT', 'DangCongTac', '2016-04-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV004', 'Lê', 'Jane', 'ThS', NULL, 'le.jane749@gv.cntt-nt.ptit.edu.vn', '0973946191', 'NGOCTRUC', 'VT', 'DangCongTac', '2010-10-12')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV005', 'Lê', 'John', 'TS', NULL, 'le.john601@gv.cntt-nt.ptit.edu.vn', '0967327313', 'NGOCTRUC', 'CNTT', 'DangCongTac', '2015-04-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV006', 'Hoàng', 'Jane', 'ThS', 'GTV', 'hoang.jane491@gv.cntt-nt.ptit.edu.vn', '0924025776', 'NGOCTRUC', 'ATTT', 'DangCongTac', '2023-10-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV007', 'Dương', 'John', 'PGS', NULL, 'duong.john575@gv.cntt-nt.ptit.edu.vn', '0988830359', 'NGOCTRUC', 'ATTT', 'TamNghi', '2019-08-26')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV008', 'Hoàng', 'Jane', 'CN', NULL, 'hoang.jane276@gv.cntt-nt.ptit.edu.vn', '0977926535', 'NGOCTRUC', 'VT', 'DangCongTac', '2022-02-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV009', 'Dương', 'John', 'PGS', NULL, 'duong.john31@gv.cntt-nt.ptit.edu.vn', '0947953045', 'NGOCTRUC', 'KT', 'DangCongTac', '2013-10-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV010', 'Dương', 'Jane', 'PGS', NULL, 'duong.jane376@gv.cntt-nt.ptit.edu.vn', '0973565191', 'NGOCTRUC', 'KT', 'DangCongTac', '2013-09-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV011', 'Dương', 'John', 'CN', 'GTV', 'duong.john247@gv.cntt-nt.ptit.edu.vn', '0958476332', 'NGOCTRUC', 'ATTT', 'DangCongTac', '2019-07-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV012', 'Phạm', 'John', 'TS', 'PGS', 'pham.john357@gv.cntt-nt.ptit.edu.vn', '0979712341', 'NGOCTRUC', 'CNTT', 'TamNghi', '2019-03-12')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV013', 'Mai', 'John', 'TS', NULL, 'mai.john400@gv.cntt-nt.ptit.edu.vn', '0915809064', 'NGOCTRUC', 'VT', 'DangCongTac', '2011-04-01')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV014', 'Vũ', 'John', 'ThS', NULL, 'vu.john407@gv.cntt-nt.ptit.edu.vn', '0943288154', 'NGOCTRUC', 'VT', 'DangCongTac', '2022-04-02')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV015', 'Trần', 'Jane', 'PGS', 'GTV', 'tran.jane541@gv.cntt-nt.ptit.edu.vn', '0925747600', 'NGOCTRUC', 'VT', 'TamNghi', '2011-08-26')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV016', 'Phạm', 'John', 'TS', NULL, 'pham.john256@gv.cntt-nt.ptit.edu.vn', '0928900433', 'NGOCTRUC', 'KT', 'DangCongTac', '2020-07-30')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV017', 'Mai', 'John', 'PGS', 'GTV', 'mai.john858@gv.cntt-nt.ptit.edu.vn', '0968749614', 'NGOCTRUC', 'VT', 'TamNghi', '2012-04-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV018', 'Bùi', 'John', 'CN', NULL, 'bui.john18@gv.cntt-nt.ptit.edu.vn', '0937368115', 'NGOCTRUC', 'KT', 'DangCongTac', '2021-09-06')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV019', 'Lê', 'John', 'ThS', 'PGS', 'le.john256@gv.cntt-nt.ptit.edu.vn', '0958786049', 'NGOCTRUC', 'ATTT', 'TamNghi', '2015-05-20')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV020', 'Vũ', 'John', 'PGS', 'PGS', 'vu.john486@gv.cntt-nt.ptit.edu.vn', '0984788624', 'NGOCTRUC', 'ATTT', 'DangCongTac', '2011-04-25')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV021', 'Nguyễn', 'Jane', 'PGS', 'PGS', 'nguyen.jane100@gv.cntt-nt.ptit.edu.vn', '0949699582', 'NGOCTRUC', 'KT', 'TamNghi', '2023-08-30')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV022', 'Lê', 'Jane', 'ThS', NULL, 'le.jane458@gv.cntt-nt.ptit.edu.vn', '0951675784', 'NGOCTRUC', 'ATTT', 'DangCongTac', '2019-04-13')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV023', 'Mai', 'John', 'ThS', NULL, 'mai.john973@gv.cntt-nt.ptit.edu.vn', '0955243302', 'NGOCTRUC', 'KT', 'TamNghi', '2010-10-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV024', 'Hoàng', 'John', 'TS', 'GTV', 'hoang.john785@gv.cntt-nt.ptit.edu.vn', '0981926776', 'NGOCTRUC', 'VT', 'DangCongTac', '2019-11-05')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV025', 'Dương', 'John', 'TS', 'PGS', 'duong.john503@gv.cntt-nt.ptit.edu.vn', '0902122236', 'NGOCTRUC', 'VT', 'DangCongTac', '2016-01-24')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV026', 'Bùi', 'John', 'CN', 'PGS', 'bui.john830@gv.cntt-nt.ptit.edu.vn', '0917735712', 'NGOCTRUC', 'VT', 'TamNghi', '2022-04-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV027', 'Trần', 'John', 'PGS', NULL, 'tran.john591@gv.cntt-nt.ptit.edu.vn', '0998855020', 'NGOCTRUC', 'VT', 'TamNghi', '2015-11-16')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV028', 'Dương', 'John', 'PGS', NULL, 'duong.john215@gv.cntt-nt.ptit.edu.vn', '0927771227', 'NGOCTRUC', 'KT', 'TamNghi', '2023-01-29')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV029', 'Bùi', 'John', 'CN', NULL, 'bui.john848@gv.cntt-nt.ptit.edu.vn', '0908779050', 'NGOCTRUC', 'VT', 'DangCongTac', '2018-08-03')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('NGOCTRUCGV030', 'Hoàng', 'Jane', 'ThS', 'GTV', 'hoang.jane528@gv.cntt-nt.ptit.edu.vn', '0963145439', 'NGOCTRUC', 'KT', 'TamNghi', '2019-11-16')
ON CONFLICT (MaGV) DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG001', 'Phong 1', 'Toa B', 2, 120, 'MayTinh', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG002', 'Phong 2', 'Toa A', 1, 120, 'MayTinh', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG003', 'Phong 3', 'Toa C', 3, 80, 'LyThuyet', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG004', 'Phong 4', 'Toa B', 2, 120, 'ThiNghiem', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG005', 'Phong 5', 'Toa B', 4, 120, 'LyThuyet', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG006', 'Phong 6', 'Toa A', 3, 80, 'LyThuyet', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG007', 'Phong 7', 'Toa B', 2, 80, 'ThiNghiem', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG008', 'Phong 8', 'Toa B', 2, 60, 'HoiTruong', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG009', 'Phong 9', 'Toa D', 2, 60, 'HoiTruong', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG010', 'Phong 10', 'Toa D', 1, 50, 'HoiTruong', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG011', 'Phong 11', 'Toa B', 4, 50, 'LyThuyet', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG012', 'Phong 12', 'Toa A', 4, 100, 'ThiNghiem', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG013', 'Phong 13', 'Toa A', 3, 30, 'HoiTruong', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG014', 'Phong 14', 'Toa A', 5, 30, 'LyThuyet', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG015', 'Phong 15', 'Toa A', 2, 120, 'ThiNghiem', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG016', 'Phong 16', 'Toa C', 3, 30, 'MayTinh', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG017', 'Phong 17', 'Toa D', 3, 120, 'MayTinh', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG018', 'Phong 18', 'Toa D', 3, 50, 'LyThuyet', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG019', 'Phong 19', 'Toa A', 4, 80, 'ThiNghiem', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PNG020', 'Phong 20', 'Toa A', 5, 60, 'MayTinh', 'NGOCTRUC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-NGOCTRUC-01', 'CS1008', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV021', 'CS1008-01', 10, 4, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-NGOCTRUC-01', 'CS1010', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV010', 'CS1010-01', 10, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1011-NGOCTRUC-01', 'CS1011', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV007', 'CS1011-01', 12, 3, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1003-NGOCTRUC-01', 'CS1003', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV017', 'CS1003-01', 12, 6, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-NGOCTRUC-02', 'CS1010', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV028', 'CS1010-02', 12, 4, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('VT2001-NGOCTRUC-01', 'VT2001', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV024', 'VT2001-01', 60, 11, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1014-NGOCTRUC-01', 'CS1014', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV001', 'CS1014-01', 40, 20, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-NGOCTRUC-01', 'CS1012', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV014', 'CS1012-01', 30, 10, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-NGOCTRUC-01', 'CS1001', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV020', 'CS1001-01', 40, 7, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-NGOCTRUC-01', 'CS1009', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV011', 'CS1009-01', 60, 16, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-NGOCTRUC-01', 'CS1004', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV024', 'CS1004-01', 40, 20, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-NGOCTRUC-01', 'CS1002', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV006', 'CS1002-01', 40, 17, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1011-NGOCTRUC-02', 'CS1011', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV009', 'CS1011-02', 40, 0, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-NGOCTRUC-01', 'CS1015', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV028', 'CS1015-01', 40, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1007-NGOCTRUC-01', 'CS1007', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV008', 'CS1007-01', 40, 2, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-NGOCTRUC-02', 'CS1004', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV013', 'CS1004-02', 60, 3, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-NGOCTRUC-02', 'CS1012', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV028', 'CS1012-02', 50, 15, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1014-NGOCTRUC-02', 'CS1014', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV004', 'CS1014-02', 60, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-NGOCTRUC-03', 'CS1004', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV017', 'CS1004-03', 50, 7, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1005-NGOCTRUC-01', 'CS1005', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV005', 'CS1005-01', 60, 8, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-NGOCTRUC-03', 'CS1012', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV030', 'CS1012-03', 30, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-NGOCTRUC-01', 'CS1013', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV013', 'CS1013-01', 30, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-NGOCTRUC-04', 'CS1012', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV019', 'CS1012-04', 40, 12, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-NGOCTRUC-02', 'CS1001', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV019', 'CS1001-02', 60, 16, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-NGOCTRUC-04', 'CS1004', 'HK20251', 'NGOCTRUC', 'NGOCTRUCGV024', 'CS1004-04', 30, 10, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;

-- ---- LichHoc ----
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0001', 'CS1008-NGOCTRUC-01', 'PNG019', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0002', 'CS1008-NGOCTRUC-01', 'PNG001', 3, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0003', 'CS1008-NGOCTRUC-01', 'PNG004', 4, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0004', 'CS1010-NGOCTRUC-01', 'PNG013', 3, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0005', 'CS1010-NGOCTRUC-01', 'PNG004', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0006', 'CS1011-NGOCTRUC-01', 'PNG017', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0007', 'CS1011-NGOCTRUC-01', 'PNG016', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0008', 'CS1011-NGOCTRUC-01', 'PNG011', 2, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0009', 'CS1003-NGOCTRUC-01', 'PNG001', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0010', 'CS1003-NGOCTRUC-01', 'PNG016', 5, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0011', 'CS1003-NGOCTRUC-01', 'PNG009', 7, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0012', 'CS1010-NGOCTRUC-02', 'PNG015', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0013', 'CS1010-NGOCTRUC-02', 'PNG002', 6, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0014', 'VT2001-NGOCTRUC-01', 'PNG004', 3, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0015', 'VT2001-NGOCTRUC-01', 'PNG018', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0016', 'VT2001-NGOCTRUC-01', 'PNG018', 5, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0017', 'CS1014-NGOCTRUC-01', 'PNG007', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0018', 'CS1014-NGOCTRUC-01', 'PNG009', 3, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0019', 'CS1012-NGOCTRUC-01', 'PNG009', 7, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0020', 'CS1012-NGOCTRUC-01', 'PNG010', 3, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0021', 'CS1012-NGOCTRUC-01', 'PNG014', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0022', 'CS1001-NGOCTRUC-01', 'PNG015', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0023', 'CS1001-NGOCTRUC-01', 'PNG012', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0024', 'CS1001-NGOCTRUC-01', 'PNG006', 7, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0025', 'CS1009-NGOCTRUC-01', 'PNG015', 2, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0026', 'CS1009-NGOCTRUC-01', 'PNG001', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0027', 'CS1004-NGOCTRUC-01', 'PNG017', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0028', 'CS1004-NGOCTRUC-01', 'PNG006', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0029', 'CS1004-NGOCTRUC-01', 'PNG006', 4, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0030', 'CS1002-NGOCTRUC-01', 'PNG003', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0031', 'CS1002-NGOCTRUC-01', 'PNG020', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0032', 'CS1002-NGOCTRUC-01', 'PNG015', 3, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0033', 'CS1011-NGOCTRUC-02', 'PNG020', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0034', 'CS1011-NGOCTRUC-02', 'PNG005', 2, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0035', 'CS1015-NGOCTRUC-01', 'PNG009', 5, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0036', 'CS1015-NGOCTRUC-01', 'PNG017', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0037', 'CS1015-NGOCTRUC-01', 'PNG015', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0038', 'CS1007-NGOCTRUC-01', 'PNG013', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0039', 'CS1007-NGOCTRUC-01', 'PNG007', 2, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0040', 'CS1007-NGOCTRUC-01', 'PNG017', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0041', 'CS1004-NGOCTRUC-02', 'PNG009', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0042', 'CS1004-NGOCTRUC-02', 'PNG014', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0043', 'CS1012-NGOCTRUC-02', 'PNG002', 6, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0044', 'CS1012-NGOCTRUC-02', 'PNG016', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0045', 'CS1014-NGOCTRUC-02', 'PNG012', 7, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0046', 'CS1014-NGOCTRUC-02', 'PNG011', 6, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0047', 'CS1014-NGOCTRUC-02', 'PNG005', 6, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0048', 'CS1004-NGOCTRUC-03', 'PNG011', 7, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0049', 'CS1004-NGOCTRUC-03', 'PNG004', 7, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0050', 'CS1005-NGOCTRUC-01', 'PNG008', 6, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0051', 'CS1005-NGOCTRUC-01', 'PNG005', 5, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0052', 'CS1012-NGOCTRUC-03', 'PNG012', 7, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0053', 'CS1012-NGOCTRUC-03', 'PNG010', 2, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0054', 'CS1012-NGOCTRUC-03', 'PNG011', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0055', 'CS1013-NGOCTRUC-01', 'PNG012', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0056', 'CS1013-NGOCTRUC-01', 'PNG003', 3, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0057', 'CS1012-NGOCTRUC-04', 'PNG013', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0058', 'CS1012-NGOCTRUC-04', 'PNG013', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0059', 'CS1001-NGOCTRUC-02', 'PNG001', 4, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0060', 'CS1001-NGOCTRUC-02', 'PNG001', 3, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0061', 'CS1001-NGOCTRUC-02', 'PNG010', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0062', 'CS1004-NGOCTRUC-04', 'PNG003', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0063', 'CS1004-NGOCTRUC-04', 'PNG017', 2, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LNG0064', 'CS1004-NGOCTRUC-04', 'PNG007', 6, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
