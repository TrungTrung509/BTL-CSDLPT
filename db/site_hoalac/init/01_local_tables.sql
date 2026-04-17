-- ============================================================
-- CƠ SỞ DỮ LIỆU PHÂN TÁN - ĐỀ TÀI: ĐĂNG KÝ HỌC PHẦN
-- Tác giả: Nhóm CSDL Phân Tán
-- Mô tả: Bảng cục bộ SITE HOALAC (Hòa Lạc)
-- Thứ tự chạy: 01 (sau bảng common)
-- Mapping: HOALAC -> site_hoalac
-- ============================================================

-- ============================================================
-- 1. BẢNG SinhVien - Sinh viên cơ sở Hòa Lạc
-- Phân mảnh ngang theo MaCoSo = 'HOALAC'
-- ============================================================
-- ============================================================
-- 1. BẢNG "SinhVien" - Sinh viên cơ sở Hòa Lạc
-- Phân mảnh ngang theo MaCoSo = 'HOALAC'
-- ============================================================
CREATE TABLE IF NOT EXISTS "SinhVien" (
    "MaSV" VARCHAR(20) PRIMARY KEY,
    "userId" VARCHAR(50) NOT NULL UNIQUE,
    "Ho" VARCHAR(50) NOT NULL,
    "Ten" VARCHAR(50) NOT NULL,
    "NgaySinh" DATE,
    "GioiTinh" VARCHAR(10) DEFAULT 'Khac' CHECK ("GioiTinh" IN ('Nam', 'Nu', 'Khac')),
    "SDT" VARCHAR(20),
    "DiaChi" VARCHAR(300),
    "MaCoSo" VARCHAR(10) NOT NULL DEFAULT 'HOALAC',
    "MaKhoa" VARCHAR(20),
    "TrangThai" VARCHAR(20) DEFAULT 'DangHoc' CHECK ("TrangThai" IN ('DangHoc', 'BaoLuu', 'ThoiHoc', 'TotNghiep')),
    "NgayNhapHoc" DATE,
    "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_sv_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo"),
    CONSTRAINT "fk_sv_khoa" FOREIGN KEY ("MaKhoa") REFERENCES "Khoa"("MaKhoa"),
    CONSTRAINT "fk_sv_users" FOREIGN KEY ("userId") REFERENCES "users"("userId")
);

COMMENT ON TABLE "SinhVien" IS 'Sinh viên cơ sở HOALAC - PHÂN MẢNH NGANG theo MaCoSo';

-- ============================================================
-- 2. BẢNG "GiangVien" - Giảng viên cơ sở Hòa Lạc
-- Phân mảnh ngang theo MaCoSo = 'HOALAC'
-- ============================================================
CREATE TABLE IF NOT EXISTS "GiangVien" (
    "MaGV" VARCHAR(20) PRIMARY KEY,
    "userId" VARCHAR(50) NOT NULL UNIQUE,
    "Ho" VARCHAR(50) NOT NULL,
    "Ten" VARCHAR(50) NOT NULL,
    "NgaySinh" DATE,
    "GioiTinh" VARCHAR(10) DEFAULT 'Khac' CHECK ("GioiTinh" IN ('Nam', 'Nu', 'Khac')),
    "SDT" VARCHAR(20),
    "DiaChi" VARCHAR(300),
    "HocVi" VARCHAR(50),
    "HocHam" VARCHAR(50),
    "MaCoSo" VARCHAR(10) NOT NULL DEFAULT 'HOALAC',
    "MaKhoa" VARCHAR(20),
    "TrangThai" VARCHAR(20) DEFAULT 'DangCongTac' CHECK ("TrangThai" IN ('DangCongTac', 'TamNghi', 'NghiViec')),
    "NgayVaoLam" DATE,
    "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_gv_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo"),
    CONSTRAINT "fk_gv_khoa" FOREIGN KEY ("MaKhoa") REFERENCES "Khoa"("MaKhoa"),
    CONSTRAINT "fk_gv_users" FOREIGN KEY ("userId") REFERENCES "users"("userId")
);

COMMENT ON TABLE "GiangVien" IS 'Giảng viên cơ sở HOALAC - PHÂN MẢNH NGANG theo MaCoSo';

-- ============================================================
-- 3. BẢNG "PhongHoc" - Phòng học cơ sở Hòa Lạc
-- Phân mảnh ngang theo MaCoSo = 'HOALAC'
-- ============================================================
CREATE TABLE IF NOT EXISTS "PhongHoc" (
    "MaPhong" VARCHAR(20) PRIMARY KEY,
    "TenPhong" VARCHAR(100) NOT NULL,
    "ToaNha" VARCHAR(50),
    "Tang" INT,
    "SucChua" INT NOT NULL CHECK ("SucChua" > 0),
    "LoaiPhong" VARCHAR(30) DEFAULT 'LyThuyet' CHECK ("LoaiPhong" IN ('LyThuyet', 'MayTinh', 'ThiNghiem', 'HoiTruong')),
    "MaCoSo" VARCHAR(10) NOT NULL DEFAULT 'HOALAC',
    "TrangThai" VARCHAR(20) DEFAULT 'HoatDong' CHECK ("TrangThai" IN ('HoatDong', 'BaoTri', 'NgungSuDung')),
    "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_phong_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo")
);

