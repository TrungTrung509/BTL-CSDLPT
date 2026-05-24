-- ============================================================
-- CHECK COUNTS - So sanh 3 site
-- ============================================================
SELECT '--- COMMON TABLES ---' AS info;
SELECT 'CoSo' AS tbl, COUNT(*) FROM "CoSo" UNION ALL
SELECT 'users', COUNT(*) FROM "users" UNION ALL
SELECT 'Khoa', COUNT(*) FROM "Khoa" UNION ALL
SELECT 'HocPhan', COUNT(*) FROM "HocPhan" UNION ALL
SELECT 'HocKy', COUNT(*) FROM "HocKy";

SELECT '--- LOCAL TABLES ---' AS info;
SELECT 'SinhVien' AS tbl, COUNT(*) FROM "SinhVien" UNION ALL
SELECT 'GiangVien', COUNT(*) FROM "GiangVien" UNION ALL
SELECT 'PhongHoc', COUNT(*) FROM "PhongHoc" UNION ALL
SELECT 'LopHocPhan', COUNT(*) FROM "LopHocPhan" UNION ALL
SELECT 'LichHoc', COUNT(*) FROM "LichHoc" UNION ALL
SELECT 'DangKy', COUNT(*) FROM "DangKy" UNION ALL
SELECT 'AuditLog', COUNT(*) FROM "AuditLog" UNION ALL
SELECT 'DangKyLog', COUNT(*) FROM "DangKyLog";

SELECT '--- TRANSACTION/LOG TABLES ---' AS info;
SELECT 'DangKy_3PC' AS tbl, COUNT(*) FROM "DangKy_3PC" UNION ALL
SELECT 'DangKy_Log', COUNT(*) FROM "DangKy_Log" UNION ALL
SELECT 'NhatKyThaoTac', COUNT(*) FROM "NhatKyThaoTac" UNION ALL
SELECT 'ReplicationOutbox', COUNT(*) FROM "ReplicationOutbox" UNION ALL
SELECT 'SiteStatus', COUNT(*) FROM "SiteStatus";
