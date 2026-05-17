SELECT 'SinhVien' AS t, "SourceSite", COUNT(*) FROM "SinhVien" GROUP BY "SourceSite"
UNION ALL
SELECT 'GiangVien', "SourceSite", COUNT(*) FROM "GiangVien" GROUP BY "SourceSite"
UNION ALL
SELECT 'PhongHoc', "SourceSite", COUNT(*) FROM "PhongHoc" GROUP BY "SourceSite"
UNION ALL
SELECT 'LopHocPhan', "SourceSite", COUNT(*) FROM "LopHocPhan" GROUP BY "SourceSite"
UNION ALL
SELECT 'LichHoc', "SourceSite", COUNT(*) FROM "LichHoc" GROUP BY "SourceSite"
UNION ALL
SELECT 'DangKy', "SourceSite", COUNT(*) FROM "DangKy" GROUP BY "SourceSite"
ORDER BY t, "SourceSite";
