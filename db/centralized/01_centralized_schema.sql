-- ============================================================
-- DATABASE TẬP TRUNG - CSDLPT - Benchmark tập trung/phân tán
-- Tác giả: Nhóm CSDL Phân Tán
-- Mô tả: Schema gom dữ liệu từ 3 site phân tán vào 1 DB
-- Container: csdlpt_centralized (port 5435)
-- Database: csdlpt_centralized
-- ============================================================

-- ============================================================
-- 1. BẢNG COMMON - Dữ liệu dùng chung (từ 3 site, import 1 lần)
-- ============================================================

CREATE TABLE IF NOT EXISTS "CoSo" (
   "MaCoSo" VARCHAR(10) PRIMARY KEY,
   "TenCoSo" VARCHAR(100) NOT NULL,
   "DiaChi" VARCHAR(200) NOT NULL,
   "SoDienThoai" VARCHAR(20),
   "Email" VARCHAR(100) UNIQUE,
   "NgayThanhLap" DATE DEFAULT CURRENT_DATE,
   "TrangThai" VARCHAR(20) DEFAULT 'HoatDong'
);

CREATE TABLE IF NOT EXISTS "users" (
   "userId" VARCHAR(50) PRIMARY KEY,
   "username" VARCHAR(50) NOT NULL UNIQUE,
   "password" VARCHAR(255) NOT NULL,
   "email" VARCHAR(100) UNIQUE,
   "role" VARCHAR(20) NOT NULL CHECK ("role" IN ('SinhVien', 'GiangVien', 'Admin')),
   "MaCoSo" VARCHAR(10) NOT NULL,
   "status" VARCHAR(20) DEFAULT 'Active' CHECK ("status" IN ('Active', 'Inactive', 'Locked')),
   "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT "fk_users_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo")
);

CREATE TABLE IF NOT EXISTS "Khoa" (
   "MaKhoa" VARCHAR(20) PRIMARY KEY,
   "TenKhoa" VARCHAR(100) NOT NULL UNIQUE,
   "MoTa" VARCHAR(500),
   "NgayThanhLap" DATE DEFAULT CURRENT_DATE,
   "TrangThai" VARCHAR(20) DEFAULT 'HoatDong'
);

CREATE TABLE IF NOT EXISTS "HocPhan" (
   "MaHP" VARCHAR(20) PRIMARY KEY,
   "TenHP" VARCHAR(200) NOT NULL,
   "SoTinChi" INT NOT NULL CHECK ("SoTinChi" BETWEEN 1 AND 10),
   "SoTietLyThuyet" INT DEFAULT 0 CHECK ("SoTietLyThuyet" >= 0),
   "SoTietThucHanh" INT DEFAULT 0 CHECK ("SoTietThucHanh" >= 0),
   "LoaiHocPhan" VARCHAR(20) DEFAULT 'BatBuoc' CHECK ("LoaiHocPhan" IN ('BatBuoc', 'TuChon')),
   "MaKhoa" VARCHAR(20) NOT NULL,
   "MoTa" VARCHAR(1000),
   "TrangThai" VARCHAR(20) DEFAULT 'HoatDong',
   "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   CONSTRAINT "fk_hocphan_khoa" FOREIGN KEY ("MaKhoa") REFERENCES "Khoa"("MaKhoa")
);

CREATE TABLE IF NOT EXISTS "HocKy" (
   "MaHocKy" VARCHAR(20) PRIMARY KEY,
   "NamHoc" VARCHAR(10) NOT NULL,
   "KySo" INT NOT NULL CHECK ("KySo" IN (1, 2, 3)),
   "NgayBatDau" DATE,
   "NgayKetThuc" DATE,
   "TrangThaiHocKy" VARCHAR(20) DEFAULT 'SapMo' CHECK ("TrangThaiHocKy" IN ('SapMo', 'DangDangKy', 'DangHoc', 'DaKetThuc')),
   CONSTRAINT "chk_ngay_hocky" CHECK ("NgayKetThuc" > "NgayBatDau" OR "NgayKetThuc" IS NULL)
);

CREATE TABLE IF NOT EXISTS "TienQuyet" (
   "MaHP" VARCHAR(20),
   "MaHP_TienQuyet" VARCHAR(20),
   PRIMARY KEY ("MaHP", "MaHP_TienQuyet"),
   CONSTRAINT "fk_tq_hocphan" FOREIGN KEY ("MaHP") REFERENCES "HocPhan"("MaHP"),
   CONSTRAINT "fk_tq_tienquyet" FOREIGN KEY ("MaHP_TienQuyet") REFERENCES "HocPhan"("MaHP"),
   CONSTRAINT "chk_tienquyet_khac" CHECK ("MaHP" <> "MaHP_TienQuyet")
);

