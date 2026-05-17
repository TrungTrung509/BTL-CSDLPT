-- ============================================================
-- IMPORT DATA INTO CENTRALIZED DB v2
-- Sử dụng COPY từ từng site, an toàn hơn dblink
-- Thứ tự: Common (HADONG) -> Local (3 site)
-- ============================================================

-- ============================================================
-- PHASE 1: COMMON TABLES (từ HADONG)
-- ============================================================

-- CoSo - giống nhau ở 3 site, import 1 lần từ HADONG
\echo 'Importing CoSo...'
INSERT INTO "CoSo" ("MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai")
SELECT "MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaCoSo", "TenCoSo", "DiaChi", "SoDienThoai", "Email", "NgayThanhLap", "TrangThai" FROM "CoSo"$q$)
AS t("MaCoSo" VARCHAR, "TenCoSo" VARCHAR, "DiaChi" VARCHAR, "SoDienThoai" VARCHAR, "Email" VARCHAR, "NgayThanhLap" DATE, "TrangThai" VARCHAR)
ON CONFLICT ("MaCoSo") DO NOTHING;

-- Khoa
\echo 'Importing Khoa...'
INSERT INTO "Khoa" ("MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai")
SELECT "MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaKhoa", "TenKhoa", "MoTa", "NgayThanhLap", "TrangThai" FROM "Khoa"$q$)
AS t("MaKhoa" VARCHAR, "TenKhoa" VARCHAR, "MoTa" VARCHAR, "NgayThanhLap" DATE, "TrangThai" VARCHAR)
ON CONFLICT ("MaKhoa") DO NOTHING;

-- HocKy
\echo 'Importing HocKy...'
INSERT INTO "HocKy" ("MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy")
SELECT "MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaHocKy", "NamHoc", "KySo", "NgayBatDau", "NgayKetThuc", "TrangThaiHocKy" FROM "HocKy"$q$)
AS t("MaHocKy" VARCHAR, "NamHoc" VARCHAR, "KySo" INT, "NgayBatDau" DATE, "NgayKetThuc" DATE, "TrangThaiHocKy" VARCHAR)
ON CONFLICT ("MaHocKy") DO NOTHING;

