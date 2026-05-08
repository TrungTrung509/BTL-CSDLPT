# Hướng Dẫn Chạy Backend - Hệ Thống Đăng Ký Học Phần CSDL Phân Tán

> **Phiên bản:** 1.1.1  
> **Cập nhật:** 2026-04-25  
> **Người viết:** Cursor AI Agent

---

## Mục Lục

1. [Tổng Quan Hệ Thống](#1-tổng-quan-hệ-thống)
2. [Yêu Cầu Hệ Thống](#2-yêu-cầu-hệ-thống)
3. [Chuẩn Bị Môi Trường](#3-chuẩn-bị-môi-trường)
4. [Khởi Động Services (Docker)](#4-khởi-động-services-docker)
5. [Kiểm Tra Database Đã Sẵn Sàng](#5-kiểm-tra-database-đã-sẵn-sàng)
6. [Seed Dữ Liệu](#6-seed-dữ-liệu)
7. [Setup FDW (Foreign Data Wrapper)](#7-setup-fdw-foreign-data-wrapper)
8. [Setup Replication](#8-setup-replication)
9. [Bootstrap Elasticsearch](#9-bootstrap-elasticsearch)
10. [Chạy Backend](#10-chạy-backend)
11. [Kiểm Tra Backend Đã Chạy Thành Công](#11-kiểm-tra-backend-đã-chạy-thành-công)
12. [Test Flow Cơ Bản](#12-test-flow-cơ-bản)
13. [Danh Sách Lỗi Thường Gặp](#13-danh-sách-lỗi-thường-gặp)
14. [Checklist Cuối Cùng](#14-checklist-cuối-cùng)

---

## 1. Tổng Quan Hệ Thống

### 1.1 Kiến Trúc

```
┌─────────────────────────────────────────────────────────────────┐
│                        BACKEND (FastAPI)                        │
│                    Port: 8000 | Swagger: /docs                  │
└─────────────────────────────────────────────────────────────────┘
              │                    │                    │
              ▼                    ▼                    ▼
┌──────────────────┐  ┌──────────────────┐  ┌──────────────────┐
│  HADONG (Pub)    │  │  NGOCTRUC (Sub)  │  │  HOALAC (Sub)    │
│  Port: 5432      │◄─┼─  Port: 5433    │  │  Port: 5434      │
│  - Publisher     │  │  - Subscriber    │  │  - Subscriber    │
│  - Common+Local  │  │  - Common+Local  │  │  - Common+Local  │
└──────────────────┘  └──────────────────┘  └──────────────────┘
         │
         ▼
┌──────────────────┐  ┌──────────────────┐
│     Redis        │  │  Elasticsearch   │
│  Port: 6379     │  │   Port: 9200      │
│  - Cache        │  │   - Search Index  │
└──────────────────┘  └──────────────────┘
```

### 1.2 Các Thành Phần

| Component | Version | Port | Container Name | Mục đích |
|-----------|---------|------|----------------|----------|
| FastAPI Backend | Python 3.12 | 8000 | `csdlpt_backend` | API Server |
| PostgreSQL HADONG | 15 | 5432 | `csdlpt_hadong` | Site chính (Publisher) |
| PostgreSQL NGOCTRUC | 15 | 5433 | `csdlpt_ngoctruc` | Site phụ (Subscriber) |
| PostgreSQL HOALAC | 15 | 5434 | `csdlpt_hoalac` | Site phụ (Subscriber) |
| Redis | 7 | 6379 | `csdlpt_redis` | Cache layer |
| Elasticsearch | 8.11.0 | 9200 | `csdlpt_elasticsearch` | Search engine |
| Kibana | 8.11.0 | 5601 | `csdlpt_kibana` | Dashboard (optional) |

### 1.3 Database Schema

**Bảng COMMON (nhân bản trên cả 3 site):**
- `CoSo` - Thông tin cơ sở
- `users` - Người dùng hệ thống
- `Khoa` - Thông tin khoa
- `HocPhan` - Danh mục học phần
- `HocKy` - Thông tin học kỳ
- `TienQuyet` - Học phần tiên quyết

**Bảng LOCAL (riêng từng site):**
- `SinhVien` - Sinh viên
- `GiangVien` - Giảng viên
- `PhongHoc` - Phòng học
- `LopHocPhan` - Lớp học phần
- `LichHoc` - Lịch học
- `DangKy` - Đăng ký
- `DangKy_Log` - Log đăng ký

### 1.4 Entry Point

- **File:** `app/main.py`
- **Framework:** FastAPI
- **Run command:** `uvicorn main:app --host 0.0.0.0 --port 8000 --reload`
- **Swagger docs:** `http://localhost:8000/docs`
- **Health check:** `GET /health`

### 1.5 Routers (12 routers)

| Router | Prefix | Mô tả |
|--------|--------|-------|
| `auth` | `/auth` | Đăng nhập, refresh token |
| `user` | `/users` | Thông tin user |
| `branch` | `/branches` | CRUD CoSo |
| `department` | `/departments` | CRUD Khoa |
| `course` | `/courses` | CRUD HocPhan |
| `semester` | `/semesters` | CRUD HocKy |
| `class_section` | `/class-sections` | CRUD LopHocPhan + schedule |
| `classroom` | `/classrooms` | CRUD PhongHoc |
| `schedule` | `/schedules` | Xem lichHoc |
| `student_management` | `/students` | CRUD SinhVien |
| `teacher` | `/teachers` | CRUD GiangVien |
| `enrollment` | `/enrollments` | Đăng ký học phần |

---

## 2. Yêu Cầu Hệ Thống

### 2.1 Phần Mềm Bắt Buộc

| Phần mềm | Phiên bản tối thiểu | Mục đích |
|----------|---------------------|----------|
| Docker Desktop | 4.x trở lên | Chạy containers |
| Docker Compose | V2 (built-in Docker) | Quản lý multi-container |
| PowerShell | 5.1 trở lên | Chạy scripts (Windows) |

### 2.2 Cấu Hình Máy Đề Xuất

- **RAM:** 8GB trở lên (Elasticsearch cần 512MB)
- **CPU:** 4 cores trở lên
- **Disk:** 10GB trống cho Docker volumes

### 2.3 Cổng Cần Thiết

| Cổng | Service | Trạng thái |
|------|---------|-----------|
| 5432 | PostgreSQL HADONG | Phải trống |
| 5433 | PostgreSQL NGOCTRUC | Phải trống |
| 5434 | PostgreSQL HOALAC | Phải trống |
| 6379 | Redis | Phải trống |
| 9200 | Elasticsearch | Phải trống |
| 5601 | Kibana | Phải trống |
| 8000 | Backend API | Phải trống |

---

## 3. Chuẩn Bị Môi Trường

### Bước 1: Kiểm tra Docker đã cài đặt

Mở PowerShell và chạy:

```powershell
docker --version
docker compose version
```

**Kết quả mong đợi:**
```
Docker version 24.x.x, build xxxxx
Docker Compose version v2.x.x
```

### Bước 2: Di chuyển đến thư mục project

```powershell
cd "e:\2.PTIT\DangKiHocPhan\BTL-CSDLPT"
```

### Bước 3: Kiểm tra cấu trúc thư mục

```powershell
ls -la
```

**Thư mục quan trọng:**
- `docker/` - Chứa docker-compose.yml và .env
- `app/` - Backend code
- `db/` - Database schemas
- `sql/` - SQL scripts (indexes, FDW, views)
- `seeds/` - Seed data
- `infra/scripts/` - Scripts khởi động

### Bước 4: Kiểm tra file .env

Kiểm tra file `docker/.env` đã tồn tại chưa. Nếu chưa, tạo file với nội dung:

```powershell
# Di chuyển đến thư mục docker
cd docker

# Tạo file .env nếu chưa có
if (-not (Test-Path .env)) {
    @"
# ============================================================
# CẤU HÌNH MÔI TRƯỜNG - CSDL PHÂN TÁN
# ============================================================

# PostgreSQL HADONG (Publisher)
HADONG_PORT=5432
HADONG_DB=csdlpt_hadong
HADONG_USER=csdlpt_user
HADONG_PASSWORD=csdlpt_pass

# PostgreSQL NGOCTRUC (Subscriber)
NGOCTRUC_PORT=5433
NGOCTRUC_DB=csdlpt_ngoctruc
NGOCTRUC_USER=csdlpt_user
NGOCTRUC_PASSWORD=csdlpt_pass

# PostgreSQL HOALAC (Subscriber)
HOALAC_PORT=5434
HOALAC_DB=csdlpt_hoalac
HOALAC_USER=csdlpt_user
HOALAC_PASSWORD=csdlpt_pass

# Redis
REDIS_PORT=6379

# Elasticsearch
ES_PORT=9200

# Kibana
KIBANA_PORT=5601

# Backend
BACKEND_PORT=8000

# Security
SECRET_KEY=my_super_secret_key_123
ALGORITHM=HS256
"@ | Out-File -FilePath .env -Encoding UTF8
    Write-Host "Da tao file .env"
}
```

Quay lại thư mục gốc:

```powershell
cd ..
```

---

## 4. Khởi Động Services (Docker)

### Bước 1: Dừng containers cũ (nếu có)

```powershell
docker compose -f docker\docker-compose.yml down -v
```

> **Giải thích:** `-v` xóa volumes để reset hoàn toàn. Bỏ `-v` nếu muốn giữ dữ liệu.

### Bước 2: Build và khởi động tất cả containers

```powershell
docker compose -f docker\docker-compose.yml up -d --build
```

**Thời gian:** 5-10 phút lần đầu (pull images + build backend)

### Bước 3: Chờ containers healthy

```powershell
# Chờ 30 giây
Start-Sleep -Seconds 30
```

### Bước 4: Kiểm tra trạng thái containers

```powershell
docker compose -f docker\docker-compose.yml ps
```

**Kết quả mong đợi:**
```
NAME                IMAGE                    STATUS          PORTS
csdlpt_backend      csdlpt-backend           running         0.0.0.0:8000->8000/tcp
csdlpt_hadong       postgres:15-alpine       running         0.0.0.0:5432->5432/tcp
csdlpt_ngoctruc     postgres:15-alpine       running         0.0.0.0:5433->5432/tcp
csdlpt_hoalac       postgres:15-alpine       running         0.0.0.0:5434->5432/tcp
csdlpt_redis        redis:7-alpine           running         0.0.0.0:6379->6379/tcp
csdlpt_elasticsearch elasticsearch:8.11.0    running         0.0.0.0:9200->9200/tcp
csdlpt_kibana       kibana:8.11.0            running         0.0.0.0:5601->5601/tcp
```

### Bước 5: Kiểm tra health của từng container

```powershell
docker inspect --format='{{.State.Health.Status}}' csdlpt_hadong
docker inspect --format='{{.State.Health.Status}}' csdlpt_elasticsearch
```

**Kết quả mong đợi:** `healthy`

---

## 5. Kiểm Tra Database Đã Sẵn Sàng

### Bước 1: Kiểm tra kết nối PostgreSQL HADONG

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT 1;"
```

**Kết quả mong đợi:**
```
?column?
----------
        1
(1 row)
```

### Bước 2: Kiểm tra tables đã được tạo

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "\dt"
```

**Kết quả mong đợi:** Liệt kê các bảng: CoSo, users, Khoa, HocPhan, HocKy, TienQuyet, SinhVien, GiangVien, PhongHoc, LopHocPhan, LichHoc, DangKy, DangKy_Log

### Bước 3: Kiểm tra tương tự cho NGOCTRUC và HOALAC

```powershell
docker exec -it csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc -c "\dt"
docker exec -it csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac -c "\dt"
```

### Bước 4: Kiểm tra Redis

```powershell
docker exec -it csdlpt_redis redis-cli ping
```

**Kết quả mong đợi:** `PONG`

### Bước 5: Kiểm tra Elasticsearch

```powershell
Invoke-RestMethod -Uri "http://localhost:9200" | ConvertTo-Json
```

**Kết quả mong đợi:** JSON chứa `"cluster_name": "csdlpt-cluster"`

---

## 6. Seed Dữ Liệu

### Bước 1: Generate seed data (nếu chưa có)

Kiểm tra xem file seed đã tồn tại chưa:

```powershell
Test-Path "seeds\output\common\001_common_data.sql"
Test-Path "seeds\output\site_hadong\001_site_data.sql"
```

Nếu chưa có, chạy script generate:

```powershell
# Cài đặt dependencies cho seed
cd seeds
pip install -r requirements.txt

# Generate data
python generate_data.py

# Quay lại thư mục gốc
cd ..
```

### Bước 2: Seed tất cả dữ liệu (PowerShell)

```powershell
powershell -ExecutionPolicy Bypass -File infra\scripts\seed.ps1
```

**Script này sẽ:**
1. Copy SQL files vào containers
2. Chạy `001_common_data.sql` (CoSo, Khoa, users, HocPhan, HocKy, TienQuyet)
3. Chạy `001_site_data.sql` cho HADONG (SinhVien, GiangVien, PhongHoc, LopHocPhan, LichHoc)
4. Chạy `001_site_data.sql` cho NGOCTRUC
5. Chạy `001_site_data.sql` cho HOALAC
6. Chạy `indexes.sql` cho tất cả các site

**Thời gian:** 1-2 phút

### Bước 3: Xác nhận seed thành công

```powershell
# Kiểm tra số lượng SinhVien mỗi site
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT COUNT(*) FROM \"SinhVien\";"
docker exec -it csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc -c "SELECT COUNT(*) FROM \"SinhVien\";"
docker exec -it csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac -c "SELECT COUNT(*) FROM \"SinhVien\";"
```

**Kết quả mong đợi:**
```
count
-------
   120
(1 row)
```

### Bước 4: Kiểm tra HocPhan đã seed

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT COUNT(*) FROM \"HocPhan\";"
```

**Kết quả mong đợi:**
```
count
-------
    20
(1 row)
```

### Bước 5: Kiểm tra account Admin

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT \"userId\", username, role FROM users WHERE role = 'Admin';"
```

**Kết quả mong đợi:**
```
userid | username |   role
-------+----------+---------
admin  | admin    | Admin
(1 row)
```

---

## 7. Setup FDW (Foreign Data Wrapper)

### Bước 1: Chạy FDW setup container

Container `csdlpt_fdw_setup` đã được định nghĩa trong docker-compose.yml và sẽ tự động chạy khi `docker compose up`. Nếu cần chạy lại:

```powershell
docker compose -f docker\docker-compose.yml up -d fdw_setup
```

### Bước 2: Kiểm tra FDW đã setup

```powershell
# Kiểm tra trên HADONG - xem có foreign server chưa
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT * FROM pg_foreign_server;"
```

**Kết quả mong đợi:**
```
   name        | owner | foreign_data_wrapper
---------------+-------+----------------------
ngoctruc_server | csdlpt_user | postgres_fdw
hoalac_server   | csdlpt_user | postgres_fdw
(2 rows)
```

### Bước 3: Kiểm tra foreign tables

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT * FROM information_schema.foreign_tables;"
```

---

## 8. Setup Replication

### Bước 1: Chạy SQL setup publisher

```powershell
Get-Content sql\replication\01_setup_publisher.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

### Bước 2: Xác nhận publication đã tạo

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT * FROM pg_publication;"
```

**Kết quả mong đợi:**
```
  pubname          | pubowner | puballtables | pubinsert | pubupdate | pubdelete | pubtruncate
-------------------+----------+--------------+-----------+-----------+-----------+-------------
pub_common_tables  |    16384 | f            | t         | t         | t         | t
(1 row)
```

### Bước 3: Xác nhận tables trong publication

```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT pubname, tablename FROM pg_publication_tables;"
```

**Kết quả mong đợi:**
```
     pubname      | tablename
------------------+-------------
pub_common_tables | CoSo
pub_common_tables | users
pub_common_tables | Khoa
pub_common_tables | HocPhan
pub_common_tables | HocKy
pub_common_tables | TienQuyet
(6 rows)
```

---

## 9. Bootstrap Elasticsearch

### Bước 1: Kiểm tra Elasticsearch index

```powershell
Invoke-RestMethod -Uri "http://localhost:9200/_cat/indices"
```

### Bước 2: Tạo index HocPhan (nếu chưa có)

```powershell
Invoke-RestMethod -Uri "http://localhost:9200/hocphan" -Method PUT -ContentType "application/json" -Body '{"mappings":{"properties":{"MaHP":{"type":"keyword"},"TenHP":{"type":"text","analyzer":"standard"},"SoTinChi":{"type":"integer"},"LoaiHocPhan":{"type":"keyword"},"MaKhoa":{"type":"keyword"},"TrangThai":{"type":"keyword"}}}}'
```

### Bước 3: Seed dữ liệu vào Elasticsearch

Nếu có script `scripts/bootstrap_search.py`:

```powershell
pip install elasticsearch requests
python scripts/bootstrap_search.py
```

---

## 10. Chạy Backend

### Bước 1: Backend đã chạy tự động qua Docker

Khi `docker compose up`, backend container đã chạy. Kiểm tra:

```powershell
docker logs csdlpt_backend --tail 20
```

**Kết quả mong đợi (cuối log):**
```
INFO:     Uvicorn running on http://0.0.0.0:8000
INFO:     Application startup complete.
All tables created and default data seeded successfully!
```

### Bước 2: Nếu cần chạy backend thủ công (development)

```powershell
cd app

# Tạo virtual environment
python -m venv .venv

# Kích hoạt
.venv\Scripts\Activate.ps1

# Cài dependencies
pip install -r requirements.txt

# Chạy
uvicorn main:app --reload --host 0.0.0.0 --port 8000
```

---

## 11. Kiểm Tra Backend Đã Chạy Thành Công

### Bước 1: Test health check

```powershell
Invoke-RestMethod -Uri "http://localhost:8000/health" | ConvertTo-Json
```

**Kết quả mong đợi:**
```json
{
    "status": 200,
    "message": "He thong dang hoat dong",
    "data": {
        "status": "healthy",
        "version": "1.1.1"
    }
}
```

### Bước 2: Test root endpoint

```powershell
Invoke-RestMethod -Uri "http://localhost:8000/" | ConvertTo-Json
```

**Kết quả mong đợi:**
```json
{
    "status": "online",
    "message": "Welcome to BTL-CSDLPT API"
}
```

### Bước 3: Mở Swagger UI

Mở trình duyệt và truy cập:
```
http://localhost:8000/docs
```

---

## 12. Test Flow Cơ Bản

### Test 1: Đăng nhập với tài khoản Admin

**POST** `/auth/login`

```powershell
$body = @{
    username = "admin"
    password = "admin123"
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri "http://localhost:8000/auth/login" -Method POST -ContentType "application/json" -Body $body
$response | ConvertTo-Json
```

**Kết quả mong đợi:**
```json
{
    "access_token": "eyJ...",
    "refresh_token": "eyJ...",
    "token_type": "bearer"
}
```

### Test 2: Lấy thông tin user hiện tại

```powershell
$headers = @{
    "Authorization" = "Bearer $token"
}

Invoke-RestMethod -Uri "http://localhost:8000/users/me" -Headers $headers | ConvertTo-Json
```

### Test 3: Lấy danh sách CoSo

```powershell
Invoke-RestMethod -Uri "http://localhost:8000/branches" -Headers $headers | ConvertTo-Json
```

### Test 4: Lấy danh sách HocPhan

```powershell
Invoke-RestMethod -Uri "http://localhost:8000/courses" -Headers $headers | ConvertTo-Json
```

### Test 5: Lấy danh sách LopHocPhan

```powershell
Invoke-RestMethod -Uri "http://localhost:8000/class-sections" -Headers $headers | ConvertTo-Json
```

### Test 6: Login với tài khoản SinhVien

```powershell
# Mã SV mẫu: HADONGSV0001 (password = MaSV)
$body = @{
    username = "HADONGSV0001"
    password = "HADONGSV0001"
} | ConvertTo-Json

$response = Invoke-RestMethod -Uri "http://localhost:8000/auth/login" -Method POST -ContentType "application/json" -Body $body
$response | ConvertTo-Json
```

### Test 7: Lấy thông tin SinhVien

```powershell
Invoke-RestMethod -Uri "http://localhost:8000/students/HADONGSV0001" -Headers $headers | ConvertTo-Json
```

---

## 13. Danh Sách Lỗi Thường Gặp

### Lỗi 1: Docker containers không khởi động được

**Dấu hiệu:** `docker compose up` bị lỗi hoặc container exit ngay lập tức

**Nguyên nhân:** Cổng đã bị chiếm bởi service khác

**Cách xử lý:**
```powershell
# Kiểm tra cổng đang dùng
netstat -ano | findstr "5432"
netstat -ano | findstr "6379"
netstat -ano | findstr "9200"

# Tắt service chiếm cổng hoặc đổi cổng trong .env
```

### Lỗi 2: Database connection error

**Dấu hiệu:** Backend log hiển thị `Could not connect to database`

**Nguyên nhân:** Database chưa healthy khi backend start

**Cách xử lý:**
```powershell
# Kiểm tra health
docker inspect --format='{{.State.Health.Status}}' csdlpt_hadong

# Restart backend
docker restart csdlpt_backend

# Xem logs
docker logs csdlpt_backend
```

### Lỗi 3: Table chưa tồn tại

**Dấu hiệu:** Lỗi `relation "CoSo" does not exist`

**Nguyên nhân:** Schema SQL chưa được chạy

**Cách xử lý:**
```powershell
# Chạy lại seed
powershell -ExecutionPolicy Bypass -File infra\scripts\seed.ps1
```

### Lỗi 4: Login không thành công

**Dấu hiệu:** API trả về `401 Unauthorized`

**Nguyên nhân:** 
- Sai password
- Account chưa được seed
- JWT secret không đúng

**Cách xử lý:**
```powershell
# Kiểm tra account tồn tại
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT * FROM users WHERE username = 'admin';"

# Kiểm tra password hash
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT password FROM users WHERE username = 'admin';"
```

### Lỗi 5: Redis connection error

**Dấu hiệu:** Lỗi `Error connecting to Redis`

**Nguyên nhân:** Redis container chưa healthy

**Cách xử lý:**
```powershell
# Kiểm tra Redis
docker exec -it csdlpt_redis redis-cli ping

# Restart Redis
docker restart csdlpt_redis
```

### Lỗi 6: Elasticsearch không sẵn sàng

**Dấu hiệu:** Lỗi `ConnectionError` khi truy cập Elasticsearch

**Nguyên nhân:** Elasticsearch cần thời gian khởi động (1-2 phút)

**Cách xử lý:**
```powershell
# Chờ và thử lại
Start-Sleep -Seconds 60
Invoke-RestMethod -Uri "http://localhost:9200/_cluster/health"
```

### Lỗi 7: FDW setup thất bại

**Dấu hiệu:** Lỗi khi query foreign tables

**Nguyên nhân:** FDW setup container chưa chạy thành công

**Cách xử lý:**
```powershell
# Chạy lại FDW setup
docker compose -f docker\docker-compose.yml up -d fdw_setup

# Kiểm tra logs
docker logs csdlpt_fdw_setup
```

### Lỗi 8: Replication không hoạt động

**Dấu hiệu:** Dữ liệu common không đồng bộ giữa các site

**Nguyên nhân:** Publication/Subscription chưa được setup

**Cách xử lý:**
```powershell
# Kiểm tra publication
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT * FROM pg_publication;"

# Chạy lại replication SQL
Get-Content sql\replication\01_setup_publisher.sql | docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

---

## 14. Checklist Cuối Cùng

Đánh dấu từng bước khi hoàn thành:

### Chuẩn bị
- [ ] Docker Desktop đã cài và đang chạy
- [ ] File `docker/.env` đã tồn tại với đầy đủ biến môi trường
- [ ] Các cổng cần thiết đang trống (5432, 5433, 5434, 6379, 9200, 5601, 8000)

### Khởi động Services
- [ ] `docker compose up -d` đã chạy thành công
- [ ] Tất cả containers đều `running`
- [ ] PostgreSQL HADONG health = `healthy`
- [ ] PostgreSQL NGOCTRUC health = `healthy`
- [ ] PostgreSQL HOALAC health = `healthy`
- [ ] Redis health = `healthy`
- [ ] Elasticsearch health = `healthy`

### Database Setup
- [ ] Tables đã được tạo (CoSo, users, Khoa, HocPhan, HocKy, TienQuyet, SinhVien, ...)
- [ ] Seed data đã chạy thành công
- [ ] 120 SinhVien mỗi site
- [ ] 30 GiangVien mỗi site
- [ ] 20 HocPhan (common)
- [ ] Account admin/admin123 tồn tại

### FDW & Replication
- [ ] FDW setup container đã chạy
- [ ] Foreign servers đã được tạo (ngoctruc_server, hoalac_server)
- [ ] Publication `pub_common_tables` đã tạo
- [ ] Replication slots đã tạo (slot_ngoctruc, slot_hoalac)

### Backend
- [ ] Backend container đang chạy
- [ ] Backend logs không có lỗi
- [ ] Health check trả về `healthy`

### Test
- [ ] Swagger UI mở được: `http://localhost:8000/docs`
- [ ] Login admin thành công (admin/admin123)
- [ ] Lấy danh sách CoSo thành công
- [ ] Lấy danh sách HocPhan thành công
- [ ] Login SinhVien thành công (HADONGSV0001/HADONGSV0001)

---

## Thông Tin Tài Khoản Mặc Định

### Admin
| Thuộc tính | Giá trị |
|------------|---------|
| Username | `admin` |
| Password | `admin123` |
| Role | Admin |
| MaCoSo | HADONG |

### SinhVien (mẫu - 120 SV mỗi site)
| Username | Password | MaSV | MaCoSo |
|----------|----------|------|--------|
| HADONGSV0001 | HADONGSV0001 | HADONGSV0001 | HADONG |
| HADONGSV0002 | HADONGSV0002 | HADONGSV0002 | HADONG |
| ... | ... | ... | ... |
| NGOCTRUC0001 | NGOCTRUC0001 | NGOCTRUC0001 | NGOCTRUC |
| HOALAC0001 | HOALAC0001 | HOALAC0001 | HOALAC |

### GiangVien (mẫu - 30 GV mỗi site)
| Username | Password | MaGV | MaCoSo |
|----------|----------|------|--------|
| HADONGGV001 | HADONGGV001 | HADONGGV001 | HADONG |
| HADONGGV002 | HADONGGV002 | HADONGGV002 | HADONG |
| ... | ... | ... | ... |
| NGOCTRUCGV001 | NGOCTRUCGV001 | NGOCTRUCGV001 | NGOCTRUC |
| HOALACGV001 | HOALACGV001 | HOALACGV001 | HOALAC |

---

## Các Lệnh Hữu Ích

### Xem logs
```powershell
# Tất cả containers
docker compose -f docker\docker-compose.yml logs -f

# Backend
docker logs -f csdlpt_backend

# Database cụ thể
docker logs -f csdlpt_hadong
```

### Restart services
```powershell
# Restart backend
docker restart csdlpt_backend

# Restart tất cả
docker compose -f docker\docker-compose.yml restart
```

### Dọn dẹp hoàn toàn
```powershell
docker compose -f docker\docker-compose.yml down -v
docker system prune -f
```

### Truy cập PostgreSQL trực tiếp
```powershell
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong
```

---

## Liên Hệ & Hỗ Trợ

Nếu gặp lỗi không có trong danh sách, kiểm tra:
1. Docker logs: `docker compose -f docker\docker-compose.yml logs`
2. Container health: `docker inspect <container_name> | Select-String Health`
3. Stack Overflow / GitHub issues của project

---

**Chúc bạn chạy thành công!**