-- ============================================================
-- 2. BẢNG LOCAL - Dữ liệu gom từ 3 site, thêm SourceSite
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
   "MaCoSo" VARCHAR(10) NOT NULL,
   "MaKhoa" VARCHAR(20),
   "TrangThai" VARCHAR(20) DEFAULT 'DangHoc' CHECK ("TrangThai" IN ('DangHoc', 'BaoLuu', 'ThoiHoc', 'TotNghiep')),
   "NgayNhapHoc" DATE,
   "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_sv_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo"),
   CONSTRAINT "fk_sv_khoa" FOREIGN KEY ("MaKhoa") REFERENCES "Khoa"("MaKhoa"),
   CONSTRAINT "fk_sv_users" FOREIGN KEY ("userId") REFERENCES "users"("userId")
);

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
   "MaCoSo" VARCHAR(10) NOT NULL,
   "MaKhoa" VARCHAR(20),
   "TrangThai" VARCHAR(20) DEFAULT 'DangCongTac' CHECK ("TrangThai" IN ('DangCongTac', 'TamNghi', 'NghiViec')),
   "NgayVaoLam" DATE,
   "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_gv_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo"),
   CONSTRAINT "fk_gv_khoa" FOREIGN KEY ("MaKhoa") REFERENCES "Khoa"("MaKhoa"),
   CONSTRAINT "fk_gv_users" FOREIGN KEY ("userId") REFERENCES "users"("userId")
);

CREATE TABLE IF NOT EXISTS "PhongHoc" (
   "MaPhong" VARCHAR(20) PRIMARY KEY,
   "TenPhong" VARCHAR(100) NOT NULL,
   "ToaNha" VARCHAR(50),
   "Tang" INT,
   "SucChua" INT NOT NULL CHECK ("SucChua" > 0),
   "LoaiPhong" VARCHAR(30) DEFAULT 'LyThuyet' CHECK ("LoaiPhong" IN ('LyThuyet', 'MayTinh', 'ThiNghiem', 'HoiTruong')),
   "MaCoSo" VARCHAR(10) NOT NULL,
   "TrangThai" VARCHAR(20) DEFAULT 'HoatDong' CHECK ("TrangThai" IN ('HoatDong', 'BaoTri', 'NgungSuDung')),
   "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_phong_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo")
);

CREATE TABLE IF NOT EXISTS "LopHocPhan" (
   "MaLopHP" VARCHAR(20) PRIMARY KEY,
   "MaHP" VARCHAR(20) NOT NULL,
   "MaHocKy" VARCHAR(20) NOT NULL,
   "MaCoSo" VARCHAR(10) NOT NULL,
   "MaGV" VARCHAR(20) NOT NULL,
   "TenLopHP" VARCHAR(100),
   "SiSoToiDa" INT NOT NULL CHECK ("SiSoToiDa" > 0),
   "SiSoHienTai" INT DEFAULT 0 CHECK ("SiSoHienTai" >= 0),
   "HinhThucHoc" VARCHAR(20) DEFAULT 'Offline' CHECK ("HinhThucHoc" IN ('Offline', 'Online', 'Hybrid')),
   "TrangThaiLop" VARCHAR(20) DEFAULT 'Mo' CHECK ("TrangThaiLop" IN ('Mo', 'Dong', 'Huy')),
   "NgayTao" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_lhp_hocphan" FOREIGN KEY ("MaHP") REFERENCES "HocPhan"("MaHP"),
   CONSTRAINT "fk_lhp_hocky" FOREIGN KEY ("MaHocKy") REFERENCES "HocKy"("MaHocKy"),
   CONSTRAINT "fk_lhp_coso" FOREIGN KEY ("MaCoSo") REFERENCES "CoSo"("MaCoSo"),
   CONSTRAINT "fk_lhp_gv" FOREIGN KEY ("MaGV") REFERENCES "GiangVien"("MaGV")
);

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
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_lich_lophp" FOREIGN KEY ("MaLopHP") REFERENCES "LopHocPhan"("MaLopHP") ON DELETE CASCADE,
   CONSTRAINT "fk_lich_phong" FOREIGN KEY ("MaPhong") REFERENCES "PhongHoc"("MaPhong")
);

