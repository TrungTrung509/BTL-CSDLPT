-- ============================================================
-- DU LIEU DEMO ENROLLMENTS
-- Phuc vu demo: register/cancel/history
-- Sinh: 2026-04-27 12:32:10
-- ============================================================

-- Enrollment cho SVHD26CNTT001 (co the huy)
INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
VALUES ('SVHD26CNTT001', 'SVHD26CNTT001', 'CS1008-HADONG-01', 'CS1008', 'HK20251', '2025-09-05 09:00:00', 'DaDangKy', 1, 'Mon co so')
ON CONFLICT DO NOTHING;

INSERT INTO "DangKy" ("userId", "MaSV", "MaLopHP", "MaHP", "MaHocKy", "NgayDangKy", "TrangThaiDangKy", "LanDangKy", "GhiChu")
VALUES ('SVHD26CNTT001', 'SVHD26CNTT001', 'CS1011-HADONG-01', 'CS1011', 'HK20251', '2025-09-05 10:30:00', 'DaDangKy', 1, 'Mon nen tang')
ON CONFLICT DO NOTHING;

-- Update SiSoHienTai
UPDATE "LopHocPhan" SET "SiSoHienTai" = "SiSoHienTai" + 1 WHERE "MaLopHP" IN ('CS1008-HADONG-01', 'CS1011-HADONG-01');

