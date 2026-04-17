-- ============================================================
-- DỮ LIỆU CỤC BỘ - Site HADONG (Cơ sở Hà Nội)
-- Sinh: 2026-04-16 18:49:57
-- ============================================================

-- ---- users (SinhVien) ----
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0001U', 'sv_hadongsv0001', 'hashed_default_pass_123', 'duong.trang612@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0002U', 'sv_hadongsv0002', 'hashed_default_pass_123', 'ta.bao395@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0003U', 'sv_hadongsv0003', 'hashed_default_pass_123', 'luu.giang259@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0004U', 'sv_hadongsv0004', 'hashed_default_pass_123', 'le.yen215@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0005U', 'sv_hadongsv0005', 'hashed_default_pass_123', 'ngo.dung697@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0006U', 'sv_hadongsv0006', 'hashed_default_pass_123', 'ta.nga504@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0007U', 'sv_hadongsv0007', 'hashed_default_pass_123', 'do.quynh272@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0008U', 'sv_hadongsv0008', 'hashed_default_pass_123', 'ngo.trung619@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0009U', 'sv_hadongsv0009', 'hashed_default_pass_123', 'ho.loan607@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0010U', 'sv_hadongsv0010', 'hashed_default_pass_123', 'dang.trang949@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0011U', 'sv_hadongsv0011', 'hashed_default_pass_123', 'nguyen.anh721@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0012U', 'sv_hadongsv0012', 'hashed_default_pass_123', 'do.trung192@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0013U', 'sv_hadongsv0013', 'hashed_default_pass_123', 'ngo.trong175@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0014U', 'sv_hadongsv0014', 'hashed_default_pass_123', 'do.hanh468@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0015U', 'sv_hadongsv0015', 'hashed_default_pass_123', 'dang.giang62@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0016U', 'sv_hadongsv0016', 'hashed_default_pass_123', 'hoang.ngoc694@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0017U', 'sv_hadongsv0017', 'hashed_default_pass_123', 'le.thao269@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0018U', 'sv_hadongsv0018', 'hashed_default_pass_123', 'dinh.vinh125@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0019U', 'sv_hadongsv0019', 'hashed_default_pass_123', 'ho.huy36@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0020U', 'sv_hadongsv0020', 'hashed_default_pass_123', 'ho.ly28@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0021U', 'sv_hadongsv0021', 'hashed_default_pass_123', 'truong.tri276@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0022U', 'sv_hadongsv0022', 'hashed_default_pass_123', 'bui.an99@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0023U', 'sv_hadongsv0023', 'hashed_default_pass_123', 'tran.tham10@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0024U', 'sv_hadongsv0024', 'hashed_default_pass_123', 'truong.trong548@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0025U', 'sv_hadongsv0025', 'hashed_default_pass_123', 'bui.thanh43@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0026U', 'sv_hadongsv0026', 'hashed_default_pass_123', 'hoang.phat539@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0027U', 'sv_hadongsv0027', 'hashed_default_pass_123', 'trinh.quynh599@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0028U', 'sv_hadongsv0028', 'hashed_default_pass_123', 'le.toan217@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0029U', 'sv_hadongsv0029', 'hashed_default_pass_123', 'vuong.huy200@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0030U', 'sv_hadongsv0030', 'hashed_default_pass_123', 'mac.yen132@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0031U', 'sv_hadongsv0031', 'hashed_default_pass_123', 'bui.sang286@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0032U', 'sv_hadongsv0032', 'hashed_default_pass_123', 'ho.ly881@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0033U', 'sv_hadongsv0033', 'hashed_default_pass_123', 'do.ngoc176@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0034U', 'sv_hadongsv0034', 'hashed_default_pass_123', 'truong.son611@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0035U', 'sv_hadongsv0035', 'hashed_default_pass_123', 'huynh.nam891@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0036U', 'sv_hadongsv0036', 'hashed_default_pass_123', 'phan.huy202@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0037U', 'sv_hadongsv0037', 'hashed_default_pass_123', 'hoang.vinh730@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0038U', 'sv_hadongsv0038', 'hashed_default_pass_123', 'hoang.cuong369@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0039U', 'sv_hadongsv0039', 'hashed_default_pass_123', 'ho.ly939@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0040U', 'sv_hadongsv0040', 'hashed_default_pass_123', 'ho.tri744@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0041U', 'sv_hadongsv0041', 'hashed_default_pass_123', 'dang.trong709@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0042U', 'sv_hadongsv0042', 'hashed_default_pass_123', 'vu.toan69@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0043U', 'sv_hadongsv0043', 'hashed_default_pass_123', 'pham.bich508@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0044U', 'sv_hadongsv0044', 'hashed_default_pass_123', 'tran.nghia788@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0045U', 'sv_hadongsv0045', 'hashed_default_pass_123', 'duong.an151@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0046U', 'sv_hadongsv0046', 'hashed_default_pass_123', 'hoang.nghia912@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0047U', 'sv_hadongsv0047', 'hashed_default_pass_123', 'huynh.anh443@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0048U', 'sv_hadongsv0048', 'hashed_default_pass_123', 'pham.thinh132@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0049U', 'sv_hadongsv0049', 'hashed_default_pass_123', 'luu.giang216@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0050U', 'sv_hadongsv0050', 'hashed_default_pass_123', 'truong.thao676@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0051U', 'sv_hadongsv0051', 'hashed_default_pass_123', 'ta.cuong191@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0052U', 'sv_hadongsv0052', 'hashed_default_pass_123', 'dang.viet958@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0053U', 'sv_hadongsv0053', 'hashed_default_pass_123', 'luu.lam247@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0054U', 'sv_hadongsv0054', 'hashed_default_pass_123', 'le.nam79@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0055U', 'sv_hadongsv0055', 'hashed_default_pass_123', 'le.phong845@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0056U', 'sv_hadongsv0056', 'hashed_default_pass_123', 'tran.minh41@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0057U', 'sv_hadongsv0057', 'hashed_default_pass_123', 'le.huy283@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0058U', 'sv_hadongsv0058', 'hashed_default_pass_123', 'cao.trang322@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0059U', 'sv_hadongsv0059', 'hashed_default_pass_123', 'pham.bao963@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0060U', 'sv_hadongsv0060', 'hashed_default_pass_123', 'phan.thinh581@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0061U', 'sv_hadongsv0061', 'hashed_default_pass_123', 'hoang.phat448@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0062U', 'sv_hadongsv0062', 'hashed_default_pass_123', 'le.hung664@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0063U', 'sv_hadongsv0063', 'hashed_default_pass_123', 'hoang.an208@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0064U', 'sv_hadongsv0064', 'hashed_default_pass_123', 'huynh.lan857@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0065U', 'sv_hadongsv0065', 'hashed_default_pass_123', 'vuong.sang236@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0066U', 'sv_hadongsv0066', 'hashed_default_pass_123', 'ly.em743@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0067U', 'sv_hadongsv0067', 'hashed_default_pass_123', 'dinh.thinh850@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0068U', 'sv_hadongsv0068', 'hashed_default_pass_123', 'ta.ha490@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0069U', 'sv_hadongsv0069', 'hashed_default_pass_123', 'cao.cuong177@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0070U', 'sv_hadongsv0070', 'hashed_default_pass_123', 'le.anh241@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0071U', 'sv_hadongsv0071', 'hashed_default_pass_123', 'ho.hanh657@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0072U', 'sv_hadongsv0072', 'hashed_default_pass_123', 'cao.hung664@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0073U', 'sv_hadongsv0073', 'hashed_default_pass_123', 'trinh.van869@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0074U', 'sv_hadongsv0074', 'hashed_default_pass_123', 'duong.dung236@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0075U', 'sv_hadongsv0075', 'hashed_default_pass_123', 'dinh.vinh514@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0076U', 'sv_hadongsv0076', 'hashed_default_pass_123', 'dinh.ly802@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0077U', 'sv_hadongsv0077', 'hashed_default_pass_123', 'pham.ha405@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0078U', 'sv_hadongsv0078', 'hashed_default_pass_123', 'hoang.trong215@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0079U', 'sv_hadongsv0079', 'hashed_default_pass_123', 'cao.lam426@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0080U', 'sv_hadongsv0080', 'hashed_default_pass_123', 'pham.dung162@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0081U', 'sv_hadongsv0081', 'hashed_default_pass_123', 'tran.son620@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0082U', 'sv_hadongsv0082', 'hashed_default_pass_123', 'ho.phat938@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0083U', 'sv_hadongsv0083', 'hashed_default_pass_123', 'tran.thu157@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0084U', 'sv_hadongsv0084', 'hashed_default_pass_123', 'ta.yen528@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0085U', 'sv_hadongsv0085', 'hashed_default_pass_123', 'mac.lam86@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0086U', 'sv_hadongsv0086', 'hashed_default_pass_123', 'phan.van10@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0087U', 'sv_hadongsv0087', 'hashed_default_pass_123', 'do.ha592@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0088U', 'sv_hadongsv0088', 'hashed_default_pass_123', 'ta.bich784@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0089U', 'sv_hadongsv0089', 'hashed_default_pass_123', 'ta.oanh220@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0090U', 'sv_hadongsv0090', 'hashed_default_pass_123', 'tran.tham107@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0091U', 'sv_hadongsv0091', 'hashed_default_pass_123', 'dang.mai338@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0092U', 'sv_hadongsv0092', 'hashed_default_pass_123', 'phan.my82@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0093U', 'sv_hadongsv0093', 'hashed_default_pass_123', 'mac.oanh943@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0094U', 'sv_hadongsv0094', 'hashed_default_pass_123', 'tran.trong464@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0095U', 'sv_hadongsv0095', 'hashed_default_pass_123', 'ngo.dung835@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0096U', 'sv_hadongsv0096', 'hashed_default_pass_123', 'hoang.huong66@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0097U', 'sv_hadongsv0097', 'hashed_default_pass_123', 'hoang.thuy659@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0098U', 'sv_hadongsv0098', 'hashed_default_pass_123', 'cao.my983@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0099U', 'sv_hadongsv0099', 'hashed_default_pass_123', 'pham.tam154@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0100U', 'sv_hadongsv0100', 'hashed_default_pass_123', 'bui.chau760@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0101U', 'sv_hadongsv0101', 'hashed_default_pass_123', 'le.lam836@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0102U', 'sv_hadongsv0102', 'hashed_default_pass_123', 'phan.tri677@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0103U', 'sv_hadongsv0103', 'hashed_default_pass_123', 'hoang.ha548@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0104U', 'sv_hadongsv0104', 'hashed_default_pass_123', 'luu.an763@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0105U', 'sv_hadongsv0105', 'hashed_default_pass_123', 'huynh.tuan345@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0106U', 'sv_hadongsv0106', 'hashed_default_pass_123', 'ho.binh232@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0107U', 'sv_hadongsv0107', 'hashed_default_pass_123', 'phan.bao114@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0108U', 'sv_hadongsv0108', 'hashed_default_pass_123', 'duong.ha644@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0109U', 'sv_hadongsv0109', 'hashed_default_pass_123', 'dinh.nga340@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0110U', 'sv_hadongsv0110', 'hashed_default_pass_123', 'duong.binh924@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0111U', 'sv_hadongsv0111', 'hashed_default_pass_123', 'dang.thuy914@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0112U', 'sv_hadongsv0112', 'hashed_default_pass_123', 'ho.dung490@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0113U', 'sv_hadongsv0113', 'hashed_default_pass_123', 'pham.yen554@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0114U', 'sv_hadongsv0114', 'hashed_default_pass_123', 'tran.nam707@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0115U', 'sv_hadongsv0115', 'hashed_default_pass_123', 'mac.hanh628@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0116U', 'sv_hadongsv0116', 'hashed_default_pass_123', 'dinh.binh339@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0117U', 'sv_hadongsv0117', 'hashed_default_pass_123', 'bui.van598@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0118U', 'sv_hadongsv0118', 'hashed_default_pass_123', 'tran.bich514@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0119U', 'sv_hadongsv0119', 'hashed_default_pass_123', 'hoang.oanh15@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGSV0120U', 'sv_hadongsv0120', 'hashed_default_pass_123', 'hoang.my694@ptit.edu.vn', 'SinhVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;

