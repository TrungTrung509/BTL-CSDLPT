-- DangKy data
SELECT * FROM "DangKy" ORDER BY "MaDangKy" LIMIT 5;
-- Max MaDangKy
SELECT MAX("MaDangKy") AS max_madk FROM "DangKy";
-- DangKy_3PC sample
SELECT * FROM "DangKy_3PC" ORDER BY "RecordId" LIMIT 3;
-- DangKy_Log sample
SELECT * FROM "DangKy_Log" ORDER BY "LogId" LIMIT 3;
-- NhatKyThaoTac sample
SELECT * FROM "NhatKyThaoTac" ORDER BY "ID" LIMIT 3;
-- SiteStatus
SELECT * FROM "SiteStatus";
-- ReplicationOutbox sample
SELECT * FROM "ReplicationOutbox" LIMIT 3;
