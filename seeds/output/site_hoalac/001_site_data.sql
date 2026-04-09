-- ============================================================
-- DỮ LIỆU CỤC BỘ - Site HOALAC (Cơ sở Hòa Lạc)
-- Sinh: 2026-04-10 00:43:10
-- ============================================================

-- ---- SinhVien ----
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0001', 'Lưu', 'Loan', '2001-04-12', 'Nam', 'luu.loan706@ptit.edu.vn', '0932234117', 'Quảng Nam', 'HOALAC', 'ATTT', 'DangHoc', '2022-03-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0002', 'Cao', 'Liên', '2001-10-27', 'Nu', 'cao.lien292@ptit.edu.vn', '0977867776', 'Hải Phòng', 'HOALAC', 'KT', 'DangHoc', '2024-11-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0003', 'Trần', 'Hoàng', '2004-01-31', 'Nu', 'tran.hoang668@ptit.edu.vn', '0934097347', 'Bình Thuận', 'HOALAC', 'ATTT', 'DangHoc', '2023-07-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0004', 'Lưu', 'Khánh', '2003-03-02', 'Nu', 'luu.khanh323@ptit.edu.vn', '0933802872', 'Vĩnh Phúc', 'HOALAC', 'CNTT', 'BaoLuu', '2023-01-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0005', 'Lê', 'Tâm', '2003-02-26', 'Nu', 'le.tam953@ptit.edu.vn', '0949163022', 'Ninh Bình', 'HOALAC', 'KT', 'DangHoc', '2021-01-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0006', 'Dương', 'Dũng', '2002-11-12', 'Nam', 'duong.dung441@ptit.edu.vn', '0901379958', 'Thanh Hóa', 'HOALAC', 'KT', 'DangHoc', '2022-09-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0007', 'Ngô', 'Lâm', '2006-03-21', 'Nu', 'ngo.lam224@ptit.edu.vn', '0974658175', 'Hưng Yên', 'HOALAC', 'CNTT', 'DangHoc', '2021-09-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0008', 'Nguyễn', 'Trung', '2003-12-03', 'Nu', 'nguyen.trung300@ptit.edu.vn', '0967080592', 'Ninh Thuận', 'HOALAC', 'VT', 'DangHoc', '2021-07-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0009', 'Đặng', 'Hạnh', '2000-02-15', 'Nam', 'dang.hanh409@ptit.edu.vn', '0973600321', 'Hải Phòng', 'HOALAC', 'VT', 'DangHoc', '2021-01-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0010', 'Trịnh', 'Hiền', '2002-06-30', 'Nam', 'trinh.hien817@ptit.edu.vn', '0967950498', 'Thanh Hóa', 'HOALAC', 'KT', 'DangHoc', '2023-03-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0011', 'Trần', 'Trung', '2003-05-03', 'Nu', 'tran.trung333@ptit.edu.vn', '0929289999', 'Nghệ An', 'HOALAC', 'VT', 'DangHoc', '2020-09-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0012', 'Phạm', 'Lam', '2005-08-18', 'Nam', 'pham.lam501@ptit.edu.vn', '0924253813', 'Hải Dương', 'HOALAC', 'ATTT', 'DangHoc', '2020-02-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0013', 'Mạc', 'Sơn', '2006-10-28', 'Nam', 'mac.son737@ptit.edu.vn', '0997225205', 'Quảng Ngãi', 'HOALAC', 'ATTT', 'DangHoc', '2022-07-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0014', 'Mạc', 'Toàn', '2005-05-09', 'Nu', 'mac.toan157@ptit.edu.vn', '0921303830', 'Hà Tĩnh', 'HOALAC', 'ATTT', 'DangHoc', '2021-06-28')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0015', 'Đinh', 'Lâm', '2005-04-09', 'Nu', 'dinh.lam645@ptit.edu.vn', '0941620015', 'Quảng Bình', 'HOALAC', 'VT', 'DangHoc', '2022-03-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0016', 'Phạm', 'Thanh', '2002-04-18', 'Nu', 'pham.thanh987@ptit.edu.vn', '0942520397', 'Hải Dương', 'HOALAC', 'KT', 'BaoLuu', '2024-04-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0017', 'Đinh', 'Bình', '2003-10-25', 'Nu', 'dinh.binh326@ptit.edu.vn', '0924566446', 'Bình Định', 'HOALAC', 'CNTT', 'DangHoc', '2020-03-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0018', 'Cao', 'Oanh', '2006-02-28', 'Nu', 'cao.oanh270@ptit.edu.vn', '0916931261', 'Thừa Thiên Huế', 'HOALAC', 'KT', 'DangHoc', '2020-11-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0019', 'Mạc', 'Tuấn', '2003-06-27', 'Nam', 'mac.tuan8@ptit.edu.vn', '0907337921', 'Thanh Hóa', 'HOALAC', 'CNTT', 'BaoLuu', '2021-05-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0020', 'Mạc', 'Thanh', '2002-03-12', 'Nu', 'mac.thanh754@ptit.edu.vn', '0935682524', 'Quảng Trị', 'HOALAC', 'CNTT', 'DangHoc', '2022-07-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0021', 'Đinh', 'Thanh', '2000-02-24', 'Nu', 'dinh.thanh221@ptit.edu.vn', '0927280870', 'Hưng Yên', 'HOALAC', 'CNTT', 'DangHoc', '2023-06-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0022', 'Phan', 'Quang', '2005-03-17', 'Nu', 'phan.quang42@ptit.edu.vn', '0914717860', 'Hải Dương', 'HOALAC', 'CNTT', 'DangHoc', '2020-11-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0023', 'Tạ', 'Thi', '2003-04-14', 'Nam', 'ta.thi788@ptit.edu.vn', '0958817639', 'Thừa Thiên Huế', 'HOALAC', 'KT', 'BaoLuu', '2024-11-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0024', 'Ngô', 'Tiến', '2005-12-01', 'Nu', 'ngo.tien924@ptit.edu.vn', '0922278926', 'Hưng Yên', 'HOALAC', 'KT', 'BaoLuu', '2022-11-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0025', 'Phan', 'Vân', '2005-02-07', 'Nu', 'phan.van867@ptit.edu.vn', '0991713616', 'Ninh Bình', 'HOALAC', 'VT', 'DangHoc', '2022-10-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0026', 'Lưu', 'Loan', '2002-03-28', 'Nu', 'luu.loan925@ptit.edu.vn', '0973138982', 'Hà Tĩnh', 'HOALAC', 'ATTT', 'BaoLuu', '2024-02-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0027', 'Lê', 'Sang', '2002-05-05', 'Nam', 'le.sang540@ptit.edu.vn', '0958278813', 'Thừa Thiên Huế', 'HOALAC', 'VT', 'BaoLuu', '2021-03-05')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0028', 'Trần', 'Phong', '2003-08-23', 'Nam', 'tran.phong172@ptit.edu.vn', '0932378541', 'Quảng Ngãi', 'HOALAC', 'CNTT', 'DangHoc', '2024-02-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0029', 'Lê', 'Thúy', '2000-08-30', 'Nu', 'le.thuy476@ptit.edu.vn', '0997589160', 'Thừa Thiên Huế', 'HOALAC', 'KT', 'DangHoc', '2024-04-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0030', 'Trịnh', 'Lan', '2005-09-17', 'Nam', 'trinh.lan998@ptit.edu.vn', '0967233814', 'Quảng Nam', 'HOALAC', 'VT', 'DangHoc', '2024-09-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0031', 'Đỗ', 'Bình', '2005-06-04', 'Nam', 'do.binh636@ptit.edu.vn', '0979598217', 'Bình Định', 'HOALAC', 'CNTT', 'DangHoc', '2021-01-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0032', 'Ngô', 'Anh', '2006-02-15', 'Nu', 'ngo.anh357@ptit.edu.vn', '0953223700', 'Nghệ An', 'HOALAC', 'CNTT', 'BaoLuu', '2022-06-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0033', 'Trương', 'Oanh', '2001-04-18', 'Nam', 'truong.oanh20@ptit.edu.vn', '0954328502', 'Hải Phòng', 'HOALAC', 'ATTT', 'DangHoc', '2021-12-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0034', 'Vương', 'Thúy', '2000-07-15', 'Nam', 'vuong.thuy465@ptit.edu.vn', '0969099033', 'Hải Dương', 'HOALAC', 'CNTT', 'DangHoc', '2024-11-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0035', 'Phan', 'Oanh', '2003-07-05', 'Nu', 'phan.oanh810@ptit.edu.vn', '0905273478', 'Thái Bình', 'HOALAC', 'KT', 'DangHoc', '2024-09-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0036', 'Cao', 'Anh', '2005-09-23', 'Nam', 'cao.anh731@ptit.edu.vn', '0926648484', 'Hưng Yên', 'HOALAC', 'VT', 'DangHoc', '2021-12-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0037', 'Phan', 'Trọng', '2001-08-17', 'Nu', 'phan.trong518@ptit.edu.vn', '0929419866', 'Hải Dương', 'HOALAC', 'VT', 'DangHoc', '2020-01-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0038', 'Phan', 'Minh', '2004-01-09', 'Nam', 'phan.minh942@ptit.edu.vn', '0961082775', 'Quảng Bình', 'HOALAC', 'CNTT', 'DangHoc', '2022-09-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0039', 'Hồ', 'Lam', '2001-09-03', 'Nu', 'ho.lam445@ptit.edu.vn', '0918349312', 'Hưng Yên', 'HOALAC', 'KT', 'DangHoc', '2023-06-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0040', 'Hoàng', 'Nghĩa', '2001-06-23', 'Nam', 'hoang.nghia58@ptit.edu.vn', '0938830734', 'Bình Thuận', 'HOALAC', 'ATTT', 'DangHoc', '2021-04-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0041', 'Tạ', 'Hương', '2003-01-05', 'Nam', 'ta.huong585@ptit.edu.vn', '0964327092', 'Vĩnh Phúc', 'HOALAC', 'KT', 'DangHoc', '2024-03-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0042', 'Lý', 'Em', '2005-06-08', 'Nu', 'ly.em228@ptit.edu.vn', '0928141242', 'Hải Dương', 'HOALAC', 'ATTT', 'DangHoc', '2023-07-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0043', 'Lý', 'Thịnh', '2000-04-07', 'Nam', 'ly.thinh990@ptit.edu.vn', '0973569520', 'Thừa Thiên Huế', 'HOALAC', 'VT', 'DangHoc', '2023-03-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0044', 'Đỗ', 'Huy', '2005-05-29', 'Nu', 'do.huy660@ptit.edu.vn', '0937907086', 'Thái Bình', 'HOALAC', 'KT', 'DangHoc', '2020-06-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0045', 'Trần', 'Trung', '2006-11-22', 'Nam', 'tran.trung235@ptit.edu.vn', '0945046551', 'Quảng Ngãi', 'HOALAC', 'ATTT', 'BaoLuu', '2022-02-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0046', 'Lê', 'Em', '2002-01-14', 'Nu', 'le.em48@ptit.edu.vn', '0958367846', 'Bình Định', 'HOALAC', 'CNTT', 'DangHoc', '2022-02-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0047', 'Đỗ', 'Hà', '2001-11-28', 'Nam', 'do.ha527@ptit.edu.vn', '0933670193', 'Quảng Trị', 'HOALAC', 'ATTT', 'DangHoc', '2020-11-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0048', 'Trần', 'Thi', '2002-09-29', 'Nu', 'tran.thi939@ptit.edu.vn', '0969124227', 'Nam Định', 'HOALAC', 'VT', 'BaoLuu', '2021-12-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0049', 'Lê', 'Hoàng', '2006-03-28', 'Nu', 'le.hoang510@ptit.edu.vn', '0947202523', 'Khánh Hòa', 'HOALAC', 'CNTT', 'DangHoc', '2024-11-10')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0050', 'Hoàng', 'Bình', '2003-09-29', 'Nam', 'hoang.binh715@ptit.edu.vn', '0963953755', 'Nam Định', 'HOALAC', 'ATTT', 'BaoLuu', '2021-12-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0051', 'Hoàng', 'Sang', '2001-04-01', 'Nu', 'hoang.sang529@ptit.edu.vn', '0946281099', 'Vĩnh Phúc', 'HOALAC', 'KT', 'BaoLuu', '2023-03-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0052', 'Ngô', 'Tiến', '2003-01-30', 'Nam', 'ngo.tien821@ptit.edu.vn', '0969324123', 'Quảng Ngãi', 'HOALAC', 'CNTT', 'BaoLuu', '2023-01-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0053', 'Đinh', 'Mai', '2005-01-03', 'Nam', 'dinh.mai668@ptit.edu.vn', '0941477033', 'Đà Nẵng', 'HOALAC', 'VT', 'DangHoc', '2021-06-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0054', 'Ngô', 'Bích', '2005-05-26', 'Nam', 'ngo.bich958@ptit.edu.vn', '0954754735', 'Thừa Thiên Huế', 'HOALAC', 'VT', 'DangHoc', '2024-03-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0055', 'Trương', 'Dung', '2003-11-05', 'Nam', 'truong.dung387@ptit.edu.vn', '0991959926', 'Quảng Trị', 'HOALAC', 'KT', 'DangHoc', '2022-01-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0056', 'Ngô', 'Quang', '2005-05-16', 'Nu', 'ngo.quang170@ptit.edu.vn', '0976481253', 'Hải Dương', 'HOALAC', 'CNTT', 'DangHoc', '2021-10-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0057', 'Huỳnh', 'Minh', '2003-03-18', 'Nam', 'huynh.minh319@ptit.edu.vn', '0994707249', 'Đà Nẵng', 'HOALAC', 'CNTT', 'BaoLuu', '2020-01-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0058', 'Đỗ', 'Hùng', '2005-08-30', 'Nam', 'do.hung192@ptit.edu.vn', '0911995370', 'Thừa Thiên Huế', 'HOALAC', 'ATTT', 'DangHoc', '2023-03-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0059', 'Lý', 'Lam', '2002-12-26', 'Nu', 'ly.lam251@ptit.edu.vn', '0969897985', 'Vĩnh Phúc', 'HOALAC', 'ATTT', 'DangHoc', '2020-02-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0060', 'Phan', 'Giang', '2000-10-26', 'Nam', 'phan.giang818@ptit.edu.vn', '0904088244', 'Phú Yên', 'HOALAC', 'CNTT', 'DangHoc', '2024-01-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0061', 'Mạc', 'Sang', '2005-05-15', 'Nu', 'mac.sang56@ptit.edu.vn', '0923611505', 'Nam Định', 'HOALAC', 'CNTT', 'BaoLuu', '2020-06-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0062', 'Cao', 'Toàn', '2000-07-29', 'Nam', 'cao.toan683@ptit.edu.vn', '0938568315', 'Nghệ An', 'HOALAC', 'CNTT', 'DangHoc', '2021-04-22')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0063', 'Đặng', 'Bảo', '2003-02-18', 'Nu', 'dang.bao184@ptit.edu.vn', '0969983269', 'Quảng Trị', 'HOALAC', 'CNTT', 'DangHoc', '2021-03-23')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0064', 'Lý', 'Tâm', '2000-12-25', 'Nam', 'ly.tam906@ptit.edu.vn', '0981431441', 'Hải Dương', 'HOALAC', 'CNTT', 'DangHoc', '2021-08-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0065', 'Nguyễn', 'Vinh', '2000-01-11', 'Nu', 'nguyen.vinh777@ptit.edu.vn', '0922696088', 'Hà Tĩnh', 'HOALAC', 'KT', 'DangHoc', '2022-12-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0066', 'Trần', 'Hạnh', '2000-11-15', 'Nam', 'tran.hanh144@ptit.edu.vn', '0981488211', 'Bình Thuận', 'HOALAC', 'CNTT', 'BaoLuu', '2021-12-20')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0067', 'Hồ', 'Nghĩa', '2001-04-18', 'Nam', 'ho.nghia690@ptit.edu.vn', '0989811491', 'Bình Thuận', 'HOALAC', 'ATTT', 'DangHoc', '2022-01-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0068', 'Hồ', 'An', '2005-07-05', 'Nu', 'ho.an36@ptit.edu.vn', '0963009507', 'Thanh Hóa', 'HOALAC', 'ATTT', 'DangHoc', '2024-07-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0069', 'Đinh', 'Lan', '2005-12-22', 'Nu', 'dinh.lan108@ptit.edu.vn', '0951224190', 'Ninh Bình', 'HOALAC', 'KT', 'DangHoc', '2022-03-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0070', 'Ngô', 'Toàn', '2003-10-03', 'Nu', 'ngo.toan175@ptit.edu.vn', '0913820634', 'Nghệ An', 'HOALAC', 'CNTT', 'DangHoc', '2022-07-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0071', 'Đặng', 'An', '2005-02-24', 'Nu', 'dang.an301@ptit.edu.vn', '0979405531', 'Hà Nội', 'HOALAC', 'VT', 'DangHoc', '2021-09-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0072', 'Hồ', 'Trung', '2002-08-09', 'Nu', 'ho.trung266@ptit.edu.vn', '0989155319', 'Thanh Hóa', 'HOALAC', 'VT', 'BaoLuu', '2023-06-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0073', 'Trương', 'Nam', '2003-05-25', 'Nam', 'truong.nam311@ptit.edu.vn', '0977421335', 'Hải Phòng', 'HOALAC', 'ATTT', 'BaoLuu', '2020-08-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0074', 'Trương', 'Oanh', '2006-10-18', 'Nu', 'truong.oanh621@ptit.edu.vn', '0969995441', 'Hải Phòng', 'HOALAC', 'KT', 'DangHoc', '2021-12-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0075', 'Huỳnh', 'Thịnh', '2004-09-15', 'Nu', 'huynh.thinh763@ptit.edu.vn', '0933169761', 'Quảng Ngãi', 'HOALAC', 'CNTT', 'BaoLuu', '2020-11-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0076', 'Dương', 'An', '2005-08-14', 'Nu', 'duong.an993@ptit.edu.vn', '0937885149', 'Ninh Bình', 'HOALAC', 'KT', 'BaoLuu', '2024-07-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0077', 'Đinh', 'Mai', '2000-07-18', 'Nu', 'dinh.mai71@ptit.edu.vn', '0944307256', 'Vĩnh Phúc', 'HOALAC', 'CNTT', 'DangHoc', '2023-11-06')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0078', 'Hoàng', 'Liên', '2001-07-29', 'Nam', 'hoang.lien401@ptit.edu.vn', '0926679328', 'Thừa Thiên Huế', 'HOALAC', 'KT', 'DangHoc', '2021-03-17')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0079', 'Đỗ', 'Quỳnh', '2000-11-02', 'Nam', 'do.quynh922@ptit.edu.vn', '0971955367', 'Quảng Bình', 'HOALAC', 'VT', 'DangHoc', '2020-02-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0080', 'Phan', 'Dũng', '2005-04-15', 'Nam', 'phan.dung567@ptit.edu.vn', '0996424539', 'Hà Nội', 'HOALAC', 'ATTT', 'DangHoc', '2023-10-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0081', 'Ngô', 'Thịnh', '2005-08-21', 'Nam', 'ngo.thinh145@ptit.edu.vn', '0916563281', 'Phú Yên', 'HOALAC', 'VT', 'DangHoc', '2020-03-29')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0082', 'Tạ', 'Ly', '2004-07-04', 'Nu', 'ta.ly104@ptit.edu.vn', '0943934413', 'Nam Định', 'HOALAC', 'VT', 'DangHoc', '2023-11-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0083', 'Mạc', 'Châu', '2002-01-22', 'Nu', 'mac.chau411@ptit.edu.vn', '0943954967', 'Bình Thuận', 'HOALAC', 'VT', 'DangHoc', '2022-08-12')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0084', 'Dương', 'Huy', '2005-09-26', 'Nam', 'duong.huy253@ptit.edu.vn', '0903507571', 'Thừa Thiên Huế', 'HOALAC', 'CNTT', 'DangHoc', '2024-09-01')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0085', 'Phạm', 'Nam', '2003-07-11', 'Nu', 'pham.nam647@ptit.edu.vn', '0917087170', 'Bình Thuận', 'HOALAC', 'KT', 'DangHoc', '2023-04-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0086', 'Đinh', 'Ly', '2005-03-02', 'Nu', 'dinh.ly744@ptit.edu.vn', '0925846038', 'Ninh Bình', 'HOALAC', 'VT', 'DangHoc', '2021-06-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0087', 'Hoàng', 'Lam', '2004-01-04', 'Nam', 'hoang.lam231@ptit.edu.vn', '0967852189', 'Bắc Ninh', 'HOALAC', 'CNTT', 'DangHoc', '2021-08-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0088', 'Dương', 'Huy', '2005-01-17', 'Nu', 'duong.huy779@ptit.edu.vn', '0914582479', 'Ninh Thuận', 'HOALAC', 'VT', 'DangHoc', '2024-09-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0089', 'Cao', 'Giang', '2002-01-23', 'Nam', 'cao.giang741@ptit.edu.vn', '0936378052', 'Quảng Bình', 'HOALAC', 'KT', 'DangHoc', '2020-05-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0090', 'Lê', 'Châu', '2002-05-13', 'Nam', 'le.chau304@ptit.edu.vn', '0906632865', 'Nghệ An', 'HOALAC', 'KT', 'BaoLuu', '2020-04-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0091', 'Lê', 'Phát', '2002-12-14', 'Nam', 'le.phat444@ptit.edu.vn', '0935193085', 'Hưng Yên', 'HOALAC', 'ATTT', 'DangHoc', '2023-07-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0092', 'Hoàng', 'Bình', '2000-10-27', 'Nu', 'hoang.binh562@ptit.edu.vn', '0979012788', 'Ninh Thuận', 'HOALAC', 'CNTT', 'DangHoc', '2020-01-15')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0093', 'Đỗ', 'Lan', '2004-08-05', 'Nu', 'do.lan665@ptit.edu.vn', '0979226494', 'Ninh Thuận', 'HOALAC', 'CNTT', 'DangHoc', '2021-10-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0094', 'Lý', 'Phong', '2006-08-24', 'Nu', 'ly.phong808@ptit.edu.vn', '0944449453', 'Quảng Ngãi', 'HOALAC', 'ATTT', 'DangHoc', '2020-01-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0095', 'Lý', 'Nga', '2006-01-30', 'Nam', 'ly.nga852@ptit.edu.vn', '0988490753', 'Quảng Nam', 'HOALAC', 'CNTT', 'DangHoc', '2023-08-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0096', 'Trần', 'Bảo', '2000-06-17', 'Nam', 'tran.bao471@ptit.edu.vn', '0921292010', 'Thanh Hóa', 'HOALAC', 'CNTT', 'DangHoc', '2022-10-14')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0097', 'Huỳnh', 'Hùng', '2004-05-16', 'Nam', 'huynh.hung66@ptit.edu.vn', '0925162418', 'Phú Yên', 'HOALAC', 'VT', 'BaoLuu', '2020-06-04')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0098', 'Nguyễn', 'Dũng', '2000-02-16', 'Nu', 'nguyen.dung216@ptit.edu.vn', '0903607797', 'Bình Định', 'HOALAC', 'VT', 'BaoLuu', '2020-01-31')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0099', 'Nguyễn', 'Việt', '2001-05-21', 'Nam', 'nguyen.viet743@ptit.edu.vn', '0965189344', 'Quảng Bình', 'HOALAC', 'VT', 'DangHoc', '2021-02-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0100', 'Huỳnh', 'Ngọc', '2005-02-06', 'Nam', 'huynh.ngoc180@ptit.edu.vn', '0987243120', 'Quảng Ngãi', 'HOALAC', 'CNTT', 'DangHoc', '2022-04-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0101', 'Lý', 'Trí', '2004-05-18', 'Nam', 'ly.tri592@ptit.edu.vn', '0977316785', 'Bình Thuận', 'HOALAC', 'KT', 'DangHoc', '2022-01-25')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0102', 'Ngô', 'Huy', '2006-11-14', 'Nam', 'ngo.huy335@ptit.edu.vn', '0945989443', 'Quảng Trị', 'HOALAC', 'VT', 'BaoLuu', '2024-11-18')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0103', 'Phạm', 'Hiền', '2002-08-27', 'Nu', 'pham.hien403@ptit.edu.vn', '0965828490', 'Thái Bình', 'HOALAC', 'KT', 'DangHoc', '2021-06-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0104', 'Lý', 'Giang', '2001-12-27', 'Nu', 'ly.giang67@ptit.edu.vn', '0961655668', 'Quảng Trị', 'HOALAC', 'CNTT', 'DangHoc', '2024-08-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0105', 'Phan', 'Vinh', '2005-01-14', 'Nu', 'phan.vinh106@ptit.edu.vn', '0924820611', 'Thừa Thiên Huế', 'HOALAC', 'VT', 'DangHoc', '2021-10-09')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0106', 'Đỗ', 'Sang', '2000-08-16', 'Nu', 'do.sang557@ptit.edu.vn', '0957687561', 'Phú Yên', 'HOALAC', 'KT', 'BaoLuu', '2021-03-26')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0107', 'Huỳnh', 'Trung', '2006-08-21', 'Nu', 'huynh.trung378@ptit.edu.vn', '0982402687', 'Vĩnh Phúc', 'HOALAC', 'ATTT', 'BaoLuu', '2020-02-21')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0108', 'Huỳnh', 'Oanh', '2005-06-04', 'Nu', 'huynh.oanh131@ptit.edu.vn', '0978344841', 'Vĩnh Phúc', 'HOALAC', 'KT', 'BaoLuu', '2020-11-08')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0109', 'Trương', 'Quỳnh', '2004-03-04', 'Nam', 'truong.quynh92@ptit.edu.vn', '0959969665', 'Hà Tĩnh', 'HOALAC', 'KT', 'DangHoc', '2021-02-02')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0110', 'Huỳnh', 'An', '2006-04-22', 'Nam', 'huynh.an932@ptit.edu.vn', '0992287520', 'Thanh Hóa', 'HOALAC', 'ATTT', 'DangHoc', '2022-05-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0111', 'Vương', 'Vân', '2006-04-01', 'Nam', 'vuong.van661@ptit.edu.vn', '0903881031', 'Bắc Ninh', 'HOALAC', 'VT', 'BaoLuu', '2024-09-27')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0112', 'Lý', 'Vân', '2005-12-18', 'Nu', 'ly.van834@ptit.edu.vn', '0984835788', 'Đà Nẵng', 'HOALAC', 'ATTT', 'BaoLuu', '2021-11-07')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0113', 'Mạc', 'Hoàng', '2005-04-26', 'Nu', 'mac.hoang42@ptit.edu.vn', '0985531891', 'Thanh Hóa', 'HOALAC', 'VT', 'DangHoc', '2022-07-24')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0114', 'Trương', 'Sơn', '2001-11-17', 'Nam', 'truong.son870@ptit.edu.vn', '0998950285', 'Bắc Ninh', 'HOALAC', 'CNTT', 'DangHoc', '2022-10-13')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0115', 'Phạm', 'Hoàng', '2005-02-26', 'Nam', 'pham.hoang944@ptit.edu.vn', '0977702796', 'Hà Nội', 'HOALAC', 'ATTT', 'BaoLuu', '2024-04-03')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0116', 'Trịnh', 'Thịnh', '2006-07-22', 'Nam', 'trinh.thinh875@ptit.edu.vn', '0978832065', 'Hà Nội', 'HOALAC', 'KT', 'DangHoc', '2022-07-19')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0117', 'Nguyễn', 'Thanh', '2001-04-28', 'Nam', 'nguyen.thanh668@ptit.edu.vn', '0912326745', 'Bắc Ninh', 'HOALAC', 'CNTT', 'DangHoc', '2020-02-11')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0118', 'Trương', 'Thu', '2002-10-07', 'Nu', 'truong.thu963@ptit.edu.vn', '0912955917', 'Khánh Hòa', 'HOALAC', 'ATTT', 'DangHoc', '2020-08-30')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0119', 'Lê', 'Anh', '2002-07-19', 'Nam', 'le.anh856@ptit.edu.vn', '0939359691', 'Ninh Thuận', 'HOALAC', 'ATTT', 'DangHoc', '2022-03-16')
ON CONFLICT (MaSV) DO NOTHING;
INSERT INTO SinhVien (MaSV, Ho, Ten, NgaySinh, GioiTinh, Email, SoDienThoai, DiaChi, MaCoSo, MaKhoa, TrangThai, NgayNhapHoc)
VALUES ('HOALACSV0120', 'Đinh', 'Vân', '2006-07-28', 'Nam', 'dinh.van876@ptit.edu.vn', '0964729799', 'Quảng Ngãi', 'HOALAC', 'VT', 'DangHoc', '2024-11-04')
ON CONFLICT (MaSV) DO NOTHING;