-- ---- users (GiangVien) ----
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV001U', 'gv_hadonggv001', 'hashed_default_pass_123', 'ngo.thi87@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV002U', 'gv_hadonggv002', 'hashed_default_pass_123', 'tran.binh180@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV003U', 'gv_hadonggv003', 'hashed_default_pass_123', 'vuong.lam901@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV004U', 'gv_hadonggv004', 'hashed_default_pass_123', 'duong.quang120@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV005U', 'gv_hadonggv005', 'hashed_default_pass_123', 'pham.son953@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV006U', 'gv_hadonggv006', 'hashed_default_pass_123', 'bui.linh351@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV007U', 'gv_hadonggv007', 'hashed_default_pass_123', 'luu.minh744@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV008U', 'gv_hadonggv008', 'hashed_default_pass_123', 'ngo.mai174@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV009U', 'gv_hadonggv009', 'hashed_default_pass_123', 'ngo.dung798@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV010U', 'gv_hadonggv010', 'hashed_default_pass_123', 'hoang.hanh788@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV011U', 'gv_hadonggv011', 'hashed_default_pass_123', 'vu.ngoc984@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV012U', 'gv_hadonggv012', 'hashed_default_pass_123', 'pham.nghia875@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV013U', 'gv_hadonggv013', 'hashed_default_pass_123', 'pham.loan642@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV014U', 'gv_hadonggv014', 'hashed_default_pass_123', 'le.mai910@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV015U', 'gv_hadonggv015', 'hashed_default_pass_123', 'luu.tuan732@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV016U', 'gv_hadonggv016', 'hashed_default_pass_123', 'truong.thao81@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV017U', 'gv_hadonggv017', 'hashed_default_pass_123', 'hoang.tien801@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV018U', 'gv_hadonggv018', 'hashed_default_pass_123', 'bui.hung705@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV019U', 'gv_hadonggv019', 'hashed_default_pass_123', 'dinh.binh587@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV020U', 'gv_hadonggv020', 'hashed_default_pass_123', 'dinh.lan786@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV021U', 'gv_hadonggv021', 'hashed_default_pass_123', 'bui.yen156@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV022U', 'gv_hadonggv022', 'hashed_default_pass_123', 'tran.hoang116@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV023U', 'gv_hadonggv023', 'hashed_default_pass_123', 'pham.nga213@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV024U', 'gv_hadonggv024', 'hashed_default_pass_123', 'huynh.thanh340@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV025U', 'gv_hadonggv025', 'hashed_default_pass_123', 'bui.anh861@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV026U', 'gv_hadonggv026', 'hashed_default_pass_123', 'phan.ha555@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV027U', 'gv_hadonggv027', 'hashed_default_pass_123', 'tran.tien557@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV028U', 'gv_hadonggv028', 'hashed_default_pass_123', 'vuong.hien55@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV029U', 'gv_hadonggv029', 'hashed_default_pass_123', 'ho.an928@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;
INSERT INTO "users" ("userId", "username", "password", "email", "role", "MaCoSo", "status")
VALUES ('HADONGGV030U', 'gv_hadonggv030', 'hashed_default_pass_123', 'tran.thi411@gv.cntt-hd.ptit.edu.vn', 'GiangVien', 'HADONG', 'Active')
ON CONFLICT ("userId") DO NOTHING;

