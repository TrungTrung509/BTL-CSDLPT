-- ============================================================
-- CƠ SỞ DỮ LIỆU PHÂN TÁN - ĐỀ TÀI: ĐĂNG KÝ HỌC PHẦN
-- Tác giả: Nhóm CSDL Phân Tán
-- Mô tả: Cấu hình PUBLISHER tại site HADONG
-- Chạy: sql/replication/README.md
-- ============================================================

-- ============================================================
-- BƯỚC 1: Kiểm tra và bật WAL logical replication
-- ============================================================
-- PostgreSQL phải có wal_level = logical
-- Kiểm tra giá trị hiện tại:
--   SHOW wal_level;
--
-- Nếu chưa đúng, cần thêm vào postgresql.conf:
--   wal_level = logical
--   max_replication_slots = 10
--   max_wal_senders = 10
--
-- Với Docker Compose, thêm vào docker-compose.yml:
--   command: postgres -c wal_level=logical -c max_replication_slots=10 -c max_wal_senders=10

-- ============================================================
-- BƯỚC 2: Tạo REPLICATION SLOT (đặt trước khi tạo publication)
-- ============================================================
-- Replication slot đảm bảo dữ liệu không bị mất khi subscriber offline
SELECT pg_create_physical_replication_slot('slot_ngoctruc');
SELECT pg_create_physical_replication_slot('slot_hoalac');

-- Kiểm tra slot đã tạo:
-- SELECT * FROM pg_replication_slots;

-- ============================================================
-- BƯỚC 3: Tạo PUBLICATION cho các bảng DÙNG CHUNG
-- ============================================================
-- Xóa publication cũ nếu tồn tại (để chạy lại script)
DROP PUBLICATION IF EXISTS pub_common_tables;

-- Tạo publication mới với ALL TABLES
-- Cú pháp: CREATE PUBLICATION pub_name FOR TABLE table1, table2, ...;
CREATE PUBLICATION pub_common_tables FOR TABLE
    CoSo,
    Khoa,
    HocPhan,
    HocKy,
    TienQuyet;

-- ============================================================
-- BƯỚC 4: Xác nhận Publication đã tạo
-- ============================================================
-- Kiểm tra publication:
-- SELECT * FROM pg_publication;

-- Kiểm tra các bảng trong publication:
-- SELECT pubname, tablename
-- FROM pg_publication_tables
-- WHERE pubname = 'pub_common_tables';

-- ============================================================
-- GHI CHÚ QUAN TRỌNG
-- ============================================================
-- 1. Publication phải được tạo tại site PUBLISHER (HADONG)
-- 2. Site SUBSCRIBER (NGOCTRUC, HOALAC) sẽ subscribe vào publication này
-- 3. Tất cả các bảng trong publication phải có PRIMARY KEY
--    hoặc REPLICA IDENTITY để replication hoạt động đúng
-- 4. Thêm bảng mới vào publication:
--    ALTER PUBLICATION pub_common_tables ADD TABLE ten_bang_moi;
-- 5. Xóa bảng khỏi publication:
--    ALTER PUBLICATION pub_common_tables DROP TABLE ten_bang_cu;

-- ============================================================
-- THÔNG TIN KẾT NỐI
-- ============================================================
-- Publisher: csdlpt_hadong (port 5432)
-- Database: csdlpt_hadong
-- User: csdlpt_user
-- Publication: pub_common_tables
-- Replication Slots: slot_ngoctruc, slot_hoalac