COMMENT ON TABLE "PhongHoc" IS 'Phòng học cơ sở HOALAC - PHÂN MẢNH NGANG theo MaCoSo';

-- ============================================================
-- 4. BẢNG "LopHocPhan" - Lớp học phần MỞ TẠI Hòa Lạc
-- Phân mảnh ngang theo cơ sở MỞ LỚP
-- MaCoSo = 'HOALAC'
-- ============================================================
CREATE TABLE IF NOT EXISTS "LopHocPhan" (
    "MaLopHP" VARCHAR(20) PRIMARY KEY,
    "MaHP" VARCHAR(20) NOT NULL,
    "MaHocKy" VARCHAR(20) NOT NULL,
    "MaCoSo" VARCHAR(10) NOT NULL DEFAULT 'HOALAC',
    "MaGV" VARCHAR(20) NOT NULL,
    "TenLopHP" VARCHAR(100),
    "SiSoToiDa" INT NOT NULL CHECK ("SiSoToiDa" > 0),
    "SiSoHienTai" INT DEFAULT 0 CHECK ("SiSoHienTai" >= 0),
    "HinhThucHoc" VARCHAR(20) DEFAULT 'Offline' CHECK ("HinhThucHoc" IN ('Offline', 'Online', 'Hybrid')),
    "TrangThaiLop" VARCHAR(20) DEFAULT 'Mo' CHECK ("TrangThaiLop" IN ('Mo', 'Dong', 'Huy')),
    "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "fk_lhp_hocphan" FOREIGN KEY ("MaHP") REFERENCES "HocPhan"("MaHP"),
    CONSTRAINT "fk_lhp_hocky" FOREIGN KEY ("MaHocKy") REFERENCES "HocKy"("MaHocKy"),
    CONSTRAINT "fk_lhp_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo"),
    CONSTRAINT "fk_lhp_gv" FOREIGN KEY ("MaGV") REFERENCES "GiangVien"("MaGV")
);

COMMENT ON TABLE "LopHocPhan" IS 'Lớp học phần mở tại HOALAC - PHÂN MẢNH theo cơ sở MỞ LỚP';

-- ============================================================
-- 5. BẢNG "LichHoc" - Lịch học của lớp học phần
-- Phân mảnh dẫn xuất theo LopHocPhan
-- ============================================================
CREATE TABLE IF NOT EXISTS "LichHoc" (
    "MaLich" VARCHAR(20) PRIMARY KEY,
    "MaLopHP" VARCHAR(20) NOT NULL,
    "MaPhong" VARCHAR(20) NOT NULL,
    "ThuTrongTuan" INT NOT NULL CHECK ("ThuTrongTuan" BETWEEN 2 AND 8),
    "TietBatDau" INT NOT NULL CHECK ("TietBatDau" BETWEEN 1 AND 15),
    "SoTiet" INT NOT NULL CHECK ("SoTiet" > 0),
    "NgayBatDau" DATE,
    "NgayKetThuc" DATE,
    "GhiChu" VARCHAR(200),
    CONSTRAINT "fk_lich_lophp" FOREIGN KEY ("MaLopHP") REFERENCES "LopHocPhan"("MaLopHP") ON DELETE CASCADE,
    CONSTRAINT "fk_lich_phong" FOREIGN KEY ("MaPhong") REFERENCES "PhongHoc"("MaPhong")
);

COMMENT ON TABLE "LichHoc" IS 'Lịch học - PHÂN MẢNH DẪN XUẤT theo LopHocPhan';

-- ============================================================
-- 6. BẢNG "DangKy" - Đăng ký học phần
-- Phân mảnh theo CƠ SỞ MỞ LỚP HỌC PHẦN
-- ============================================================
CREATE TABLE IF NOT EXISTS "DangKy" (
    "MaDangKy" SERIAL PRIMARY KEY,
    "MaSV" VARCHAR(20) NOT NULL,
    "MaLopHP" VARCHAR(20) NOT NULL,
    "NgayDangKy" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    "TrangThaiDangKy" VARCHAR(20) DEFAULT 'DaDangKy' CHECK ("TrangThaiDangKy" IN ('DaDangKy', 'DaHuy', 'ChoDuyet')),
    "LanDangKy" INT DEFAULT 1 CHECK ("LanDangKy" >= 1),
    "GhiChu" VARCHAR(200),
    CONSTRAINT "fk_dk_sv" FOREIGN KEY ("MaSV") REFERENCES "SinhVien"("MaSV"),
    CONSTRAINT "fk_dk_lophp" FOREIGN KEY ("MaLopHP") REFERENCES "LopHocPhan"("MaLopHP"),
    CONSTRAINT "uq_dk_sv_lophp" UNIQUE ("MaSV", "MaLopHP")
);