-- ---- SinhVien ----
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0001', 'HADONGSV0001U', 'Phạm', 'Vân', '2002-01-30', 'Nam', '0974840787', 'Thanh Hóa', 'HADONG', 'VT', 'DangHoc', '2023-01-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0002', 'HADONGSV0002U', 'Bùi', 'Hoàng', '2004-09-17', 'Nam', '0943452161', 'Thừa Thiên Huế', 'HADONG', 'ATTT', 'DangHoc', '2022-10-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0003', 'HADONGSV0003U', 'Cao', 'Thịnh', '2005-06-06', 'Nu', '0917924727', 'Khánh Hòa', 'HADONG', 'VT', 'DangHoc', '2023-08-03')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0004', 'HADONGSV0004U', 'Bùi', 'Thúy', '2002-08-11', 'Nu', '0914115302', 'Hải Dương', 'HADONG', 'CNTT', 'DangHoc', '2021-06-29')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0005', 'HADONGSV0005U', 'Trương', 'Thu', '2000-02-15', 'Nam', '0975049483', 'Bắc Ninh', 'HADONG', 'VT', 'DangHoc', '2021-12-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0006', 'HADONGSV0006U', 'Đỗ', 'Lan', '2003-07-29', 'Nam', '0961979241', 'Hải Phòng', 'HADONG', 'ATTT', 'DangHoc', '2021-01-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0007', 'HADONGSV0007U', 'Lê', 'Thảo', '2005-07-27', 'Nam', '0934197454', 'Vĩnh Phúc', 'HADONG', 'ATTT', 'DangHoc', '2022-11-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0008', 'HADONGSV0008U', 'Tạ', 'Thi', '2002-02-05', 'Nu', '0992887957', 'Quảng Nam', 'HADONG', 'KT', 'BaoLuu', '2022-03-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0009', 'HADONGSV0009U', 'Trương', 'Toàn', '2003-06-17', 'Nu', '0979983978', 'Hà Tĩnh', 'HADONG', 'VT', 'DangHoc', '2021-06-24')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0010', 'HADONGSV0010U', 'Dương', 'Sơn', '2004-04-27', 'Nu', '0915707879', 'Bình Định', 'HADONG', 'KT', 'BaoLuu', '2020-06-20')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0011', 'HADONGSV0011U', 'Phạm', 'Minh', '2000-10-23', 'Nu', '0994843575', 'Đà Nẵng', 'HADONG', 'KT', 'DangHoc', '2022-01-31')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0012', 'HADONGSV0012U', 'Hồ', 'Phát', '2003-09-09', 'Nu', '0922265261', 'Bình Định', 'HADONG', 'ATTT', 'DangHoc', '2021-06-08')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0013', 'HADONGSV0013U', 'Trần', 'Loan', '2002-12-26', 'Nu', '0925345128', 'Nghệ An', 'HADONG', 'VT', 'DangHoc', '2023-10-15')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0014', 'HADONGSV0014U', 'Phạm', 'Hương', '2004-09-14', 'Nam', '0999485267', 'Hà Nội', 'HADONG', 'ATTT', 'DangHoc', '2022-10-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0015', 'HADONGSV0015U', 'Trương', 'Châu', '2006-03-24', 'Nu', '0924581810', 'Bắc Ninh', 'HADONG', 'VT', 'DangHoc', '2023-05-20')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0016', 'HADONGSV0016U', 'Đỗ', 'Lâm', '2001-08-21', 'Nu', '0905377494', 'Bình Thuận', 'HADONG', 'KT', 'DangHoc', '2022-12-14')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0017', 'HADONGSV0017U', 'Đặng', 'Phong', '2002-05-13', 'Nam', '0964695610', 'Hà Tĩnh', 'HADONG', 'ATTT', 'DangHoc', '2022-09-05')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0018', 'HADONGSV0018U', 'Phạm', 'Ly', '2003-08-30', 'Nu', '0922496171', 'Nam Định', 'HADONG', 'VT', 'DangHoc', '2021-04-09')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0019', 'HADONGSV0019U', 'Đinh', 'Sơn', '2001-10-26', 'Nu', '0925286678', 'Thừa Thiên Huế', 'HADONG', 'CNTT', 'BaoLuu', '2021-09-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0020', 'HADONGSV0020U', 'Tạ', 'Oanh', '2001-11-25', 'Nu', '0974341946', 'Quảng Bình', 'HADONG', 'KT', 'DangHoc', '2021-12-12')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0021', 'HADONGSV0021U', 'Hồ', 'Trang', '2004-01-13', 'Nam', '0962649970', 'Bình Định', 'HADONG', 'ATTT', 'DangHoc', '2022-03-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0022', 'HADONGSV0022U', 'Trần', 'Hoàng', '2003-10-03', 'Nam', '0945285343', 'Thanh Hóa', 'HADONG', 'ATTT', 'DangHoc', '2021-12-14')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0023', 'HADONGSV0023U', 'Lê', 'Trang', '2005-01-16', 'Nu', '0985571360', 'Quảng Trị', 'HADONG', 'KT', 'DangHoc', '2020-10-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0024', 'HADONGSV0024U', 'Huỳnh', 'Vinh', '2003-11-05', 'Nu', '0922457974', 'Quảng Nam', 'HADONG', 'KT', 'DangHoc', '2023-02-07')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0025', 'HADONGSV0025U', 'Vương', 'Hiền', '2004-02-23', 'Nu', '0904100382', 'Hải Dương', 'HADONG', 'ATTT', 'DangHoc', '2021-12-20')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0026', 'HADONGSV0026U', 'Trương', 'Anh', '2006-12-09', 'Nam', '0911798308', 'Hà Tĩnh', 'HADONG', 'ATTT', 'DangHoc', '2024-05-22')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0027', 'HADONGSV0027U', 'Nguyễn', 'Loan', '2000-07-01', 'Nu', '0972252858', 'Khánh Hòa', 'HADONG', 'CNTT', 'BaoLuu', '2021-11-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0028', 'HADONGSV0028U', 'Trương', 'Anh', '2005-02-25', 'Nam', '0944168275', 'Hải Dương', 'HADONG', 'ATTT', 'DangHoc', '2024-05-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0029', 'HADONGSV0029U', 'Dương', 'Mai', '2005-07-22', 'Nu', '0944523179', 'Nam Định', 'HADONG', 'KT', 'DangHoc', '2023-08-16')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0030', 'HADONGSV0030U', 'Cao', 'Bảo', '2001-06-01', 'Nam', '0924491902', 'Nam Định', 'HADONG', 'ATTT', 'BaoLuu', '2020-06-09')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0031', 'HADONGSV0031U', 'Vũ', 'Tâm', '2002-09-19', 'Nam', '0972410745', 'Đà Nẵng', 'HADONG', 'CNTT', 'DangHoc', '2021-11-22')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0032', 'HADONGSV0032U', 'Hồ', 'Thanh', '2005-02-07', 'Nu', '0987467834', 'Nam Định', 'HADONG', 'VT', 'DangHoc', '2023-07-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0033', 'HADONGSV0033U', 'Huỳnh', 'Loan', '2002-03-29', 'Nam', '0911077442', 'Ninh Thuận', 'HADONG', 'VT', 'DangHoc', '2021-06-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0034', 'HADONGSV0034U', 'Đỗ', 'Toàn', '2002-03-04', 'Nam', '0999908710', 'Hà Tĩnh', 'HADONG', 'KT', 'DangHoc', '2020-12-11')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0035', 'HADONGSV0035U', 'Vũ', 'Dũng', '2003-05-10', 'Nu', '0906947470', 'Ninh Bình', 'HADONG', 'ATTT', 'DangHoc', '2024-02-13')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0036', 'HADONGSV0036U', 'Lý', 'Tuấn', '2000-09-08', 'Nam', '0915542413', 'Đà Nẵng', 'HADONG', 'VT', 'DangHoc', '2023-10-31')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0037', 'HADONGSV0037U', 'Đặng', 'Toàn', '2002-10-01', 'Nam', '0939987071', 'Nam Định', 'HADONG', 'ATTT', 'DangHoc', '2022-08-13')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0038', 'HADONGSV0038U', 'Phan', 'Hiền', '2005-09-18', 'Nam', '0969725696', 'Vĩnh Phúc', 'HADONG', 'KT', 'DangHoc', '2023-08-19')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0039', 'HADONGSV0039U', 'Hoàng', 'Vân', '2005-06-09', 'Nam', '0968244835', 'Hải Phòng', 'HADONG', 'KT', 'DangHoc', '2022-03-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0040', 'HADONGSV0040U', 'Mạc', 'Huy', '2004-12-27', 'Nam', '0963354360', 'Quảng Bình', 'HADONG', 'ATTT', 'DangHoc', '2020-12-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0041', 'HADONGSV0041U', 'Hoàng', 'Châu', '2006-02-01', 'Nu', '0968117393', 'Quảng Trị', 'HADONG', 'CNTT', 'DangHoc', '2023-04-26')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0042', 'HADONGSV0042U', 'Ngô', 'Vinh', '2001-11-12', 'Nam', '0955386252', 'Đà Nẵng', 'HADONG', 'VT', 'DangHoc', '2021-10-14')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0043', 'HADONGSV0043U', 'Ngô', 'Anh', '2003-04-26', 'Nam', '0943791264', 'Nghệ An', 'HADONG', 'VT', 'DangHoc', '2022-06-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0044', 'HADONGSV0044U', 'Bùi', 'Nghĩa', '2004-07-17', 'Nu', '0939347037', 'Vĩnh Phúc', 'HADONG', 'CNTT', 'DangHoc', '2021-06-22')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0045', 'HADONGSV0045U', 'Lưu', 'Khánh', '2005-02-08', 'Nam', '0925319390', 'Ninh Bình', 'HADONG', 'ATTT', 'DangHoc', '2023-03-31')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0046', 'HADONGSV0046U', 'Trịnh', 'Thịnh', '2005-02-17', 'Nam', '0964923968', 'Nghệ An', 'HADONG', 'ATTT', 'DangHoc', '2022-06-23')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0047', 'HADONGSV0047U', 'Lý', 'Tuấn', '2005-03-10', 'Nu', '0984609103', 'Thừa Thiên Huế', 'HADONG', 'KT', 'DangHoc', '2021-06-02')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0048', 'HADONGSV0048U', 'Đỗ', 'Anh', '2004-08-21', 'Nu', '0932811368', 'Hải Phòng', 'HADONG', 'CNTT', 'DangHoc', '2023-10-28')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0049', 'HADONGSV0049U', 'Trương', 'Châu', '2002-12-01', 'Nam', '0914234866', 'Vĩnh Phúc', 'HADONG', 'KT', 'BaoLuu', '2023-04-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0050', 'HADONGSV0050U', 'Bùi', 'Châu', '2004-12-09', 'Nu', '0963043628', 'Thanh Hóa', 'HADONG', 'VT', 'DangHoc', '2023-06-09')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0051', 'HADONGSV0051U', 'Hoàng', 'Thu', '2000-06-12', 'Nu', '0945378244', 'Nam Định', 'HADONG', 'CNTT', 'DangHoc', '2022-07-07')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0052', 'HADONGSV0052U', 'Đỗ', 'Sang', '2000-09-06', 'Nu', '0929649024', 'Phú Yên', 'HADONG', 'KT', 'BaoLuu', '2024-01-14')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0053', 'HADONGSV0053U', 'Mạc', 'Thảo', '2001-12-07', 'Nam', '0953753847', 'Nghệ An', 'HADONG', 'KT', 'DangHoc', '2023-03-08')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0054', 'HADONGSV0054U', 'Đỗ', 'Anh', '2005-06-23', 'Nam', '0902880139', 'Nam Định', 'HADONG', 'VT', 'BaoLuu', '2020-05-10')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0055', 'HADONGSV0055U', 'Hồ', 'Cường', '2005-11-27', 'Nu', '0995133135', 'Nam Định', 'HADONG', 'CNTT', 'DangHoc', '2023-11-29')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0056', 'HADONGSV0056U', 'Trần', 'Tuấn', '2004-04-21', 'Nam', '0942496619', 'Bình Thuận', 'HADONG', 'ATTT', 'DangHoc', '2024-10-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0057', 'HADONGSV0057U', 'Nguyễn', 'Hương', '2005-08-20', 'Nam', '0906024875', 'Hưng Yên', 'HADONG', 'VT', 'DangHoc', '2021-09-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0058', 'HADONGSV0058U', 'Đặng', 'Thu', '2002-01-12', 'Nu', '0933723929', 'Thừa Thiên Huế', 'HADONG', 'CNTT', 'DangHoc', '2022-03-27')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0059', 'HADONGSV0059U', 'Lưu', 'Thu', '2003-10-16', 'Nu', '0925799931', 'Quảng Trị', 'HADONG', 'VT', 'DangHoc', '2024-02-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0060', 'HADONGSV0060U', 'Dương', 'Nam', '2005-04-23', 'Nu', '0914633767', 'Bình Định', 'HADONG', 'VT', 'DangHoc', '2023-03-05')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0061', 'HADONGSV0061U', 'Lê', 'Nga', '2006-02-12', 'Nu', '0988329841', 'Thanh Hóa', 'HADONG', 'KT', 'DangHoc', '2020-12-11')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0062', 'HADONGSV0062U', 'Hồ', 'Tâm', '2003-03-16', 'Nu', '0975790763', 'Bình Thuận', 'HADONG', 'VT', 'DangHoc', '2020-12-27')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0063', 'HADONGSV0063U', 'Trần', 'Lam', '2006-08-17', 'Nam', '0975543804', 'Hà Nội', 'HADONG', 'CNTT', 'DangHoc', '2022-08-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0064', 'HADONGSV0064U', 'Trần', 'Oanh', '2001-10-23', 'Nu', '0937484968', 'Nam Định', 'HADONG', 'KT', 'DangHoc', '2022-11-14')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0065', 'HADONGSV0065U', 'Dương', 'Bích', '2005-11-27', 'Nam', '0947628421', 'Bình Định', 'HADONG', 'KT', 'DangHoc', '2023-12-21')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0066', 'HADONGSV0066U', 'Đỗ', 'Khánh', '2006-07-29', 'Nam', '0911288160', 'Quảng Ngãi', 'HADONG', 'KT', 'DangHoc', '2022-03-24')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0067', 'HADONGSV0067U', 'Lưu', 'An', '2005-01-25', 'Nu', '0992000181', 'Nghệ An', 'HADONG', 'KT', 'DangHoc', '2024-12-20')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0068', 'HADONGSV0068U', 'Hồ', 'Mai', '2003-12-27', 'Nam', '0987390750', 'Quảng Trị', 'HADONG', 'ATTT', 'BaoLuu', '2023-08-10')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0069', 'HADONGSV0069U', 'Trần', 'Hạnh', '2004-01-28', 'Nam', '0993300763', 'Hà Tĩnh', 'HADONG', 'ATTT', 'DangHoc', '2022-08-22')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0070', 'HADONGSV0070U', 'Hồ', 'Nghĩa', '2004-09-14', 'Nu', '0919903808', 'Ninh Bình', 'HADONG', 'CNTT', 'DangHoc', '2023-08-17')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0071', 'HADONGSV0071U', 'Hoàng', 'An', '2005-11-15', 'Nam', '0949470792', 'Phú Yên', 'HADONG', 'ATTT', 'DangHoc', '2022-05-27')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0072', 'HADONGSV0072U', 'Phan', 'An', '2003-12-22', 'Nam', '0983427740', 'Đà Nẵng', 'HADONG', 'ATTT', 'DangHoc', '2021-08-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0073', 'HADONGSV0073U', 'Ngô', 'Thảo', '2003-12-25', 'Nam', '0911249359', 'Bình Định', 'HADONG', 'CNTT', 'DangHoc', '2021-04-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0074', 'HADONGSV0074U', 'Bùi', 'Thu', '2003-01-17', 'Nam', '0982492789', 'Bắc Ninh', 'HADONG', 'VT', 'BaoLuu', '2024-08-17')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0075', 'HADONGSV0075U', 'Lê', 'Cường', '2005-12-11', 'Nu', '0943136724', 'Hải Phòng', 'HADONG', 'KT', 'DangHoc', '2022-02-07')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0076', 'HADONGSV0076U', 'Vương', 'Thi', '2004-10-02', 'Nu', '0938462182', 'Thanh Hóa', 'HADONG', 'KT', 'BaoLuu', '2023-12-20')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0077', 'HADONGSV0077U', 'Vũ', 'Quỳnh', '2002-12-25', 'Nu', '0951141152', 'Phú Yên', 'HADONG', 'CNTT', 'DangHoc', '2020-04-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0078', 'HADONGSV0078U', 'Hoàng', 'Hoàng', '2000-08-10', 'Nam', '0962348693', 'Bình Thuận', 'HADONG', 'CNTT', 'BaoLuu', '2024-11-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0079', 'HADONGSV0079U', 'Dương', 'Hoàng', '2001-01-03', 'Nu', '0903250915', 'Quảng Ngãi', 'HADONG', 'VT', 'DangHoc', '2023-12-23')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0080', 'HADONGSV0080U', 'Trần', 'Trung', '2006-02-12', 'Nu', '0936058371', 'Phú Yên', 'HADONG', 'KT', 'DangHoc', '2024-12-22')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0081', 'HADONGSV0081U', 'Hoàng', 'Bích', '2003-08-11', 'Nam', '0947120125', 'Ninh Thuận', 'HADONG', 'ATTT', 'BaoLuu', '2022-09-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0082', 'HADONGSV0082U', 'Đỗ', 'Khánh', '2002-09-07', 'Nu', '0926739444', 'Nam Định', 'HADONG', 'CNTT', 'BaoLuu', '2022-01-24')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0083', 'HADONGSV0083U', 'Hồ', 'Cường', '2003-11-14', 'Nu', '0966281236', 'Hải Phòng', 'HADONG', 'ATTT', 'DangHoc', '2023-02-28')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0084', 'HADONGSV0084U', 'Đỗ', 'Em', '2000-09-29', 'Nu', '0953001853', 'Vĩnh Phúc', 'HADONG', 'KT', 'DangHoc', '2022-07-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0085', 'HADONGSV0085U', 'Vương', 'Lâm', '2006-12-26', 'Nu', '0939753944', 'Phú Yên', 'HADONG', 'VT', 'BaoLuu', '2022-04-13')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0086', 'HADONGSV0086U', 'Tạ', 'Việt', '2006-07-04', 'Nu', '0975245444', 'Thừa Thiên Huế', 'HADONG', 'KT', 'BaoLuu', '2021-04-05')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0087', 'HADONGSV0087U', 'Ngô', 'Trung', '2002-03-30', 'Nam', '0982784430', 'Bình Định', 'HADONG', 'KT', 'BaoLuu', '2024-12-05')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0088', 'HADONGSV0088U', 'Tạ', 'Oanh', '2003-12-04', 'Nu', '0902804511', 'Thừa Thiên Huế', 'HADONG', 'VT', 'DangHoc', '2021-11-20')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0089', 'HADONGSV0089U', 'Vương', 'Em', '2006-11-09', 'Nam', '0929789819', 'Nam Định', 'HADONG', 'CNTT', 'BaoLuu', '2024-09-11')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0090', 'HADONGSV0090U', 'Lưu', 'Quang', '2005-09-13', 'Nu', '0903763756', 'Bắc Ninh', 'HADONG', 'KT', 'DangHoc', '2023-04-24')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0091', 'HADONGSV0091U', 'Phan', 'Khánh', '2000-11-19', 'Nu', '0918883624', 'Hưng Yên', 'HADONG', 'VT', 'DangHoc', '2024-04-16')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0092', 'HADONGSV0092U', 'Đinh', 'Hùng', '2000-08-13', 'Nu', '0921068662', 'Hà Nội', 'HADONG', 'CNTT', 'DangHoc', '2021-11-01')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0093', 'HADONGSV0093U', 'Mạc', 'Bảo', '2004-04-02', 'Nu', '0941388794', 'Thanh Hóa', 'HADONG', 'VT', 'DangHoc', '2021-03-09')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0094', 'HADONGSV0094U', 'Lê', 'Thắm', '2001-11-11', 'Nam', '0949047905', 'Thừa Thiên Huế', 'HADONG', 'VT', 'DangHoc', '2022-09-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0095', 'HADONGSV0095U', 'Đỗ', 'An', '2003-12-25', 'Nu', '0937331726', 'Nam Định', 'HADONG', 'CNTT', 'DangHoc', '2020-10-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0096', 'HADONGSV0096U', 'Ngô', 'Khánh', '2002-05-22', 'Nu', '0984823689', 'Quảng Bình', 'HADONG', 'VT', 'DangHoc', '2020-10-24')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0097', 'HADONGSV0097U', 'Lê', 'Nam', '2003-03-31', 'Nu', '0942893701', 'Bình Thuận', 'HADONG', 'VT', 'DangHoc', '2021-11-30')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0098', 'HADONGSV0098U', 'Vương', 'Bình', '2005-02-22', 'Nu', '0928248523', 'Quảng Trị', 'HADONG', 'CNTT', 'DangHoc', '2024-08-28')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0099', 'HADONGSV0099U', 'Vương', 'Lam', '2003-11-15', 'Nu', '0972088732', 'Hưng Yên', 'HADONG', 'VT', 'BaoLuu', '2023-08-27')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0100', 'HADONGSV0100U', 'Phan', 'Nga', '2004-04-03', 'Nu', '0956737009', 'Đà Nẵng', 'HADONG', 'CNTT', 'DangHoc', '2022-01-19')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0101', 'HADONGSV0101U', 'Tạ', 'Trung', '2002-05-14', 'Nu', '0988368127', 'Phú Yên', 'HADONG', 'CNTT', 'BaoLuu', '2024-09-10')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0102', 'HADONGSV0102U', 'Trịnh', 'Phong', '2004-08-21', 'Nam', '0993333433', 'Hải Phòng', 'HADONG', 'ATTT', 'DangHoc', '2020-04-09')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0103', 'HADONGSV0103U', 'Đặng', 'Nga', '2006-06-02', 'Nu', '0932984162', 'Vĩnh Phúc', 'HADONG', 'VT', 'DangHoc', '2023-04-27')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0104', 'HADONGSV0104U', 'Vũ', 'My', '2006-10-17', 'Nam', '0995299603', 'Nam Định', 'HADONG', 'CNTT', 'BaoLuu', '2021-02-18')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0105', 'HADONGSV0105U', 'Cao', 'Nghĩa', '2000-06-07', 'Nam', '0981046227', 'Quảng Bình', 'HADONG', 'VT', 'DangHoc', '2020-03-29')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0106', 'HADONGSV0106U', 'Hoàng', 'Thi', '2006-08-12', 'Nam', '0905454250', 'Vĩnh Phúc', 'HADONG', 'KT', 'BaoLuu', '2023-04-01')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0107', 'HADONGSV0107U', 'Đỗ', 'Loan', '2005-04-21', 'Nam', '0955441534', 'Đà Nẵng', 'HADONG', 'VT', 'DangHoc', '2020-05-27')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0108', 'HADONGSV0108U', 'Đặng', 'Khánh', '2001-10-12', 'Nu', '0959164135', 'Hà Tĩnh', 'HADONG', 'CNTT', 'DangHoc', '2022-05-23')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0109', 'HADONGSV0109U', 'Trần', 'Dũng', '2006-07-25', 'Nam', '0951322629', 'Thái Bình', 'HADONG', 'ATTT', 'BaoLuu', '2021-12-13')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0110', 'HADONGSV0110U', 'Đinh', 'Trọng', '2001-02-20', 'Nu', '0924076743', 'Nghệ An', 'HADONG', 'VT', 'DangHoc', '2021-08-14')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0111', 'HADONGSV0111U', 'Dương', 'Ly', '2003-02-06', 'Nam', '0942747655', 'Quảng Nam', 'HADONG', 'VT', 'BaoLuu', '2022-06-04')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0112', 'HADONGSV0112U', 'Huỳnh', 'Bảo', '2005-09-23', 'Nu', '0967964849', 'Quảng Trị', 'HADONG', 'VT', 'DangHoc', '2021-07-07')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0113', 'HADONGSV0113U', 'Lưu', 'Nam', '2001-06-17', 'Nu', '0933507813', 'Ninh Thuận', 'HADONG', 'KT', 'DangHoc', '2022-11-17')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0114', 'HADONGSV0114U', 'Phan', 'Quang', '2001-06-02', 'Nam', '0917068340', 'Nam Định', 'HADONG', 'CNTT', 'DangHoc', '2023-11-06')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0115', 'HADONGSV0115U', 'Dương', 'Phong', '2001-02-07', 'Nu', '0999857135', 'Bình Định', 'HADONG', 'KT', 'DangHoc', '2024-08-15')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0116', 'HADONGSV0116U', 'Đỗ', 'Oanh', '2001-01-01', 'Nu', '0908206514', 'Thái Bình', 'HADONG', 'VT', 'DangHoc', '2023-04-25')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0117', 'HADONGSV0117U', 'Dương', 'Phát', '2004-04-29', 'Nam', '0974766170', 'Thừa Thiên Huế', 'HADONG', 'VT', 'DangHoc', '2022-07-22')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0118', 'HADONGSV0118U', 'Lê', 'Phát', '2003-08-14', 'Nam', '0985526279', 'Phú Yên', 'HADONG', 'CNTT', 'DangHoc', '2022-08-03')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0119', 'HADONGSV0119U', 'Trần', 'Linh', '2004-04-19', 'Nam', '0982725782', 'Phú Yên', 'HADONG', 'CNTT', 'DangHoc', '2024-01-13')
ON CONFLICT ("MaSV") DO NOTHING;
INSERT INTO "SinhVien" ("MaSV", "userId", "Ho", "Ten", "NgaySinh", "GioiTinh", "SDT", "DiaChi", "MaCoSo", "MaKhoa", "TrangThai", "NgayNhapHoc")
VALUES ('HADONGSV0120', 'HADONGSV0120U', 'Lê', 'Thắm', '2000-12-26', 'Nam', '0954589107', 'Hà Tĩnh', 'HADONG', 'CNTT', 'DangHoc', '2022-03-13')
ON CONFLICT ("MaSV") DO NOTHING;