-- DangKy: Dùng BIGSERIAL thay vì SERIAL để tránh trùng khi gom từ 3 site
-- Thêm OriginalMaDangKy và SourceSite để lưu id gốc
CREATE TABLE IF NOT EXISTS "DangKy" (
   "MaDangKy" BIGSERIAL PRIMARY KEY,
   "MaSV" VARCHAR(20) NOT NULL,
   "MaLopHP" VARCHAR(20) NOT NULL,
   "NgayDangKy" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "TrangThaiDangKy" VARCHAR(20) DEFAULT 'DaDangKy' CHECK ("TrangThaiDangKy" IN ('DaDangKy', 'DaHuy', 'ChoDuyet')),
   "LanDangKy" INT DEFAULT 1 CHECK ("LanDangKy" >= 1),
   "GhiChu" VARCHAR(200),
   "userId" VARCHAR(50) NOT NULL,
   "MaHP" VARCHAR(20) NOT NULL,
   "MaHocKy" VARCHAR(20) NOT NULL,
   "OriginalMaDangKy" INT,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_dk_sv" FOREIGN KEY ("MaSV") REFERENCES "SinhVien"("MaSV"),
   CONSTRAINT "fk_dk_lophp" FOREIGN KEY ("MaLopHP") REFERENCES "LopHocPhan"("MaLopHP"),
   CONSTRAINT "uq_dk_sv_lophp" UNIQUE ("MaSV", "MaLopHP"),
   CONSTRAINT "fk_dk_userid" FOREIGN KEY ("userId") REFERENCES "users"("userId"),
   CONSTRAINT "fk_dk_hp" FOREIGN KEY ("MaHP") REFERENCES "HocPhan"("MaHP"),
   CONSTRAINT "fk_dk_hocky" FOREIGN KEY ("MaHocKy") REFERENCES "HocKy"("MaHocKy")
);

CREATE TABLE IF NOT EXISTS "AuditLog" (
   "MaLog" SERIAL PRIMARY KEY,
   "BangCapNhat" VARCHAR(50) NOT NULL,
   "HanhDong" VARCHAR(20) NOT NULL,
   "BanGhiCu" TEXT,
   "BanGhiMoi" TEXT,
   "NguoiThucHien" VARCHAR(50),
   "DiaChiIP" VARCHAR(50),
   "ThoiGian" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "SourceSite" VARCHAR(10)
);

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
   "ThoiGian" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   "SourceSite" VARCHAR(10)
);

-- ============================================================
-- 3. BẢNG TRANSACTION/LOG (từ 3 site, chỉ dùng cho benchmark)
-- ============================================================

CREATE TABLE IF NOT EXISTS "DangKy_3PC" (
   "RecordId" SERIAL PRIMARY KEY,
   "TxnId" VARCHAR(100) NOT NULL,
   "CoordinatorSite" VARCHAR(10) NOT NULL,
   "SiteId" VARCHAR(10) NOT NULL,
   "UserId" VARCHAR(50) NOT NULL,
   "Action" VARCHAR(20) NOT NULL,
   "State" VARCHAR(20) NOT NULL,
   "TargetMaLopHP" VARCHAR(20) NOT NULL,
   "TargetMaHP" VARCHAR(20) NOT NULL,
   "TargetMaHocKy" VARCHAR(20) NOT NULL,
   "OldMaLopHP" VARCHAR(20),
   "Payload" TEXT NOT NULL,
   "Message" TEXT,
   "CreatedAt" TIMESTAMP NOT NULL,
   "UpdatedAt" TIMESTAMP NOT NULL,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "uq_dk_3pc_txn_site" UNIQUE ("TxnId", "SiteId")
);

CREATE TABLE IF NOT EXISTS "DangKy_Log" (
   "LogId" SERIAL PRIMARY KEY,
   "userId" VARCHAR(50) NOT NULL,
   "MaLopHP" VARCHAR(20) NOT NULL,
   "MaHP" VARCHAR(20) NOT NULL,
   "Action" VARCHAR(20) NOT NULL,
   "TargetSite" VARCHAR(10) NOT NULL,
   "Status" VARCHAR(20),
   "Message" VARCHAR(200),
   "Timestamp" TIMESTAMP NOT NULL,
   "SourceSite" VARCHAR(10),
   CONSTRAINT "fk_dklog_userid" FOREIGN KEY ("userId") REFERENCES "users"("userId")
);

