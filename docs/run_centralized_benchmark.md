# Hướng dẫn chạy Benchmark: Centralized vs Distributed

## Tổng quan

Phần này hướng dẫn cách:
1. Bật hệ thống Docker với database tập trung
2. Setup schema centralized
3. Import dữ liệu từ 3 site phân tán
4. Chạy benchmark so sánh hiệu năng
5. Xem kết quả và tài liệu

---

## 1. Kiểm tra Docker đang chạy

```powershell
docker compose -f docker/docker-compose.yml ps
```

Kết quả mong đợi: 4 service `postgres_*` đều có status `healthy`.

| Service | Container | Port | Trạng thái |
|---------|-----------|------|-----------|
| postgres_hadong | csdlpt_hadong | 5432 | healthy |
| postgres_ngoctruc | csdlpt_ngoctruc | 5433 | healthy |
| postgres_hoalac | csdlpt_hoalac | 5434 | healthy |
| postgres_centralized | csdlpt_centralized | 5435 | healthy |

Nếu centralized chưa có, chạy:

```powershell
docker compose -f docker/docker-compose.yml up -d postgres_centralized
```

---

## 2. Kiểm tra 3 site phân tán đang hoạt động

```powershell
docker exec csdlpt_hadong pg_isready -U csdlpt_user -d csdlpt_hadong
docker exec csdlpt_ngoctruc pg_isready -U csdlpt_user -d csdlpt_ngoctruc
docker exec csdlpt_hoalac pg_isready -U csdlpt_user -d csdlpt_hoalac
```

Nếu trả về `accepting connections` là OK.

---

## 3. Setup database tập trung (schema + data import)

Chạy script tự động:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1
```

Script sẽ tự động:
1. Bật container `csdlpt_centralized`
2. Drop schema cũ (nếu có)
3. Tạo schema centralized từ `db/centralized/01_centralized_schema.sql`
4. Enable extension `dblink`
5. Import dữ liệu từ 3 site vào centralized
6. Fix column type cho `ReplicationOutbox`

Thời gian: ~30-60 giây

---

## 4. Kiểm tra dữ liệu sau khi import

### 4.1. Row count từng bảng

```powershell
docker exec -i csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "
SELECT 'CoSo' AS table_name, COUNT(*) FROM \"CoSo\"
UNION ALL SELECT 'Khoa', COUNT(*) FROM \"Khoa\"
UNION ALL SELECT 'HocPhan', COUNT(*) FROM \"HocPhan\"
UNION ALL SELECT 'HocKy', COUNT(*) FROM \"HocKy\"
UNION ALL SELECT 'SinhVien', COUNT(*) FROM \"SinhVien\"
UNION ALL SELECT 'LopHocPhan', COUNT(*) FROM \"LopHocPhan\"
UNION ALL SELECT 'DangKy', COUNT(*) FROM \"DangKy\"
UNION ALL SELECT 'PhongHoc', COUNT(*) FROM \"PhongHoc\"
UNION ALL SELECT 'GiangVien', COUNT(*) FROM \"GiangVien\"
UNION ALL SELECT 'DangKy_Log', COUNT(*) FROM \"DangKy_Log\"
UNION ALL SELECT 'AuditLog', COUNT(*) FROM \"AuditLog\"
UNION ALL SELECT 'NhatKyThaoTac', COUNT(*) FROM \"NhatKyThaoTac\"
UNION ALL SELECT 'ReplicationOutbox', COUNT(*) FROM \"ReplicationOutbox\";
"
```

### 4.2. Phân bố theo SourceSite

```powershell
docker exec -i csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "
SELECT 'SinhVien' AS table_name, \"SourceSite\", COUNT(*) FROM \"SinhVien\" GROUP BY \"SourceSite\"
UNION ALL
SELECT 'LopHocPhan', \"SourceSite\", COUNT(*) FROM \"LopHocPhan\" GROUP BY \"SourceSite\"
UNION ALL
SELECT 'DangKy', \"SourceSite\", COUNT(*) FROM \"DangKy\" GROUP BY \"SourceSite\"
ORDER BY table_name, \"SourceSite\";
"
```

### 4.3. Kết nối trực tiếp từ host

```powershell
psql -h localhost -p 5435 -U csdlpt_user -d csdlpt_centralized
```

---

## 5. Chạy Benchmark

### 5.1. Chạy script tự động

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1
```

Script sẽ:
1. Copy query files vào containers
2. Chạy 7 query centralized tại `csdlpt_centralized:5435`
3. Chạy 7 query distributed tại `csdlpt_hadong:5432` (với FDW)
4. Sinh file kết quả tại `docs/benchmark/benchmark_results_TIMESTAMP.md`

Thời gian: ~15-30 giây