-- ---- GiangVien ----
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV001', 'HADONGGV001U', 'Trương', 'Bình', 'TS', NULL, '0964344059', 'HADONG', 'ATTT', 'TamNghi', '2014-07-22')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV002', 'HADONGGV002U', 'Đỗ', 'Lam', 'CN', 'GTV', '0987519329', 'HADONG', 'VT', 'DangCongTac', '2021-05-19')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV003', 'HADONGGV003U', 'Cao', 'Cường', 'PGS', 'GTV', '0982253183', 'HADONG', 'VT', 'TamNghi', '2019-03-02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV004', 'HADONGGV004U', 'Phan', 'Phát', 'TS', 'PGS', '0932526712', 'HADONG', 'CNTT', 'DangCongTac', '2012-01-14')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV005', 'HADONGGV005U', 'Bùi', 'Lan', 'ThS', 'PGS', '0968200859', 'HADONG', 'VT', 'DangCongTac', '2011-08-03')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV006', 'HADONGGV006U', 'Mạc', 'Sơn', 'ThS', NULL, '0978050026', 'HADONG', 'VT', 'TamNghi', '2023-03-26')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV007', 'HADONGGV007U', 'Hoàng', 'Giang', 'CN', NULL, '0948105297', 'HADONG', 'KT', 'DangCongTac', '2012-08-24')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV008', 'HADONGGV008U', 'Trịnh', 'Thi', 'ThS', NULL, '0981099344', 'HADONG', 'CNTT', 'TamNghi', '2023-03-15')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV009', 'HADONGGV009U', 'Lý', 'Quang', 'ThS', NULL, '0908663652', 'HADONG', 'CNTT', 'DangCongTac', '2019-02-22')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV010', 'HADONGGV010U', 'Vương', 'Cường', 'TS', NULL, '0973638431', 'HADONG', 'VT', 'TamNghi', '2010-11-15')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV011', 'HADONGGV011U', 'Ngô', 'Quỳnh', 'TS', 'PGS', '0936927866', 'HADONG', 'VT', 'DangCongTac', '2015-09-26')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV012', 'HADONGGV012U', 'Phan', 'Lâm', 'ThS', NULL, '0946414330', 'HADONG', 'KT', 'DangCongTac', '2018-12-27')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV013', 'HADONGGV013U', 'Lê', 'Thảo', 'ThS', NULL, '0957870419', 'HADONG', 'VT', 'DangCongTac', '2014-06-30')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV014', 'HADONGGV014U', 'Đặng', 'Quang', 'TS', NULL, '0984634602', 'HADONG', 'ATTT', 'TamNghi', '2015-12-09')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV015', 'HADONGGV015U', 'Hồ', 'Phong', 'PGS', NULL, '0924655416', 'HADONG', 'CNTT', 'DangCongTac', '2018-12-06')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV016', 'HADONGGV016U', 'Lý', 'An', 'CN', NULL, '0988413732', 'HADONG', 'CNTT', 'DangCongTac', '2019-09-21')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV017', 'HADONGGV017U', 'Lê', 'Trí', 'ThS', NULL, '0937200126', 'HADONG', 'ATTT', 'DangCongTac', '2020-04-01')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV018', 'HADONGGV018U', 'Đặng', 'Trang', 'CN', 'GTV', '0913807200', 'HADONG', 'VT', 'DangCongTac', '2015-11-03')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV019', 'HADONGGV019U', 'Đỗ', 'Oanh', 'CN', NULL, '0934939113', 'HADONG', 'ATTT', 'DangCongTac', '2014-07-02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV020', 'HADONGGV020U', 'Hồ', 'Việt', 'PGS', NULL, '0958511234', 'HADONG', 'CNTT', 'DangCongTac', '2013-04-12')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV021', 'HADONGGV021U', 'Hoàng', 'Cường', 'TS', NULL, '0931554944', 'HADONG', 'CNTT', 'DangCongTac', '2011-01-21')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV022', 'HADONGGV022U', 'Vũ', 'Nghĩa', 'ThS', NULL, '0918594622', 'HADONG', 'VT', 'TamNghi', '2023-02-17')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV023', 'HADONGGV023U', 'Hồ', 'Trang', 'TS', 'GTV', '0968740602', 'HADONG', 'KT', 'DangCongTac', '2017-10-13')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV024', 'HADONGGV024U', 'Tạ', 'Bảo', 'ThS', NULL, '0966304842', 'HADONG', 'ATTT', 'TamNghi', '2012-05-23')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV025', 'HADONGGV025U', 'Lý', 'Thu', 'TS', 'PGS', '0902199651', 'HADONG', 'CNTT', 'TamNghi', '2012-09-06')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV026', 'HADONGGV026U', 'Ngô', 'Trung', 'TS', 'GTV', '0931554443', 'HADONG', 'VT', 'TamNghi', '2021-04-02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV027', 'HADONGGV027U', 'Trịnh', 'Phát', 'TS', NULL, '0938512958', 'HADONG', 'CNTT', 'TamNghi', '2018-03-08')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV028', 'HADONGGV028U', 'Hoàng', 'Thảo', 'TS', NULL, '0908223615', 'HADONG', 'KT', 'TamNghi', '2023-06-02')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV029', 'HADONGGV029U', 'Đỗ', 'An', 'PGS', NULL, '0991940775', 'HADONG', 'VT', 'DangCongTac', '2021-09-01')
ON CONFLICT ("MaGV") DO NOTHING;
INSERT INTO "GiangVien" ("MaGV", "userId", "Ho", "Ten", "HocVi", "HocHam", "SDT", "MaCoSo", "MaKhoa", "TrangThai", "NgayVaoLam")
VALUES ('HADONGGV030', 'HADONGGV030U', 'Dương', 'Tâm', 'CN', NULL, '0957011890', 'HADONG', 'ATTT', 'DangCongTac', '2011-04-27')
ON CONFLICT ("MaGV") DO NOTHING;