-- users - import từ cả 3 site (vì userId khác nhau giữa các site)
\echo 'Importing users from HADONG...'
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
SELECT "userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao" FROM "users"$q$)
AS t("userId" VARCHAR, "username" VARCHAR, "password" VARCHAR, "email" VARCHAR, "role" VARCHAR, "MaCoSo" VARCHAR, "status" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("userId") DO NOTHING;

\echo 'Importing users from NGOCTRUC...'
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
SELECT "userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao"
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao" FROM "users"$q$)
AS t("userId" VARCHAR, "username" VARCHAR, "password" VARCHAR, "email" VARCHAR, "role" VARCHAR, "MaCoSo" VARCHAR, "status" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("userId") DO NOTHING;

\echo 'Importing users from HOALAC...'
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao")
SELECT "userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao"
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "userId", "username", "password", "email", "role", "MaCoSo", "status", "NgayTao" FROM "users"$q$)
AS t("userId" VARCHAR, "username" VARCHAR, "password" VARCHAR, "email" VARCHAR, "role" VARCHAR, "MaCoSo" VARCHAR, "status" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("userId") DO NOTHING;

-- HocPhan
\echo 'Importing HocPhan...'
INSERT INTO "HocPhan" ("MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao")
SELECT "MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaHP", "TenHP", "SoTinChi", "SoTietLyThuyet", "SoTietThucHanh", "LoaiHocPhan", "MaKhoa", "MoTa", "TrangThai", "NgayTao" FROM "HocPhan"$q$)
AS t("MaHP" VARCHAR, "TenHP" VARCHAR, "SoTinChi" INT, "SoTietLyThuyet" INT, "SoTietThucHanh" INT, "LoaiHocPhan" VARCHAR, "MaKhoa" VARCHAR, "MoTa" VARCHAR, "TrangThai" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaHP") DO NOTHING;

-- TienQuyet
\echo 'Importing TienQuyet...'
INSERT INTO "TienQuyet" ("MaHP", "MaHP_TienQuyet")
SELECT "MaHP", "MaHP_TienQuyet"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaHP", "MaHP_TienQuyet" FROM "TienQuyet"$q$)
AS t("MaHP" VARCHAR, "MaHP_TienQuyet" VARCHAR)
ON CONFLICT ("MaHP", "MaHP_TienQuyet") DO NOTHING;

-- ============================================================
-- PHASE 2: LOCAL TABLES FROM HADONG
-- ============================================================

\echo 'Importing SinhVien HADONG...'
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao", "SourceSite")
SELECT "MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao" FROM "SinhVien"$q$)
AS t("MaSV" VARCHAR, "userId" VARCHAR, "Ho" VARCHAR, "Ten" VARCHAR, "NgaySinh" DATE, "GioiTinh" VARCHAR, "SDT" VARCHAR, "DiaChi" VARCHAR, "MaCoSo" VARCHAR, "MaKhoa" VARCHAR, "TrangThai" VARCHAR, "NgayNhapHoc" DATE, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaSV") DO NOTHING;

\echo 'Importing SinhVien NGOCTRUC...'
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao", "SourceSite")
SELECT "MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao" FROM "SinhVien"$q$)
AS t("MaSV" VARCHAR, "userId" VARCHAR, "Ho" VARCHAR, "Ten" VARCHAR, "NgaySinh" DATE, "GioiTinh" VARCHAR, "SDT" VARCHAR, "DiaChi" VARCHAR, "MaCoSo" VARCHAR, "MaKhoa" VARCHAR, "TrangThai" VARCHAR, "NgayNhapHoc" DATE, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaSV") DO NOTHING;

\echo 'Importing SinhVien HOALAC...'
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao", "SourceSite")
SELECT "MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc", "NgayTao" FROM "SinhVien"$q$)
AS t("MaSV" VARCHAR, "userId" VARCHAR, "Ho" VARCHAR, "Ten" VARCHAR, "NgaySinh" DATE, "GioiTinh" VARCHAR, "SDT" VARCHAR, "DiaChi" VARCHAR, "MaCoSo" VARCHAR, "MaKhoa" VARCHAR, "TrangThai" VARCHAR, "NgayNhapHoc" DATE, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaSV") DO NOTHING;

-- GiangVien
\echo 'Importing GiangVien HADONG...'
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao", "SourceSite")
SELECT "MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao" FROM "GiangVien"$q$)
AS t("MaGV" VARCHAR, "userId" VARCHAR, "Ho" VARCHAR, "Ten" VARCHAR, "NgaySinh" DATE, "GioiTinh" VARCHAR, "SDT" VARCHAR, "DiaChi" VARCHAR, "HocVi" VARCHAR, "HocHam" VARCHAR, "MaCoSo" VARCHAR, "MaKhoa" VARCHAR, "TrangThai" VARCHAR, "NgayVaoLam" DATE, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaGV") DO NOTHING;

\echo 'Importing GiangVien NGOCTRUC...'
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao", "SourceSite")
SELECT "MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao" FROM "GiangVien"$q$)
AS t("MaGV" VARCHAR, "userId" VARCHAR, "Ho" VARCHAR, "Ten" VARCHAR, "NgaySinh" DATE, "GioiTinh" VARCHAR, "SDT" VARCHAR, "DiaChi" VARCHAR, "HocVi" VARCHAR, "HocHam" VARCHAR, "MaCoSo" VARCHAR, "MaKhoa" VARCHAR, "TrangThai" VARCHAR, "NgayVaoLam" DATE, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaGV") DO NOTHING;

\echo 'Importing GiangVien HOALAC...'
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao", "SourceSite")
SELECT "MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaGV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "HocVi", "HocHam", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam", "NgayTao" FROM "GiangVien"$q$)
AS t("MaGV" VARCHAR, "userId" VARCHAR, "Ho" VARCHAR, "Ten" VARCHAR, "NgaySinh" DATE, "GioiTinh" VARCHAR, "SDT" VARCHAR, "DiaChi" VARCHAR, "HocVi" VARCHAR, "HocHam" VARCHAR, "MaCoSo" VARCHAR, "MaKhoa" VARCHAR, "TrangThai" VARCHAR, "NgayVaoLam" DATE, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaGV") DO NOTHING;

-- PhongHoc
\echo 'Importing PhongHoc HADONG...'
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao", "SourceSite")
SELECT "MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao" FROM "PhongHoc"$q$)
AS t("MaPhong" VARCHAR, "TenPhong" VARCHAR, "ToaNha" VARCHAR, "Tang" INT, "SucChua" INT, "LoaiPhong" VARCHAR, "MaCoSo" VARCHAR, "TrangThai" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaPhong") DO NOTHING;

\echo 'Importing PhongHoc NGOCTRUC...'
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao", "SourceSite")
SELECT "MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao" FROM "PhongHoc"$q$)
AS t("MaPhong" VARCHAR, "TenPhong" VARCHAR, "ToaNha" VARCHAR, "Tang" INT, "SucChua" INT, "LoaiPhong" VARCHAR, "MaCoSo" VARCHAR, "TrangThai" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaPhong") DO NOTHING;

\echo 'Importing PhongHoc HOALAC...'
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao", "SourceSite")
SELECT "MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai", "NgayTao" FROM "PhongHoc"$q$)
AS t("MaPhong" VARCHAR, "TenPhong" VARCHAR, "ToaNha" VARCHAR, "Tang" INT, "SucChua" INT, "LoaiPhong" VARCHAR, "MaCoSo" VARCHAR, "TrangThai" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaPhong") DO NOTHING;

-- LopHocPhan
\echo 'Importing LopHocPhan HADONG...'
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao", "SourceSite")
SELECT "MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao" FROM "LopHocPhan"$q$)
AS t("MaLopHP" VARCHAR, "MaHP" VARCHAR, "MaHocKy" VARCHAR, "MaCoSo" VARCHAR, "MaGV" VARCHAR, "TenLopHP" VARCHAR, "SiSoToiDa" INT, "SiSoHienTai" INT, "HinhThucHoc" VARCHAR, "TrangThaiLop" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaLopHP") DO NOTHING;

\echo 'Importing LopHocPhan NGOCTRUC...'
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao", "SourceSite")
SELECT "MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao" FROM "LopHocPhan"$q$)
AS t("MaLopHP" VARCHAR, "MaHP" VARCHAR, "MaHocKy" VARCHAR, "MaCoSo" VARCHAR, "MaGV" VARCHAR, "TenLopHP" VARCHAR, "SiSoToiDa" INT, "SiSoHienTai" INT, "HinhThucHoc" VARCHAR, "TrangThaiLop" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaLopHP") DO NOTHING;

\echo 'Importing LopHocPhan HOALAC...'
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao", "SourceSite")
SELECT "MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao" FROM "LopHocPhan"$q$)
AS t("MaLopHP" VARCHAR, "MaHP" VARCHAR, "MaHocKy" VARCHAR, "MaCoSo" VARCHAR, "MaGV" VARCHAR, "TenLopHP" VARCHAR, "SiSoToiDa" INT, "SiSoHienTai" INT, "HinhThucHoc" VARCHAR, "TrangThaiLop" VARCHAR, "NgayTao" TIMESTAMP)
ON CONFLICT ("MaLopHP") DO NOTHING;

-- LichHoc
\echo 'Importing LichHoc HADONG...'
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu", "SourceSite")
SELECT "MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu" FROM "LichHoc"$q$)
AS t("MaLich" VARCHAR, "MaLopHP" VARCHAR, "MaPhong" VARCHAR, "ThuTrongTuan" INT, "TietBatDau" INT, "SoTiet" INT, "NgayBatDau" DATE, "NgayKetThuc" DATE, "GhiChu" VARCHAR)
ON CONFLICT ("MaLich") DO NOTHING;