-- ---- GiangVien ----
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV001', 'Cao', 'Vinh', 'ThS', NULL, 'cao.vinh255@gv.cntt-hl.ptit.edu.vn', '0997065094', 'HOALAC', 'VT', 'DangCongTac', '2017-04-19')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV002', 'Vương', 'Cường', 'PGS', NULL, 'vuong.cuong913@gv.cntt-hl.ptit.edu.vn', '0987903002', 'HOALAC', 'CNTT', 'TamNghi', '2016-11-02')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV003', 'Trương', 'Yến', 'TS', 'PGS', 'truong.yen853@gv.cntt-hl.ptit.edu.vn', '0945029178', 'HOALAC', 'KT', 'DangCongTac', '2015-11-23')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV004', 'Nguyễn', 'Thi', 'CN', NULL, 'nguyen.thi196@gv.cntt-hl.ptit.edu.vn', '0991906197', 'HOALAC', 'KT', 'TamNghi', '2013-03-25')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV005', 'Đỗ', 'Dung', 'ThS', 'GTV', 'do.dung454@gv.cntt-hl.ptit.edu.vn', '0972489358', 'HOALAC', 'ATTT', 'TamNghi', '2013-11-02')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV006', 'Phạm', 'Oanh', 'PGS', NULL, 'pham.oanh905@gv.cntt-hl.ptit.edu.vn', '0942977463', 'HOALAC', 'CNTT', 'DangCongTac', '2022-06-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV007', 'Lưu', 'Hiền', 'CN', NULL, 'luu.hien616@gv.cntt-hl.ptit.edu.vn', '0908512602', 'HOALAC', 'VT', 'TamNghi', '2011-04-04')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV008', 'Nguyễn', 'Sơn', 'TS', NULL, 'nguyen.son207@gv.cntt-hl.ptit.edu.vn', '0956646701', 'HOALAC', 'KT', 'DangCongTac', '2013-08-22')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV009', 'Hoàng', 'Thắm', 'ThS', NULL, 'hoang.tham749@gv.cntt-hl.ptit.edu.vn', '0981719883', 'HOALAC', 'ATTT', 'DangCongTac', '2016-01-28')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV010', 'Hồ', 'Thảo', 'CN', 'GTV', 'ho.thao318@gv.cntt-hl.ptit.edu.vn', '0923675394', 'HOALAC', 'ATTT', 'TamNghi', '2023-07-09')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV011', 'Trịnh', 'Cường', 'CN', NULL, 'trinh.cuong68@gv.cntt-hl.ptit.edu.vn', '0964360388', 'HOALAC', 'ATTT', 'DangCongTac', '2017-03-05')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV012', 'Phạm', 'Thắm', 'ThS', NULL, 'pham.tham724@gv.cntt-hl.ptit.edu.vn', '0921230545', 'HOALAC', 'CNTT', 'DangCongTac', '2023-08-12')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV013', 'Đỗ', 'Hà', 'ThS', 'GTV', 'do.ha789@gv.cntt-hl.ptit.edu.vn', '0909368502', 'HOALAC', 'VT', 'DangCongTac', '2022-07-06')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV014', 'Tạ', 'Huy', 'ThS', 'PGS', 'ta.huy967@gv.cntt-hl.ptit.edu.vn', '0998020038', 'HOALAC', 'KT', 'DangCongTac', '2021-02-05')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV015', 'Phạm', 'Ngọc', 'CN', 'GTV', 'pham.ngoc610@gv.cntt-hl.ptit.edu.vn', '0982376645', 'HOALAC', 'VT', 'DangCongTac', '2018-07-15')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV016', 'Trương', 'Thu', 'ThS', NULL, 'truong.thu995@gv.cntt-hl.ptit.edu.vn', '0928838896', 'HOALAC', 'KT', 'TamNghi', '2016-01-11')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV017', 'Hoàng', 'Vinh', 'PGS', 'GTV', 'hoang.vinh435@gv.cntt-hl.ptit.edu.vn', '0951536062', 'HOALAC', 'VT', 'DangCongTac', '2012-10-01')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV018', 'Trần', 'Cường', 'PGS', NULL, 'tran.cuong531@gv.cntt-hl.ptit.edu.vn', '0919777291', 'HOALAC', 'KT', 'DangCongTac', '2015-12-20')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV019', 'Vương', 'Yến', 'ThS', NULL, 'vuong.yen960@gv.cntt-hl.ptit.edu.vn', '0962330898', 'HOALAC', 'CNTT', 'DangCongTac', '2015-05-07')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV020', 'Mạc', 'Lan', 'TS', NULL, 'mac.lan31@gv.cntt-hl.ptit.edu.vn', '0918057475', 'HOALAC', 'KT', 'DangCongTac', '2013-05-19')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV021', 'Bùi', 'Hoàng', 'ThS', NULL, 'bui.hoang202@gv.cntt-hl.ptit.edu.vn', '0937119129', 'HOALAC', 'KT', 'DangCongTac', '2017-09-06')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV022', 'Huỳnh', 'Huy', 'CN', NULL, 'huynh.huy813@gv.cntt-hl.ptit.edu.vn', '0997070426', 'HOALAC', 'VT', 'TamNghi', '2019-08-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV023', 'Đỗ', 'Trọng', 'CN', 'GTV', 'do.trong428@gv.cntt-hl.ptit.edu.vn', '0941612913', 'HOALAC', 'CNTT', 'TamNghi', '2018-10-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV024', 'Đỗ', 'My', 'ThS', NULL, 'do.my454@gv.cntt-hl.ptit.edu.vn', '0952192427', 'HOALAC', 'CNTT', 'DangCongTac', '2014-07-14')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV025', 'Mạc', 'Mai', 'ThS', NULL, 'mac.mai987@gv.cntt-hl.ptit.edu.vn', '0949004938', 'HOALAC', 'KT', 'DangCongTac', '2014-11-21')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV026', 'Phạm', 'Việt', 'CN', NULL, 'pham.viet350@gv.cntt-hl.ptit.edu.vn', '0906237708', 'HOALAC', 'ATTT', 'DangCongTac', '2023-03-01')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV027', 'Tạ', 'Thi', 'TS', 'GTV', 'ta.thi972@gv.cntt-hl.ptit.edu.vn', '0945964543', 'HOALAC', 'KT', 'TamNghi', '2021-09-11')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV028', 'Đinh', 'Sơn', 'ThS', 'GTV', 'dinh.son743@gv.cntt-hl.ptit.edu.vn', '0916347845', 'HOALAC', 'ATTT', 'DangCongTac', '2011-03-10')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV029', 'Trương', 'Yến', 'CN', 'GTV', 'truong.yen207@gv.cntt-hl.ptit.edu.vn', '0955411125', 'HOALAC', 'CNTT', 'TamNghi', '2019-07-27')
ON CONFLICT (MaGV) DO NOTHING;
INSERT INTO GiangVien (MaGV, Ho, Ten, HocVi, HocHam, Email, SoDienThoai, MaCoSo, MaKhoa, TrangThai, NgayVaoLam)
VALUES ('HOALACGV030', 'Trần', 'Bích', 'TS', 'GTV', 'tran.bich844@gv.cntt-hl.ptit.edu.vn', '0991457801', 'HOALAC', 'VT', 'DangCongTac', '2013-06-02')
ON CONFLICT (MaGV) DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO001', 'Phong 1', 'Toa C', 1, 50, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO002', 'Phong 2', 'Toa C', 4, 40, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO003', 'Phong 3', 'Toa B', 3, 50, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO004', 'Phong 4', 'Toa C', 1, 30, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO005', 'Phong 5', 'Toa D', 2, 60, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO006', 'Phong 6', 'Toa B', 3, 30, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO007', 'Phong 7', 'Toa B', 3, 60, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO008', 'Phong 8', 'Toa B', 1, 40, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO009', 'Phong 9', 'Toa C', 3, 50, 'ThiNghiem', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO010', 'Phong 10', 'Toa D', 5, 30, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO011', 'Phong 11', 'Toa D', 2, 120, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO012', 'Phong 12', 'Toa D', 3, 50, 'HoiTruong', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO013', 'Phong 13', 'Toa C', 1, 40, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO014', 'Phong 14', 'Toa B', 2, 120, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO015', 'Phong 15', 'Toa B', 3, 30, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO016', 'Phong 16', 'Toa D', 2, 50, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO017', 'Phong 17', 'Toa C', 4, 40, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO018', 'Phong 18', 'Toa C', 5, 60, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO019', 'Phong 19', 'Toa C', 4, 60, 'MayTinh', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;
INSERT INTO PhongHoc (MaPhong, TenPhong, ToaNha, Tang, SucChua, LoaiPhong, MaCoSo, TrangThai)
VALUES ('PHO020', 'Phong 20', 'Toa D', 3, 120, 'LyThuyet', 'HOALAC', 'HoatDong')
ON CONFLICT (MaPhong) DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1006-HOALAC-01', 'CS1006', 'HK20251', 'HOALAC', 'HOALACGV027', 'CS1006-01', 15, 7, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-01', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV005', 'CS1001-01', 12, 1, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HOALAC-01', 'CS1010', 'HK20251', 'HOALAC', 'HOALACGV002', 'CS1010-01', 10, 1, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-02', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV010', 'CS1001-02', 10, 2, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-HOALAC-01', 'CS1012', 'HK20251', 'HOALAC', 'HOALACGV018', 'CS1012-01', 12, 2, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1014-HOALAC-01', 'CS1014', 'HK20251', 'HOALAC', 'HOALACGV012', 'CS1014-01', 30, 6, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HOALAC-01', 'CS1002', 'HK20251', 'HOALAC', 'HOALACGV021', 'CS1002-01', 30, 1, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HOALAC-01', 'CS1008', 'HK20251', 'HOALAC', 'HOALACGV010', 'CS1008-01', 50, 0, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1012-HOALAC-02', 'CS1012', 'HK20251', 'HOALAC', 'HOALACGV020', 'CS1012-02', 50, 14, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1008-HOALAC-02', 'CS1008', 'HK20251', 'HOALAC', 'HOALACGV030', 'CS1008-02', 40, 12, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1011-HOALAC-01', 'CS1011', 'HK20251', 'HOALAC', 'HOALACGV012', 'CS1011-01', 50, 3, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HOALAC-01', 'CS1004', 'HK20251', 'HOALAC', 'HOALACGV014', 'CS1004-01', 30, 0, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-03', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV021', 'CS1001-03', 50, 20, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HOALAC-02', 'CS1010', 'HK20251', 'HOALAC', 'HOALACGV022', 'CS1010-02', 50, 14, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1009-HOALAC-01', 'CS1009', 'HK20251', 'HOALAC', 'HOALACGV019', 'CS1009-01', 50, 19, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1004-HOALAC-02', 'CS1004', 'HK20251', 'HOALAC', 'HOALACGV005', 'CS1004-02', 30, 9, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1013-HOALAC-01', 'CS1013', 'HK20251', 'HOALAC', 'HOALACGV017', 'CS1013-01', 60, 11, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1007-HOALAC-01', 'CS1007', 'HK20251', 'HOALAC', 'HOALACGV028', 'CS1007-01', 40, 18, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1002-HOALAC-02', 'CS1002', 'HK20251', 'HOALAC', 'HOALACGV005', 'CS1002-02', 40, 9, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HOALAC-01', 'CS1015', 'HK20251', 'HOALAC', 'HOALACGV011', 'CS1015-01', 50, 6, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1010-HOALAC-03', 'CS1010', 'HK20251', 'HOALAC', 'HOALACGV003', 'CS1010-03', 40, 13, 'Hybrid', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1015-HOALAC-02', 'CS1015', 'HK20251', 'HOALAC', 'HOALACGV016', 'CS1015-02', 50, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-04', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV016', 'CS1001-04', 40, 8, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1014-HOALAC-02', 'CS1014', 'HK20251', 'HOALAC', 'HOALACGV027', 'CS1014-02', 50, 5, 'Offline', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;
INSERT INTO LopHocPhan (MaLopHP, MaHP, MaHocKy, MaCoSo, MaGV, TenLopHP, SiSoToiDa, SiSoHienTai, HinhThucHoc, TrangThaiLop)
VALUES ('CS1001-HOALAC-05', 'CS1001', 'HK20251', 'HOALAC', 'HOALACGV029', 'CS1001-05', 40, 10, 'Online', 'Mo')
ON CONFLICT (MaLopHP) DO NOTHING;