-- ---- PhongHoc ----
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA001', 'Phong 1', 'Toa C', 3, 40, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA002', 'Phong 2', 'Toa A', 5, 120, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA003', 'Phong 3', 'Toa D', 4, 60, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA004', 'Phong 4', 'Toa B', 5, 40, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA005', 'Phong 5', 'Toa D', 2, 30, 'HoiTruong', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA006', 'Phong 6', 'Toa A', 1, 40, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA007', 'Phong 7', 'Toa A', 3, 80, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA008', 'Phong 8', 'Toa C', 5, 30, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA009', 'Phong 9', 'Toa B', 3, 30, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA010', 'Phong 10', 'Toa A', 2, 40, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA011', 'Phong 11', 'Toa B', 2, 50, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA012', 'Phong 12', 'Toa D', 1, 30, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA013', 'Phong 13', 'Toa C', 2, 40, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA014', 'Phong 14', 'Toa D', 4, 50, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA015', 'Phong 15', 'Toa A', 4, 50, 'MayTinh', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA016', 'Phong 16', 'Toa A', 3, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA017', 'Phong 17', 'Toa B', 2, 100, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA018', 'Phong 18', 'Toa D', 4, 120, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA019', 'Phong 19', 'Toa B', 4, 50, 'LyThuyet', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;
INSERT INTO "PhongHoc" ("MaPhong", "TenPhong", "ToaNha", "Tang", "SucChua", "LoaiPhong", "MaCoSo", "TrangThai")
VALUES ('PHA020', 'Phong 20', 'Toa B', 4, 80, 'ThiNghiem', 'HADONG', 'HoatDong')
ON CONFLICT ("MaPhong") DO NOTHING;