COMMENT ON TABLE "DangKy" IS 'Đăng ký học phần - PHÂN MẢNH theo cơ sở MỞ LỚP';

-- ============================================================
-- 7. BẢNG "AuditLog" - Log tổng hợp thao tác
-- ============================================================
CREATE TABLE IF NOT EXISTS "AuditLog" (
    "MaLog" SERIAL PRIMARY KEY,
    "BangCapNhat" VARCHAR(50) NOT NULL,
    "HanhDong" VARCHAR(20) NOT NULL,
    "BanGhiCu" TEXT,
    "BanGhiMoi" TEXT,
    "NguoiThucHien" VARCHAR(50),
    "DiaChiIP" VARCHAR(50),
    "ThoiGian" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- 8. BẢNG "DangKyLog" - Log riêng đăng ký/hủy
-- ============================================================
CREATE TABLE IF NOT EXISTS "DangKyLog" (
    "MaLog" SERIAL PRIMARY KEY,
    "MaSV" VARCHAR(20) NOT NULL,
    "MaLopHP" VARCHAR(20) NOT NULL,
    "HanhDong" VARCHAR(20) NOT NULL,
    "TrangThaiCu" VARCHAR(20),
    "TrangThaiMoi" VARCHAR(20),
    "KetQua" VARCHAR(20) NOT NULL,
    "LyDo" TEXT,
    "NguoiThucHien" VARCHAR(50),
    "ThoiGian" TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ============================================================
-- GHI CHÚ CẤU HÌNH
-- ============================================================
COMMENT ON COLUMN "SinhVien"."MaSV" IS 'Mã sinh viên';
COMMENT ON COLUMN "SinhVien"."userId" IS 'ID người dùng liên kết';
COMMENT ON COLUMN "SinhVien"."Ho" IS 'Họ';
COMMENT ON COLUMN "SinhVien"."Ten" IS 'Tên';
COMMENT ON COLUMN "SinhVien"."NgaySinh" IS 'Ngày sinh';
COMMENT ON COLUMN "SinhVien"."GioiTinh" IS 'Giới tính: Nam, Nu, Khac';
COMMENT ON COLUMN "SinhVien"."SDT" IS 'Số điện thoại';
COMMENT ON COLUMN "SinhVien"."DiaChi" IS 'Địa chỉ';
COMMENT ON COLUMN "SinhVien"."MaCoSo" IS 'Cơ sở quản lý chính: HOALAC';
COMMENT ON COLUMN "SinhVien"."MaKhoa" IS 'Khoa sinh viên theo học';
COMMENT ON COLUMN "SinhVien"."TrangThai" IS 'Trạng thái: DangHoc, BaoLuu, ThoiHoc, TotNghiep';
COMMENT ON COLUMN "SinhVien"."NgayNhapHoc" IS 'Ngày nhập học';

COMMENT ON COLUMN "GiangVien"."MaGV" IS 'Mã giảng viên';
COMMENT ON COLUMN "GiangVien"."userId" IS 'ID người dùng liên kết';
COMMENT ON COLUMN "GiangVien"."Ho" IS 'Họ';
COMMENT ON COLUMN "GiangVien"."Ten" IS 'Tên';
COMMENT ON COLUMN "GiangVien"."NgaySinh" IS 'Ngày sinh';
COMMENT ON COLUMN "GiangVien"."GioiTinh" IS 'Giới tính: Nam, Nu, Khac';
COMMENT ON COLUMN "GiangVien"."SDT" IS 'Số điện thoại';
COMMENT ON COLUMN "GiangVien"."DiaChi" IS 'Địa chỉ';
COMMENT ON COLUMN "GiangVien"."HocVi" IS 'Học vị: CN, ThS, TS';
COMMENT ON COLUMN "GiangVien"."HocHam" IS 'Học hàm: GTV, PGS, GS';
COMMENT ON COLUMN "GiangVien"."MaCoSo" IS 'Cơ sở quản lý chính: HOALAC';
COMMENT ON COLUMN "GiangVien"."MaKhoa" IS 'Khoa phụ trách';
COMMENT ON COLUMN "GiangVien"."TrangThai" IS 'Trạng thái: DangCongTac, TamNghi, NghiViec';

COMMENT ON COLUMN "PhongHoc"."MaCoSo" IS 'Cơ sở sở hữu phòng: HOALAC';
COMMENT ON COLUMN "LopHocPhan"."MaCoSo" IS 'Cơ sở MỞ LỚP này: HOALAC';
