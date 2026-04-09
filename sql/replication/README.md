# SQL REPLICATION - Hướng dẫn cấu hình Logical Replication

## Mục đích

Thư mục này chứa các file SQL để cấu hình **Logical Replication** giữa 3 site PostgreSQL.

## Kiến trúc

```
┌─────────────────────────────────────────────────────────────────┐
│                    LOGICAL REPLICATION                          │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐                                              │
│  │   HADONG      │  ← PUBLISHER (Master)                       │
│  │  (port 5432)  │     pub_common_tables                       │
│  └──────┬───────┘                                              │
│         │                                                      │
│    ┌────┴────┐                                                 │
│    │  Replication Stream                                      │
│    ▼          ▼                                                 │
│ ┌─────────┐ ┌─────────┐                                       │
│ │NGOCTRUC │ │ HOALAC  │  ← SUBSCRIBERS                         │
│ │(port5433)│ │(port5434)│     sub_common_tables                │
│ └─────────┘ └─────────┘                                       │
│                                                                 │
│ Các bảng đồng bộ: CoSo, Khoa, HocPhan, HocKy, TienQuyet       │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
```

## Các file

| File | Mô tả | Chạy tại |
|------|-------|----------|
| `01_setup_publisher.sql` | Tạo Publication tại HADONG | csdlpt_hadong |
| `02_setup_subscribers.sql` | Tạo Subscription tại NGOCTRUC & HOALAC | csdlpt_ngoctruc, csdlpt_hoalac |

## Yêu cầu trước khi cấu hình

### 1. PostgreSQL cấu hình replication

Trong `docker-compose.yml`, thêm command cho PostgreSQL:

```yaml
postgres_hadong:
  # ... other config ...
  command: postgres -c wal_level=logical -c max_replication_slots=10 -c max_wal_senders=10
```

### 2. Các bảng đã tồn tại

Đảm bảo các bảng common đã được tạo tại cả 3 site:
- CoSo
- Khoa
- HocPhan
- HocKy
- TienQuyet

### 3. Primary Key hoặc REPLICA IDENTITY

Mỗi bảng cần có **PRIMARY KEY** để replication hoạt động:

```sql
-- Kiểm tra primary key:
SELECT table_name, constraint_name
FROM information_schema.table_constraints
WHERE constraint_type = 'PRIMARY KEY'
AND table_schema = 'public';
```

## Cách thực thi

### Bước 1: Cấu hình Publisher (tại HADONG)

Chạy script tại site HADONG:

```powershell
# Copy file vào container
docker cp sql/replication/01_setup_publisher.sql csdlpt_hadong:/tmp/

# Chạy script
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -f /tmp/01_setup_publisher.sql
```

**Hoặc sử dụng Get-Content:**

```powershell
Get-Content sql/replication/01_setup_publisher.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

### Bước 2: Cấu hình Subscribers (tại NGOCTRUC & HOALAC)

Chạy script tại **từng site** subscriber:

```powershell
# ===== NGOCTRUC =====
Get-Content sql/replication/02_setup_subscribers.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc

# ===== HOALAC =====
Get-Content sql/replication/02_setup_subscribers.sql | docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac
```

## Cách kiểm tra thành công

### 1. Kiểm tra Publication (tại HADONG)

```sql
-- Xem danh sách publications
SELECT * FROM pg_publication;

-- Xem các bảng trong publication
SELECT pubname, tablename
FROM pg_publication_tables
WHERE pubname = 'pub_common_tables';
```

### 2. Kiểm tra Subscription (tại mỗi Subscriber)

```sql
-- Xem danh sách subscriptions
SELECT * FROM pg_subscription;

-- Xem trạng thái replication
SELECT * FROM pg_stat_subscription;

-- Xem tiến trình sync dữ liệu
SELECT subname, srsubstate
FROM pg_subscription_rel;
```

### 3. Kiểm tra dữ liệu đã đồng bộ

```sql
-- Tại mỗi site, đếm số bản ghi (phải giống nhau)
SELECT 'CoSo' as tbl, COUNT(*) as cnt FROM CoSo
UNION ALL SELECT 'Khoa', COUNT(*) FROM Khoa
UNION ALL SELECT 'HocPhan', COUNT(*) FROM HocPhan
UNION ALL SELECT 'HocKy', COUNT(*) FROM HocKy
UNION ALL SELECT 'TienQuyet', COUNT(*) FROM TienQuyet;
```

### 4. Kiểm tra từ Docker logs

```powershell
# Logs từ publisher
docker logs csdlpt_hadong --tail=50 | findstr -i "replication"

# Logs từ subscriber
docker logs csdlpt_ngoctruc --tail=50 | findstr -i "replication"
```

## Cách khắc phục lỗi

### Lỗi: "could not connect to publisher"

1. Kiểm tra network:
```powershell
docker network inspect csdlpt_network
```

2. Kiểm tra kết nối từ subscriber đến publisher:
```powershell
docker exec -it csdlpt_ngoctruc ping postgres_hadong
```

3. Kiểm tra pg_hba.conf:
```sql
-- Trong container, kiểm tra:
docker exec -it csdlpt_hadong cat /var/lib/postgresql/data/pg_hba.conf
```

### Lỗi: "slot name does not exist"

1. Chạy lại script publisher trước:
```powershell
Get-Content sql/replication/01_setup_publisher.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

2. Kiểm tra slot đã tạo:
```sql
SELECT * FROM pg_replication_slots WHERE slot_name LIKE 'slot_%';
```

### Lỗi: "initial snapshot is missing"

1. Drop subscription cũ:
```sql
DROP SUBSCRIPTION IF EXISTS sub_common_tables;
```

2. Tạo lại subscription:
```powershell
Get-Content sql/replication/02_setup_subscribers.sql | docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc
```

### Lỗi: Dữ liệu không đồng bộ

1. Refresh publication:
```sql
ALTER SUBSCRIPTION sub_common_tables REFRESH PUBLICATION;
```

2. Kiểm tra trạng thái:
```sql
SELECT * FROM pg_subscription_rel;
```

## Thêm/Bớt bảng khỏi Replication

### Thêm bảng mới vào Publication

```sql
-- Tại Publisher (HADONG)
ALTER PUBLICATION pub_common_tables ADD TABLE ten_bang_moi;
```

### Xóa bảng khỏi Publication

```sql
-- Tại Publisher (HADONG)
ALTER PUBLICATION pub_common_tables DROP TABLE ten_bang_cu;
```

## Xóa cấu hình Replication

```sql
-- Tại Subscriber
DROP SUBSCRIPTION IF EXISTS sub_common_tables;

-- Tại Publisher
DROP PUBLICATION IF EXISTS pub_common_tables;
SELECT pg_drop_replication_slot('slot_ngoctruc');
SELECT pg_drop_replication_slot('slot_hoalac');
```

## Lưu ý quan trọng

1. **Replication chỉ đi một chiều**: Từ HADONG → NGOCTRUC/HOALAC
2. **Không update trực tiếp tại Subscriber**: Sẽ bị ghi đè bởi replication
3. **Slot giữ WAL**: Nếu subscriber offline lâu, WAL có thể đầy. Monitor replication lag.
4. **Primary Key bắt buộc**: Mỗi bảng phải có primary key để replication hoạt động

---

*Nguồn: PostgreSQL Logical Replication Documentation*