\echo 'Importing LichHoc NGOCTRUC...'
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu", "SourceSite")
SELECT "MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu" FROM "LichHoc"$q$)
AS t("MaLich" VARCHAR, "MaLopHP" VARCHAR, "MaPhong" VARCHAR, "ThuTrongTuan" INT, "TietBatDau" INT, "SoTiet" INT, "NgayBatDau" DATE, "NgayKetThuc" DATE, "GhiChu" VARCHAR)
ON CONFLICT ("MaLich") DO NOTHING;

\echo 'Importing LichHoc HOALAC...'
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu", "SourceSite")
SELECT "MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu" FROM "LichHoc"$q$)
AS t("MaLich" VARCHAR, "MaLopHP" VARCHAR, "MaPhong" VARCHAR, "ThuTrongTuan" INT, "TietBatDau" INT, "SoTiet" INT, "NgayBatDau" DATE, "NgayKetThuc" DATE, "GhiChu" VARCHAR)
ON CONFLICT ("MaLich") DO NOTHING;

-- DangKy
\echo 'Importing DangKy HADONG...'
INSERT INTO "DangKy" ("MaSV", "MaLopHP", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu", "userId", "MaHP", "MaHocKy", "OriginalMaDangKy", "SourceSite")
SELECT "MaSV", "MaLopHP", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu", "userId", "MaHP", "MaHocKy", "MaDangKy", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "MaLopHP", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu", "userId", "MaHP", "MaHocKy", "MaDangKy" FROM "DangKy"$q$)
AS t("MaSV" VARCHAR, "MaLopHP" VARCHAR, "NgayDangKy" TIMESTAMP, "TrangThaiDangKy" VARCHAR, "LanDangKy" INT, "GhiChu" VARCHAR, "userId" VARCHAR, "MaHP" VARCHAR, "MaHocKy" VARCHAR, "MaDangKy" INT);

