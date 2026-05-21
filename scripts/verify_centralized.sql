-- Check all counts in centralized DB
SELECT '--- COMMON TABLES ---' AS info;
SELECT 'CoSo' AS tbl, COUNT(*) FROM "CoSo" UNION ALL
SELECT 'users', COUNT(*) FROM "users" UNION ALL
SELECT 'Khoa', COUNT(*) FROM "Khoa" UNION ALL
SELECT 'HocPhan', COUNT(*) FROM "HocPhan" UNION ALL
SELECT 'HocKy', COUNT(*) FROM "HocKy" UNION ALL
SELECT 'TienQuyet', COUNT(*) FROM "TienQuyet";

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

SELECT '--- VERIFICATION ---' AS info;
SELECT 'SinhVien by SourceSite' AS check_name, COUNT(*) FROM "SinhVien" GROUP BY "SourceSite" ORDER BY "SourceSite";
SELECT 'GiangVien by SourceSite', COUNT(*) FROM "GiangVien" GROUP BY "SourceSite" ORDER BY "SourceSite";
SELECT 'PhongHoc by SourceSite', COUNT(*) FROM "PhongHoc" GROUP BY "SourceSite" ORDER BY "SourceSite";
SELECT 'LopHocPhan by SourceSite', COUNT(*) FROM "LopHocPhan" GROUP BY "SourceSite" ORDER BY "SourceSite";
SELECT 'LichHoc by SourceSite', COUNT(*) FROM "LichHoc" GROUP BY "SourceSite" ORDER BY "SourceSite";
SELECT 'DangKy by SourceSite', COUNT(*) FROM "DangKy" GROUP BY "SourceSite" ORDER BY "SourceSite";