-- ---- LopHocPhan ----
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1015-HADONG-01', 'CS1015', 'HK20251', 'HADONG', 'HADONGGV010', 'CS1015-01', 15, 4, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1005-HADONG-01', 'CS1005', 'HK20251', 'HADONG', 'HADONGGV005', 'CS1005-01', 10, 5, 'Hybrid', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1014-HADONG-01', 'CS1014', 'HK20251', 'HADONG', 'HADONGGV003', 'CS1014-01', 15, 1, 'Online', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1002-HADONG-01', 'CS1002', 'HK20251', 'HADONG', 'HADONGGV011', 'CS1002-01', 10, 2, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1009-HADONG-01', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV008', 'CS1009-01', 12, 4, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1007-HADONG-01', 'CS1007', 'HK20251', 'HADONG', 'HADONGGV015', 'CS1007-01', 60, 19, 'Online', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1006-HADONG-01', 'CS1006', 'HK20251', 'HADONG', 'HADONGGV024', 'CS1006-01', 50, 0, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1009-HADONG-02', 'CS1009', 'HK20251', 'HADONG', 'HADONGGV023', 'CS1009-02', 60, 5, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1014-HADONG-02', 'CS1014', 'HK20251', 'HADONG', 'HADONGGV021', 'CS1014-02', 50, 18, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1014-HADONG-03', 'CS1014', 'HK20251', 'HADONG', 'HADONGGV014', 'CS1014-03', 40, 6, 'Online', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1005-HADONG-02', 'CS1005', 'HK20251', 'HADONG', 'HADONGGV030', 'CS1005-02', 50, 18, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1006-HADONG-02', 'CS1006', 'HK20251', 'HADONG', 'HADONGGV001', 'CS1006-02', 50, 5, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1002-HADONG-02', 'CS1002', 'HK20251', 'HADONG', 'HADONGGV023', 'CS1002-02', 40, 2, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1002-HADONG-03', 'CS1002', 'HK20251', 'HADONG', 'HADONGGV027', 'CS1002-03', 50, 13, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1013-HADONG-01', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV020', 'CS1013-01', 60, 20, 'Hybrid', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1012-HADONG-01', 'CS1012', 'HK20251', 'HADONG', 'HADONGGV004', 'CS1012-01', 40, 10, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1003-HADONG-01', 'CS1003', 'HK20251', 'HADONG', 'HADONGGV001', 'CS1003-01', 40, 16, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1013-HADONG-02', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV008', 'CS1013-02', 60, 13, 'Hybrid', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1013-HADONG-03', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV019', 'CS1013-03', 30, 10, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1003-HADONG-02', 'CS1003', 'HK20251', 'HADONG', 'HADONGGV028', 'CS1003-02', 50, 11, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1013-HADONG-04', 'CS1013', 'HK20251', 'HADONG', 'HADONGGV001', 'CS1013-04', 60, 2, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1014-HADONG-04', 'CS1014', 'HK20251', 'HADONG', 'HADONGGV018', 'CS1014-04', 50, 9, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1010-HADONG-01', 'CS1010', 'HK20251', 'HADONG', 'HADONGGV023', 'CS1010-01', 40, 13, 'Hybrid', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1007-HADONG-02', 'CS1007', 'HK20251', 'HADONG', 'HADONGGV013', 'CS1007-02', 40, 1, 'Offline', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;
INSERT INTO "LopHocPhan" ("MaLopHP", "MaHP", "MaHocKy", "MaCoSo", "MaGV", "TenLopHP", "SiSoToiDa", "SiSoHienTai", "HinhThucHoc", "TrangThaiLop")
VALUES ('CS1010-HADONG-02', 'CS1010', 'HK20251', 'HADONG', 'HADONGGV027', 'CS1010-02', 40, 6, 'Hybrid', 'Mo')
ON CONFLICT ("MaLopHP") DO NOTHING;