-- AuditLog
\echo 'Importing AuditLog HADONG...'
INSERT INTO "AuditLog" ("BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian", "SourceSite")
SELECT "BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian" FROM "AuditLog"$q$)
AS t("BangCapNhat" VARCHAR, "HanhDong" VARCHAR, "BanGhiCu" TEXT, "BanGhiMoi" TEXT, "NguoiThucHien" VARCHAR, "DiaChiIP" VARCHAR, "ThoiGian" TIMESTAMP);

\echo 'Importing AuditLog NGOCTRUC...'
INSERT INTO "AuditLog" ("BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian", "SourceSite")
SELECT "BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian" FROM "AuditLog"$q$)
AS t("BangCapNhat" VARCHAR, "HanhDong" VARCHAR, "BanGhiCu" TEXT, "BanGhiMoi" TEXT, "NguoiThucHien" VARCHAR, "DiaChiIP" VARCHAR, "ThoiGian" TIMESTAMP);

\echo 'Importing AuditLog HOALAC...'
INSERT INTO "AuditLog" ("BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian", "SourceSite")
SELECT "BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "BangCapNhat", "HanhDong", "BanGhiCu", "BanGhiMoi", "NguoiThucHien", "DiaChiIP", "ThoiGian" FROM "AuditLog"$q$)
AS t("BangCapNhat" VARCHAR, "HanhDong" VARCHAR, "BanGhiCu" TEXT, "BanGhiMoi" TEXT, "NguoiThucHien" VARCHAR, "DiaChiIP" VARCHAR, "ThoiGian" TIMESTAMP);

-- DangKyLog (bảng AuditLog trong mô hình cũ)
\echo 'Importing DangKyLog HADONG...'
INSERT INTO "DangKyLog" ("MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian", "SourceSite")
SELECT "MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian" FROM "DangKyLog"$q$)
AS t("MaSV" VARCHAR, "MaLopHP" VARCHAR, "HanhDong" VARCHAR, "TrangThaiCu" VARCHAR, "TrangThaiMoi" VARCHAR, "KetQua" VARCHAR, "LyDo" TEXT, "NguoiThucHien" VARCHAR, "ThoiGian" TIMESTAMP);

\echo 'Importing DangKyLog NGOCTRUC...'
INSERT INTO "DangKyLog" ("MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian", "SourceSite")
SELECT "MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian", 'NGOCTRUC'
FROM dblink('host=postgres_ngoctruc port=5432 dbname=csdlpt_ngoctruc user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian" FROM "DangKyLog"$q$)
AS t("MaSV" VARCHAR, "MaLopHP" VARCHAR, "HanhDong" VARCHAR, "TrangThaiCu" VARCHAR, "TrangThaiMoi" VARCHAR, "KetQua" VARCHAR, "LyDo" TEXT, "NguoiThucHien" VARCHAR, "ThoiGian" TIMESTAMP);

\echo 'Importing DangKyLog HOALAC...'
INSERT INTO "DangKyLog" ("MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian", "SourceSite")
SELECT "MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian", 'HOALAC'
FROM dblink('host=postgres_hoalac port=5432 dbname=csdlpt_hoalac user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaSV", "MaLopHP", "HanhDong", "TrangThaiCu", "TrangThaiMoi", "KetQua", "LyDo", "NguoiThucHien", "ThoiGian" FROM "DangKyLog"$q$)
AS t("MaSV" VARCHAR, "MaLopHP" VARCHAR, "HanhDong" VARCHAR, "TrangThaiCu" VARCHAR, "TrangThaiMoi" VARCHAR, "KetQua" VARCHAR, "LyDo" TEXT, "NguoiThucHien" VARCHAR, "ThoiGian" TIMESTAMP);

-- ============================================================
-- PHASE 3: TRANSACTION/LOG TABLES (từ HADONG)
-- ============================================================

\echo 'Importing DangKy_3PC...'
INSERT INTO "DangKy_3PC" ("TxnId", "CoordinatorSite", "SiteId", "UserId", "Action", "State", "TargetMaLopHP", "TargetMaHP", "TargetMaHocKy", "OldMaLopHP", "Payload", "Message", "CreatedAt", "UpdatedAt", "SourceSite")
SELECT "TxnId", "CoordinatorSite", "SiteId", "UserId", "Action", "State", "TargetMaLopHP", "TargetMaHP", "TargetMaHocKy", "OldMaLopHP", "Payload", "Message", "CreatedAt", "UpdatedAt", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "TxnId", "CoordinatorSite", "SiteId", "UserId", "Action", "State", "TargetMaLopHP", "TargetMaHP", "TargetMaHocKy", "OldMaLopHP", "Payload", "Message", "CreatedAt", "UpdatedAt" FROM "DangKy_3PC"$q$)
AS t("TxnId" VARCHAR, "CoordinatorSite" VARCHAR, "SiteId" VARCHAR, "UserId" VARCHAR, "Action" VARCHAR, "State" VARCHAR, "TargetMaLopHP" VARCHAR, "TargetMaHP" VARCHAR, "TargetMaHocKy" VARCHAR, "OldMaLopHP" VARCHAR, "Payload" TEXT, "Message" TEXT, "CreatedAt" TIMESTAMP, "UpdatedAt" TIMESTAMP);

\echo 'Importing DangKy_Log (transaction)...'
INSERT INTO "DangKy_Log" ("userId", "MaLopHP", "MaHP", "Action", "TargetSite", "Status", "Message", "Timestamp", "SourceSite")
SELECT "userId", "MaLopHP", "MaHP", "Action", "TargetSite", "Status", "Message", "Timestamp", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "userId", "MaLopHP", "MaHP", "Action", "TargetSite", "Status", "Message", "Timestamp" FROM "DangKy_Log"$q$)
AS t("userId" VARCHAR, "MaLopHP" VARCHAR, "MaHP" VARCHAR, "Action" VARCHAR, "TargetSite" VARCHAR, "Status" VARCHAR, "Message" VARCHAR, "Timestamp" TIMESTAMP);

