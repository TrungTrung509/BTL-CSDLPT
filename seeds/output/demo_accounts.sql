-- ============================================================
-- DU LIEU DEMO ACCOUNTS
-- Cac tai khoan nay co the login thuc su
-- Sinh: 2026-04-27 12:32:08
-- ============================================================

-- Admin HADONG (login: admin / admin123)
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('AD1', 'admin', '$2b$12$j6/T.co5FDs2ckw1lmfbf.h9TM1TKUGNlQAZaqPESTc4nS4eebAxC', 'admin@ptit.edu.vn', 'Admin', 'HADONG', 'Active', '2026-04-27 12:32:08')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password", "username" = EXCLUDED."username";

-- Student HADONG CNTT (login: svhd26cntt001 / SVHD26CNTT001)
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHD26CNTT001', 'svhd26cntt001', '$2b$12$KcBWBldF.wtohPLxXycssueLXbF/DZBfvIFW.d9Lke8H8huc/tcmq', 'student.hadong@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active', '2026-04-27 12:32:08')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password", "username" = EXCLUDED."username";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHD26CNTT001', 'SVHD26CNTT001', 'Nguyen', 'Minh', '2003-05-15', 'Nam', '0912345678', 'Ha Noi', 'HADONG', 'CNTT', 'DangHoc', '2021-09-01', '2026-04-27 12:32:08')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";

-- Teacher HADONG CNTT (login: gvhd26cntt001 / GVHD26CNTT001)
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('GVHD26CNTT001', 'gvhd26cntt001', '$2b$12$IFUlI3US4hC.zwwybavLnOm9.RNwZeHRYchC710IUkOlhXZ7PwDdu', 'teacher.hadong@ptit.edu.vn', 'GiangVien', 'HADONG', 'Active', '2026-04-27 12:32:08')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password", "username" = EXCLUDED."username";

INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao")
VALUES ('GVHD26CNTT001', 'GVHD26CNTT001', 'Tran', 'Anh', 'TS', 'GTV', '0987654321', 'HADONG', 'CNTT', 'DangCongTac', '2015-09-01', '2026-04-27 12:32:08')
ON CONFLICT ("MaGV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";

-- Student NGOCTRUC CNTT (login: svnt26cntt001 / SVNT26CNTT001)
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVNT26CNTT001', 'svnt26cntt001', '$2b$12$dy8naL93J2gJsh.4xgiKF.Q9jPzEBn6fhbW4mbGXasoJcw40qGEGe', 'student.ngoctruc@ptit.edu.vn', 'SinhVien', 'NGOCTRUC', 'Active', '2026-04-27 12:32:08')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVNT26CNTT001', 'SVNT26CNTT001', 'Le', 'Binh', '2003-08-20', 'Nam', '0901234567', 'Hai Phong', 'NGOCTRUC', 'CNTT', 'DangHoc', '2021-09-01', '2026-04-27 12:32:08')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";

-- Student HOALAC CNTT (login: svhl26cntt001 / SVHL26CNTT001)
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
VALUES ('SVHL26CNTT001', 'svhl26cntt001', '$2b$12$uvbYb66g9OmYFCfBWocVaed.HYdqJQ2uxFVVnAFPb.6ILq1tS.Y2a', 'student.hoalac@ptit.edu.vn', 'SinhVien', 'HOALAC', 'Active', '2026-04-27 12:32:08')
ON CONFLICT ("userId") DO UPDATE SET "password" = EXCLUDED."password";

INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao")
VALUES ('SVHL26CNTT001', 'SVHL26CNTT001', 'Pham', 'Lan', '2003-03-10', 'Nu', '0909876543', 'Hoa Lac', 'HOALAC', 'CNTT', 'DangHoc', '2021-09-01', '2026-04-27 12:32:08')
ON CONFLICT ("MaSV") DO UPDATE SET "Ho" = EXCLUDED."Ho", "Ten" = EXCLUDED."Ten", "MaKhoa" = EXCLUDED."MaKhoa";

