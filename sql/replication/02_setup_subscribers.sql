-- ============================================================
-- CƠ SỞ DỮ LIỆU PHÂN TÁN - ĐỀ TÀI: ĐĂNG KÝ HỌC PHẦN
-- Tác giả: Nhóm CSDL Phân Tán
-- Mô tả: Cấu hình SUBSCRIBER tại site NGOCTRUC và HOALAC
-- Chạy: sql/replication/README.md
-- ============================================================

-- ============================================================
-- LƯU Ý QUAN TRỌNG
-- ============================================================
-- Script này cần chạy TẠI 2 SITE SUBSCRIBER:
-- 1. csdlpt_ngoctruc (port 5433)
-- 2. csdlpt_hoalac (port 5434)
--
-- Trước khi chạy, đảm bảo:
-- 1. Các bảng common đã được tạo (CoSo, Khoa, HocPhan, HocKy, TienQuyet)
-- 2. Publication pub_common_tables đã được tạo tại HADONG
-- 3. Network giữa các container đã được cấu hình

-- ============================================================
-- BƯỚC 1: Xóa subscription cũ nếu tồn tại (để chạy lại script)
-- ============================================================
-- Khi drop subscription, slot replication phía publisher cũng được xóa
DROP SUBSCRIPTION IF EXISTS sub_common_tables;

-- ============================================================
-- BƯỚC 2: Tạo SUBSCRIPTION
-- ============================================================
-- Cú pháp: CREATE SUBSCRIPTION sub_name CONNECTION 'conninfo' PUBLICATION pub_name;
--
-- Với Docker network:
--   Host = tên service trong docker-compose (không phải localhost!)
--   Port = cổng bên trong container (5432 - không phải 5432 máy host)
--
-- Ví dụ connection string:
--   host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass

CREATE SUBSCRIPTION sub_common_tables
CONNECTION 'host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass'
PUBLICATION pub_common_tables
WITH (
  copy_data = false,
  create_slot = true,
  enabled = true,
  slot_name = 'slot_ngoctruc' -- ten_site: ngoctruc, hoalac
)  -- slot_name phải khớp với slot đã tạo ở publisher

-- ============================================================
-- BƯỚC 3: Kiểm tra Subscription
-- ============================================================
-- Kiểm tra subscription đã tạo:
-- SELECT * FROM pg_subscription;

-- Kiểm tra trạng thái replication:
-- SELECT * FROM pg_stat_subscription;

-- Kiểm tra lỗi replication (nếu có):
-- SELECT * FROM pg_subscription_rel;

-- ============================================================
-- BƯỚC 4: Đồng bộ dữ liệu ban đầu (Initial Data Copy)
-- ============================================================
-- Khi subscription được tạo, PostgreSQL tự động copy dữ liệu ban đầu
-- từ publisher. Quá trình này có thể mất vài phút tùy dung lượng data.
--
-- Kiểm tra tiến trình:
-- SELECT subname, srsubstate
-- FROM pg_subscription_rel
-- ORDER BY srsubstate;

-- Các trạng thái possible:
--   'i' = initialized (đang sync)
--   's' = synchronized (đã sync)
--   'r' = ready (đang replicate)

-- ============================================================
-- CÁCH XEM LOG REPLICATION
-- ============================================================
-- Trên máy host:
--   docker logs csdlpt_hadong | grep replication
--   docker logs csdlpt_ngoctruc | grep replication

-- Trong container:
--   docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT * FROM pg_stat_replication;"

-- ============================================================
-- XỬ LÝ LỖI THƯỜNG GẶP
-- ============================================================

-- Lỗi 1: "could not connect to publisher"
-- Nguyên nhân: Kết nối mạng không thành công
-- Giải pháp:
--   - Kiểm tra tên service trong docker network
--   - Kiểm tra firewall
--   - Kiểm tra pg_hba.conf cho phép kết nối replication

-- Lỗi 2: "slot name "xxx" does not exist"
-- Nguyên nhân: Slot chưa được tạo ở publisher
-- Giải pháp:
--   - Chạy lại 01_setup_publisher.sql trước
--   - Kiểm tra slot: SELECT * FROM pg_replication_slots;

-- Lỗi 3: "initial snapshot is missing"
-- Nguyên nhân: Subscription bị drop khi đang sync
-- Giải pháp:
--   - Drop subscription
--   - Tạo lại subscription
--   - Hoặc dùng: ALTER SUBSCRIPTION sub_common_tables REFRESH PUBLICATION;

-- ============================================================
-- THÔNG TIN CẤU HÌNH
-- ============================================================
-- Site HADONG (Publisher):
--   Host: postgres_hadong
--   Port: 5432 (internal), 5432 (external)
--   Database: csdlpt_hadong
--   Publication: pub_common_tables
--   Slot: slot_ngoctruc, slot_hoalac

-- Site NGOCTRUC (Subscriber):
--   Host: postgres_ngoctruc
--   Port: 5432 (internal), 5433 (external)
--   Database: csdlpt_ngoctruc
--   Subscription: sub_common_tables

-- Site HOALAC (Subscriber):
--   Host: postgres_hoalac
--   Port: 5432 (internal), 5434 (external)
--   Database: csdlpt_hoalac
--   Subscription: sub_common_tables