\echo 'Importing NhatKyThaoTac...'
INSERT INTO "NhatKyThaoTac" ("MaGiaoTac", "MaLopHP", "MaSV", "Buoc", "ChiTiet", "ThoiGian", "TrangThai", "SourceSite")
SELECT "MaGiaoTac", "MaLopHP", "MaSV", "Buoc", "ChiTiet", "ThoiGian", "TrangThai", 'HADONG'
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "MaGiaoTac", "MaLopHP", "MaSV", "Buoc", "ChiTiet", "ThoiGian", "TrangThai" FROM "NhatKyThaoTac"$q$)
AS t("MaGiaoTac" VARCHAR, "MaLopHP" VARCHAR, "MaSV" VARCHAR, "Buoc" VARCHAR, "ChiTiet" TEXT, "ThoiGian" TIMESTAMP, "TrangThai" VARCHAR);

\echo 'Importing ReplicationOutbox...'
INSERT INTO "ReplicationOutbox" ("EntityType", "EntityId", "Operation", "Payload", "SourceSite", "TargetSite", "Status", "RetryCount", "LastError", "CreatedAt", "UpdatedAt", "ProcessedAt")
SELECT "EntityType", "EntityId", "Operation", "Payload", "SourceSite", "TargetSite", "Status", "RetryCount", "LastError", "CreatedAt", "UpdatedAt", "ProcessedAt"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "EntityType", "EntityId", "Operation", "Payload", "SourceSite", "TargetSite", "Status", "RetryCount", "LastError", "CreatedAt", "UpdatedAt", "ProcessedAt" FROM "ReplicationOutbox"$q$)
AS t("EntityType" VARCHAR, "EntityId" VARCHAR, "Operation" VARCHAR, "Payload" TEXT, "SourceSite" VARCHAR, "TargetSite" VARCHAR, "Status" VARCHAR, "RetryCount" INT, "LastError" TEXT, "CreatedAt" TIMESTAMP, "UpdatedAt" TIMESTAMP, "ProcessedAt" TIMESTAMP);

\echo 'Importing SiteStatus...'
INSERT INTO "SiteStatus" ("SiteId", "Role", "Status", "LastHeartbeat", "LastSuccessAt", "LastError", "UpdatedAt")
SELECT "SiteId", "Role", "Status", "LastHeartbeat", "LastSuccessAt", "LastError", "UpdatedAt"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "SiteId", "Role", "Status", "LastHeartbeat", "LastSuccessAt", "LastError", "UpdatedAt" FROM "SiteStatus"$q$)
AS t("SiteId" VARCHAR, "Role" VARCHAR, "Status" VARCHAR, "LastHeartbeat" TIMESTAMP, "LastSuccessAt" TIMESTAMP, "LastError" TEXT, "UpdatedAt" TIMESTAMP)
ON CONFLICT ("SiteId") DO NOTHING;

\echo 'Import complete!'