CREATE TABLE IF NOT EXISTS "NhatKyThaoTac" (
   "ID" SERIAL PRIMARY KEY,
   "MaGiaoTac" VARCHAR(100) NOT NULL,
   "MaLopHP" VARCHAR(20) NOT NULL,
   "MaSV" VARCHAR(20) NOT NULL,
   "Buoc" VARCHAR(20) NOT NULL,
   "ChiTiet" TEXT,
   "ThoiGian" TIMESTAMP NOT NULL,
   "TrangThai" VARCHAR(20) NOT NULL,
   "SourceSite" VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS "ReplicationOutbox" (
   "EventId" SERIAL PRIMARY KEY,
   "EntityType" VARCHAR(50) NOT NULL,
   "EntityId" VARCHAR(50) NOT NULL,
   "Operation" VARCHAR(20) NOT NULL,
   "Payload" TEXT NOT NULL,
   "SourceSite" VARCHAR(10) NOT NULL,
   "TargetSite" VARCHAR(10) NOT NULL,
   "Status" VARCHAR(20) NOT NULL,
   "RetryCount" INT NOT NULL DEFAULT 0,
   "LastError" TEXT,
   "CreatedAt" TIMESTAMP NOT NULL,
   "UpdatedAt" TIMESTAMP NOT NULL,
   "ProcessedAt" TIMESTAMP
);

CREATE TABLE IF NOT EXISTS "SiteStatus" (
   "SiteId" VARCHAR(10) PRIMARY KEY,
   "Role" VARCHAR(20) NOT NULL,
   "Status" VARCHAR(20) NOT NULL,
   "LastHeartbeat" TIMESTAMP,
   "LastSuccessAt" TIMESTAMP,
   "LastError" TEXT,
   "UpdatedAt" TIMESTAMP NOT NULL
);

-- ============================================================
-- 4. INDEXES
-- ============================================================

-- Common indexes
CREATE INDEX IF NOT EXISTS "idx_hocphan_khoa" ON "HocPhan"("MaKhoa");
CREATE INDEX IF NOT EXISTS "idx_hocphan_trangthai" ON "HocPhan"("TrangThai");
CREATE INDEX IF NOT EXISTS "idx_tienquyet_mahp" ON "TienQuyet"("MaHP");
CREATE INDEX IF NOT EXISTS "idx_tienquyet_tq" ON "TienQuyet"("MaHP_TienQuyet");

-- Local indexes
CREATE INDEX IF NOT EXISTS "idx_sinhvien_macoso" ON "SinhVien"("MaCoSo");
CREATE INDEX IF NOT EXISTS "idx_sinhvien_makhoa" ON "SinhVien"("MaKhoa");
CREATE INDEX IF NOT EXISTS "idx_sinhvien_trangthai" ON "SinhVien"("TrangThai");
CREATE INDEX IF NOT EXISTS "idx_giangvien_macoso" ON "GiangVien"("MaCoSo");
CREATE INDEX IF NOT EXISTS "idx_giangvien_makhoa" ON "GiangVien"("MaKhoa");
CREATE INDEX IF NOT EXISTS "idx_phonghoc_macoso" ON "PhongHoc"("MaCoSo");
CREATE INDEX IF NOT EXISTS "idx_lophocphan_macoso" ON "LopHocPhan"("MaCoSo");
CREATE INDEX IF NOT EXISTS "idx_lophocphan_mahp" ON "LopHocPhan"("MaHP");
CREATE INDEX IF NOT EXISTS "idx_lophocphan_mahocky" ON "LopHocPhan"("MaHocKy");
CREATE INDEX IF NOT EXISTS "idx_lophocphan_magv" ON "LopHocPhan"("MaGV");
CREATE INDEX IF NOT EXISTS "idx_lichhoc_malophp" ON "LichHoc"("MaLopHP");
CREATE INDEX IF NOT EXISTS "idx_lichhoc_maphong" ON "LichHoc"("MaPhong");
CREATE INDEX IF NOT EXISTS "idx_dangky_masv" ON "DangKy"("MaSV");
CREATE INDEX IF NOT EXISTS "idx_dangky_malophp" ON "DangKy"("MaLopHP");
CREATE INDEX IF NOT EXISTS "idx_dangky_trangthai" ON "DangKy"("TrangThaiDangKy");
CREATE INDEX IF NOT EXISTS "idx_dangky_sourcesite" ON "DangKy"("SourceSite");

-- ============================================================
-- 5. COMMENTS
-- ============================================================

COMMENT ON TABLE "DangKy" IS 'Đăng ký học phần tập trung - MaDangKy dùng BIGSERIAL để tránh trùng khi gom từ 3 site';
COMMENT ON COLUMN "DangKy"."SourceSite" IS 'Site nguồn: HADONG, NGOCTRUC, HOALAC';
COMMENT ON COLUMN "DangKy"."OriginalMaDangKy" IS 'MaDangKy gốc tại site nguồn (để debug/trace)';
COMMENT ON COLUMN "SinhVien"."SourceSite" IS 'Site nguồn: HADONG, NGOCTRUC, HOALAC';
COMMENT ON COLUMN "GiangVien"."SourceSite" IS 'Site nguồn: HADONG, NGOCTRUC, HOALAC';
COMMENT ON COLUMN "PhongHoc"."SourceSite" IS 'Site nguồn: HADONG, NGOCTRUC, HOALAC';
COMMENT ON COLUMN "LopHocPhan"."SourceSite" IS 'Site nguồn: HADONG, NGOCTRUC, HOALAC';
COMMENT ON COLUMN "LichHoc"."SourceSite" IS 'Site nguồn: HADONG, NGOCTRUC, HOALAC';