-- ---- LichHoc ----
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0001', 'CS1015-HADONG-01', 'PHA015', 2, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0002', 'CS1015-HADONG-01', 'PHA017', 2, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0003', 'CS1015-HADONG-01', 'PHA015', 2, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0004', 'CS1005-HADONG-01', 'PHA017', 2, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0005', 'CS1005-HADONG-01', 'PHA010', 7, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0006', 'CS1005-HADONG-01', 'PHA018', 3, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0007', 'CS1014-HADONG-01', 'PHA020', 2, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0008', 'CS1014-HADONG-01', 'PHA002', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0009', 'CS1002-HADONG-01', 'PHA010', 7, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0010', 'CS1002-HADONG-01', 'PHA003', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0011', 'CS1009-HADONG-01', 'PHA017', 3, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0012', 'CS1009-HADONG-01', 'PHA019', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0013', 'CS1007-HADONG-01', 'PHA007', 4, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0014', 'CS1007-HADONG-01', 'PHA008', 3, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0015', 'CS1006-HADONG-01', 'PHA008', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0016', 'CS1006-HADONG-01', 'PHA008', 4, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0017', 'CS1009-HADONG-02', 'PHA006', 7, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0018', 'CS1009-HADONG-02', 'PHA018', 4, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0019', 'CS1014-HADONG-02', 'PHA015', 3, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0020', 'CS1014-HADONG-02', 'PHA020', 4, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0021', 'CS1014-HADONG-03', 'PHA001', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0022', 'CS1014-HADONG-03', 'PHA020', 5, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0023', 'CS1014-HADONG-03', 'PHA010', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0024', 'CS1005-HADONG-02', 'PHA018', 4, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0025', 'CS1005-HADONG-02', 'PHA012', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0026', 'CS1006-HADONG-02', 'PHA013', 3, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0027', 'CS1006-HADONG-02', 'PHA009', 7, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0028', 'CS1006-HADONG-02', 'PHA014', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0029', 'CS1002-HADONG-02', 'PHA006', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0030', 'CS1002-HADONG-02', 'PHA004', 5, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0031', 'CS1002-HADONG-03', 'PHA020', 4, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0032', 'CS1002-HADONG-03', 'PHA006', 7, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0033', 'CS1013-HADONG-01', 'PHA003', 4, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0034', 'CS1013-HADONG-01', 'PHA008', 7, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0035', 'CS1012-HADONG-01', 'PHA006', 6, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0036', 'CS1012-HADONG-01', 'PHA010', 3, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0037', 'CS1003-HADONG-01', 'PHA004', 3, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0038', 'CS1003-HADONG-01', 'PHA013', 6, 7, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0039', 'CS1013-HADONG-02', 'PHA016', 6, 7, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0040', 'CS1013-HADONG-02', 'PHA010', 5, 1, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0041', 'CS1013-HADONG-03', 'PHA010', 2, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0042', 'CS1013-HADONG-03', 'PHA002', 2, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0043', 'CS1013-HADONG-03', 'PHA005', 2, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0044', 'CS1003-HADONG-02', 'PHA014', 7, 4, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0045', 'CS1003-HADONG-02', 'PHA009', 5, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0046', 'CS1013-HADONG-04', 'PHA015', 6, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0047', 'CS1013-HADONG-04', 'PHA011', 4, 10, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0048', 'CS1013-HADONG-04', 'PHA008', 5, 10, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0049', 'CS1014-HADONG-04', 'PHA017', 5, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0050', 'CS1014-HADONG-04', 'PHA019', 4, 1, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0051', 'CS1010-HADONG-01', 'PHA002', 5, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0052', 'CS1010-HADONG-01', 'PHA002', 7, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0053', 'CS1007-HADONG-02', 'PHA010', 3, 1, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0054', 'CS1007-HADONG-02', 'PHA016', 3, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0055', 'CS1007-HADONG-02', 'PHA012', 3, 10, 3, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0056', 'CS1010-HADONG-02', 'PHA014', 7, 4, 2, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0057', 'CS1010-HADONG-02', 'PHA020', 6, 7, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
INSERT INTO "LichHoc" ("MaLich", "MaLopHP", "MaPhong", "ThuTrongTuan", "TietBatDau", "SoTiet", "NgayBatDau", "NgayKetThuc")
VALUES ('LHA0058', 'CS1010-HADONG-02', 'PHA004', 4, 4, 4, '2025-09-01', '2025-12-31')
ON CONFLICT ("MaLich") DO NOTHING;
