-- ============================================================
-- DU LIEU DEMO CLASS SECTIONS
-- Lop hoc phan cho demo: register/cancel/history
-- Sinh: 2026-04-27 12:32:10
-- ============================================================

-- Lop HADONG CNTT
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-HADONG-01', 'CS1001', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1001-01', 40, 1, 'Offline', 'Mo', '2026-04-27 12:32:10')
ON CONFLICT ("MaLopHP") DO NOTHING;

INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1002-HADONG-01', 'CS1002', 'HK20251', 'HADONG', 'GVHD26CNTT001', 'CS1002-01', 15, 15, 'Offline', 'Mo', '2026-04-27 12:32:10')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- Lop NGOCTRUC CNTT
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-NGOCTRUC-01', 'CS1001', 'HK20251', 'NGOCTRUC', 'GVNT26CNTT001', 'CS1001-01', 40, 0, 'Offline', 'Mo', '2026-04-27 12:32:10')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- Lop HOALAC CNTT
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop", "NgayTao")
VALUES ('CS1001-HOALAC-01', 'CS1001', 'HK20251', 'HOALAC', 'GVHL26CNTT001', 'CS1001-01', 40, 0, 'Offline', 'Mo', '2026-04-27 12:32:10')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- LichHoc demo cho CS1001-HADONG-01
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHD001', 'CS1001-HADONG-01', 'PHA001', 2, 1, 3, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;

INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc", "GhiChu")
VALUES ('LHD002', 'CS1001-HADONG-01', 'PHA001', 4, 4, 2, '2025-09-01', '2025-12-31', NULL)
ON CONFLICT ("MaLich") DO NOTHING;