-- ---- LichHoc ----
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0001', 'CS1006-HOALAC-01', 'PHO017', 4, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0002', 'CS1006-HOALAC-01', 'PHO017', 3, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0003', 'CS1001-HOALAC-01', 'PHO002', 4, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0004', 'CS1001-HOALAC-01', 'PHO010', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0005', 'CS1010-HOALAC-01', 'PHO006', 4, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0006', 'CS1010-HOALAC-01', 'PHO015', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0007', 'CS1010-HOALAC-01', 'PHO020', 4, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0008', 'CS1001-HOALAC-02', 'PHO005', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0009', 'CS1001-HOALAC-02', 'PHO016', 5, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0010', 'CS1012-HOALAC-01', 'PHO003', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0011', 'CS1012-HOALAC-01', 'PHO011', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0012', 'CS1014-HOALAC-01', 'PHO007', 6, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0013', 'CS1014-HOALAC-01', 'PHO001', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0014', 'CS1002-HOALAC-01', 'PHO017', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0015', 'CS1002-HOALAC-01', 'PHO006', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0016', 'CS1002-HOALAC-01', 'PHO005', 3, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0017', 'CS1008-HOALAC-01', 'PHO012', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0018', 'CS1008-HOALAC-01', 'PHO019', 2, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0019', 'CS1012-HOALAC-02', 'PHO020', 5, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0020', 'CS1012-HOALAC-02', 'PHO010', 5, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0021', 'CS1012-HOALAC-02', 'PHO006', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0022', 'CS1008-HOALAC-02', 'PHO009', 3, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0023', 'CS1008-HOALAC-02', 'PHO003', 4, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0024', 'CS1011-HOALAC-01', 'PHO014', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0025', 'CS1011-HOALAC-01', 'PHO011', 7, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0026', 'CS1011-HOALAC-01', 'PHO005', 3, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0027', 'CS1004-HOALAC-01', 'PHO014', 7, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0028', 'CS1004-HOALAC-01', 'PHO016', 5, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0029', 'CS1001-HOALAC-03', 'PHO020', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0030', 'CS1001-HOALAC-03', 'PHO003', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0031', 'CS1010-HOALAC-02', 'PHO009', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0032', 'CS1010-HOALAC-02', 'PHO012', 4, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0033', 'CS1010-HOALAC-02', 'PHO009', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0034', 'CS1009-HOALAC-01', 'PHO004', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0035', 'CS1009-HOALAC-01', 'PHO011', 5, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0036', 'CS1009-HOALAC-01', 'PHO013', 5, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0037', 'CS1004-HOALAC-02', 'PHO020', 4, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0038', 'CS1004-HOALAC-02', 'PHO003', 7, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0039', 'CS1004-HOALAC-02', 'PHO012', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0040', 'CS1013-HOALAC-01', 'PHO010', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0041', 'CS1013-HOALAC-01', 'PHO018', 5, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0042', 'CS1013-HOALAC-01', 'PHO002', 3, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0043', 'CS1007-HOALAC-01', 'PHO014', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0044', 'CS1007-HOALAC-01', 'PHO008', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0045', 'CS1002-HOALAC-02', 'PHO013', 3, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0046', 'CS1002-HOALAC-02', 'PHO008', 6, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0047', 'CS1015-HOALAC-01', 'PHO018', 3, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0048', 'CS1015-HOALAC-01', 'PHO018', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0049', 'CS1015-HOALAC-01', 'PHO002', 3, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0050', 'CS1010-HOALAC-03', 'PHO005', 6, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0051', 'CS1010-HOALAC-03', 'PHO003', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0052', 'CS1015-HOALAC-02', 'PHO016', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0053', 'CS1015-HOALAC-02', 'PHO013', 2, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0054', 'CS1015-HOALAC-02', 'PHO001', 3, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0055', 'CS1001-HOALAC-04', 'PHO012', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0056', 'CS1001-HOALAC-04', 'PHO010', 6, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0057', 'CS1014-HOALAC-02', 'PHO010', 7, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0058', 'CS1014-HOALAC-02', 'PHO013', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0059', 'CS1001-HOALAC-05', 'PHO013', 3, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0060', 'CS1001-HOALAC-05', 'PHO015', 3, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
INSERT INTO LichHoc (MaLich, MaLopHP, MaPhong, ThuTrongTuan, TietBatDau, SoTiet, NgayBatDau, NgayKetThuc)
VALUES ('LHO0061', 'CS1001-HOALAC-05', 'PHO019', 5, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT (MaLich) DO NOTHING;