### 5.2. Chạy từng query riêng lẻ

#### Centralized queries:

```powershell
docker exec -i csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT lhp.\"MaLopHP\", lhp.\"MaHP\", hp.\"TenHP\"
FROM \"LopHocPhan\" lhp
JOIN \"HocPhan\" hp ON lhp.\"MaHP\" = hp.\"MaHP\"
WHERE lhp.\"MaCoSo\" = 'HADONG'
ORDER BY lhp.\"MaLopHP\";
"
```

#### Distributed queries (tại HADONG với FDW):

```powershell
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "
EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)
SELECT \"MaCoSo\", COUNT(*) AS \"TongSinhVien\"
FROM \"vw_sinhvien_toantruong\"
GROUP BY \"MaCoSo\"
ORDER BY \"MaCoSo\";
"
```

---

## 6. Xem kết quả

Kết quả nằm trong file:

```
docs/benchmark/benchmark_results_YYYYMMDD_HHMMSS.md
```

Danh sách các file:

```powershell
Get-ChildItem docs/benchmark/*.md | Sort-Object LastWriteTime -Descending | Select-Object Name
```

---

## 7. Reset database centralized

Nếu cần reset hoàn toàn:

```powershell
# Xóa container
docker compose -f docker/docker-compose.yml rm -f postgres_centralized

# Xóa volume
docker volume rm csdlpt_centralized_data

# Chạy lại từ đầu
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1
```

---

## 8. Các file liên quan

| File | Mục đích |
|------|----------|
| `scripts/setup_centralized_db.ps1` | Setup schema + import data |
| `scripts/run_centralized_vs_distributed_benchmark.ps1` | Chạy benchmark tự động |
| `scripts/run_centralized_vs_distributed_benchmark.sh` | Chạy benchmark (bash) |
| `db/centralized/01_centralized_schema.sql` | Schema centralized |
| `db/centralized/02_import_data.sql` | Script import data |
| `sql/benchmark/centralized_queries.sql` | 7 query centralized |
| `sql/benchmark/distributed_queries.sql` | 7 query distributed |
| `docs/centralized_vs_distributed_comparison.md` | Báo cáo so sánh |
| `docs/viva_centralized_vs_distributed.md` | Câu hỏi vấn đáp |
| `docs/benchmark/benchmark_results_*.md` | Kết quả EXPLAIN ANALYZE |

---

## 9. Xử lý lỗi thường gặp

### Lỗi: `pg_isready` returns non-zero

```powershell
# Kiểm tra container có đang chạy không
docker ps -a | findstr csdlpt_centralized

# Xem logs
docker logs csdlpt_centralized --tail 50
```

### Lỗi: Import failed due to primary key conflict

```powershell
# Reset schema
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"

# Chạy lại setup
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1
```

### Lỗi: Distributed queries fail (FDW not set up)

```powershell
# Kiểm tra FDW servers
docker exec csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT foreign_server_name FROM information_schema.foreign_servers;"

# Nếu không có, chạy FDW setup
docker compose -f docker/docker-compose.yml up fdw_setup
```

### Lỗi: `dblink` extension not found

```powershell
# Enable dblink
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "CREATE EXTENSION IF NOT EXISTS dblink;"

# Chạy lại import
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -f /tmp/import_data.sql
```

---

## 10. Quy trình đầy đủ từ đầu

```powershell
# 1. Kiểm tra Docker
docker compose -f docker/docker-compose.yml ps

# 2. Bật centralized DB
docker compose -f docker/docker-compose.yml up -d postgres_centralized

# 3. Setup schema + import data
powershell -ExecutionPolicy Bypass -File scripts/setup_centralized_db.ps1

# 4. Verify data
docker exec -i csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "SELECT COUNT(*) FROM \"SinhVien\"; SELECT COUNT(*) FROM \"LopHocPhan\"; SELECT COUNT(*) FROM \"DangKy\";"

# 5. Chạy benchmark
powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1

# 6. Xem kết quả
Get-Content (Get-ChildItem docs/benchmark/*.md | Sort-Object LastWriteTime -Descending | Select-Object -First 1).FullName
```

---

## 11. Thông tin kết nối

| Môi trường | Host | Port | Database | User | Password |
|------------|------|------|----------|------|---------|
| HADONG | localhost | 5432 | csdlpt_hadong | csdlpt_user | csdlpt_pass |
| NGOCTRUC | localhost | 5433 | csdlpt_ngoctruc | csdlpt_user | csdlpt_pass |
| HOALAC | localhost | 5434 | csdlpt_hoalac | csdlpt_user | csdlpt_pass |
| **Centralized** | localhost | **5435** | csdlpt_centralized | csdlpt_user | csdlpt_pass |
