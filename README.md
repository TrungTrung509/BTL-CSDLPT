# 📚 BTL-CSDLPT — Hệ Thống Đăng Ký Học Phần Phân Tán

> **Bài tập lớn môn Cơ sở Dữ liệu Phân Tán**
> Hệ thống quản lý và đăng ký học phần trực tuyến theo mô hình **cơ sở dữ liệu phân tán** nhiều site, ứng dụng giao thức **Three-Phase Commit (3PC)**, **replication** và **failover** tự động.

---

## 📑 Mục Lục

- [Tổng quan hệ thống](#-tổng-quan-hệ-thống)
- [Kiến trúc phân tán](#-kiến-trúc-phân-tán)
- [Công nghệ sử dụng](#-công-nghệ-sử-dụng)
- [Cấu trúc thư mục](#-cấu-trúc-thư-mục)
- [API Endpoints](#-api-endpoints)
- [Các tính năng nổi bật](#-các-tính-năng-nổi-bật)
- [Benchmark & Monitoring](#-benchmark--monitoring)

---

## 🌐 Tổng Quan Hệ Thống

Hệ thống mô phỏng **Học viện Bưu chính Viễn thông (PTIT)** với 3 cơ sở đào tạo, mỗi cơ sở vận hành một **node PostgreSQL độc lập**. Sinh viên thuộc bất kỳ cơ sở nào đều có thể đăng ký lớp học phần tại cơ sở khác thông qua giao dịch phân tán.

### Ba cơ sở (3 Sites)

| Site | Cơ sở | Mã | Port DB | Domain |
|------|-------|-----|---------|--------|
| `HADONG` | Hà Đông | `HD` | `5432` | hadong.ptit.edu.vn |
| `NGOCTRUC` | Ngọc Trục | `NT` | `5433` | ngoctruc.ptit.edu.vn |
| `HOALAC` | Hòa Lạc | `HL` | `5434` | hoalac.ptit.edu.vn |

### 1. Luồng Đăng Ký Học Phần & Kiểm Soát Đồng Thời

```
SV POST /enrollments/register
  → Kafka publish (key=MaLopHP, 8 partitions, timeout 10s)
  → Worker (8 coroutines, Semaphore(20))
  → Enrollment3PCCoordinator [@retry_on_deadlock x3]
      [Pha 1] Chuẩn bị (Prepare Phase):
          [0] Kiểm tra trạng thái các site (ensure_sites_alive), Ghim kết nối (open_pinned_sessions)
          [1] Lớp L6 - Snapshot Check
          [2] Lớp L3 - pg_try_advisory_lock
          [3] Khởi tạo log giao dịch (INIT)
          [4] Lớp L4 - SELECT FOR UPDATE
          [5] Kiểm tra sĩ số cuối cùng
      [Pha 1] Trạng thái PREPARED
      [Pha 2] Báo trước cam kết (Pre-commit Phase): [Pha 2] Trạng thái PRECOMMIT (Điểm không thể quay đầu).
      [Pha 3] Cam kết thực tế (Commit Phase): [Pha 3] Ghi DB nghiệp vụ & COMMIT thực tế.
Giải phóng tài nguyên (Finally): FINALLY - Giải phóng tài nguyên (Nhả lock và đóng session).
  → reply → HTTP response
```

**Trạng thái 3PC:** `INIT` → `PREPARED` → **`PRECOMMIT`** → `COMMITTED` / `ABORTED`
- Crash sau PRECOMMIT → Recovery loop ép commit (mỗi 10s)
- Crash trước PRECOMMIT, stale > 30s → Recovery loop ép abort
# Kiểm soát đồng thời đăng ký học phần (3PC)

Flow xử lý từ request đến commit thành công, đảm bảo nhất quán phân tán.

## Tóm tắt các bước

### 1. Định tuyến hàng đợi (Kafka)
- Dùng `key = MaLopHP` → cùng lớp vào cùng partition → xử lý FIFO, tránh race condition.

### 2. Giới hạn tải (asyncio.Semaphore)
- Mỗi worker dùng `Semaphore(20)` → tối đa 20 giao dịch 3PC đồng thời, bảo vệ connection pool.

### 3. Tự động thử lại khi deadlock (`@retry_on_deadlock`)
- Bọc coordinator, thử lại tối đa 3 lần với exponential backoff nếu gặp deadlock (`40P01`) hoặc `409 Conflict`.

### 4. Kiểm tra site hoạt động
- Ping nhanh các site → nếu offline → dừng ngay (`503 Service Unavailable`).

### 5. Ghim kết nối (`open_pinned_sessions`)
- Giữ cố định connection/session đến các site DB.

### 6. Kiểm tra sơ bộ (snapshot check)
- Đọc nhanh (không khóa) kiểm tra: đã đăng ký chưa, lớp mở, đủ chỗ, trùng lịch/học phần → fail-fast.

### 7. Khóa phân tán (Advisory Locks)
- Dùng `pg_try_advisory_lock` trên các site:
  - `user-semester` (tránh đồng thời cùng sinh viên)
  - `section` (lớp mới/cũ)
- Sắp xếp khóa theo thứ tự alphabet để tránh deadlock. Bận → giải phóng + báo `409 Conflict`.

### 8. Khởi tạo log giao dịch (INIT)
- Tạo bản ghi `EnrollmentTransaction` với trạng thái `INIT` trên tất cả site.

### 9. Khóa dòng (`SELECT FOR UPDATE`)
- Khóa cứng dòng `LopHocPhan` tại site lớp mới (và cũ nếu đổi lớp).

### 10. Kiểm tra sĩ số cuối (prepare_validate)
- Refresh dữ liệu sau khóa → double-check `SiSoHienTai < SiSoToiDa` → nếu đầy thì abort.

### 11. Prepare thành công (PREPARED)
- Chuyển trạng thái giao dịch thành `PREPARED` trên tất cả site.

### 12. Điểm không thể quay lui (PRECOMMIT)
- Chuyển sang `PRECOMMIT` → bắt buộc commit sau đó (Auto Recovery sẽ xử lý nếu lỗi).

### 13. Commit nghiệp vụ (COMMITTED)
- Ghi `DangKy`, cập nhật sĩ số, cross-site link, chuyển trạng thái thành `COMMITTED`.
- Ghi log `NhatKyThaoTac` bằng kết nối AUTOCOMMIT riêng (luôn lưu).

### 14. Giải phóng tài nguyên
- Mở khóa Advisory Locks, đóng session/connection trả về pool.

---
## 🏗️ Kiến Trúc Phân Tán

```
┌─────────────────────────────────────────────────────────────────┐
│                        CLIENT (React/Vite)                      │
│                      http://localhost:3000                      │
└───────────────────────────┬─────────────────────────────────────┘
                            │ HTTP/REST
┌───────────────────────────▼─────────────────────────────────────┐
│                    BACKEND (FastAPI)                            │
│                      http://localhost:8000                      │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────────────────┐ │
│  │  REST API    │  │  3PC Service │  │  Replication Service   │ │
│  │  Routers     │  │  Coordinator │  │  (Outbox Pattern)      │ │
│  └──────┬───────┘  └──────┬───────┘  └───────────┬────────────┘ │
│         │                 │                       │             │
└─────────┼─────────────────┼───────────────────────┼─────────────┘
          │                 │                       │
┌─────────▼─────────────────▼───────────────────────▼─────────────┐
│                    MESSAGE BROKER (Apache Kafka)                │
│         Topics: registration_requests / registration_replies    │
└─────────────────────────────────────────────────────────────────┘
                           │
┌──────────────────────────▼─────────────────────────────────────┐
│                   DATA LAYER                                   │
│  ┌──────────────┐  ┌──────────────┐  ┌────────────────────────┐│
│  │  PostgreSQL  │  │  PostgreSQL  │  │  PostgreSQL            ││
│  │  (HADONG)    │  │  (NGOCTRUC)  │  │  (HOALAC)              ││
│  │  Port: 5432  │  │  Port: 5433  │  │  Port: 5434            ││
│  └──────────────┘  └──────────────┘  └────────────────────────┘│
│                    ┌─────────────────────────────────────────┐ │
│                    │  Elasticsearch (Full-text Search)       │ │
│                    │  Port: 9200                             │ │
│                    └─────────────────────────────────────────┘ │
└────────────────────────────────────────────────────────────────┘
          │
┌─────────▼──────────────────────────────────────────────────────┐
│                   MONITORING STACK                             │
│  Prometheus (9090)  →  Grafana (3001)                          │
│  Kibana (5601)  →  Elasticsearch (9200)                        │
│  cAdvisor (8085)  →  Kafka UI (8090)                           │
└────────────────────────────────────────────────────────────────┘
```

---

## 📁 Cấu Trúc Thư Mục

```
BTL-CSDLPT/
├── RESULTS/
│   ├── app/                        # Backend FastAPI
│   │   ├── main.py                 # Điểm khởi động, middleware, lifespan
│   │   ├── configs/                # Cấu hình DB, JWT, sites
│   │   │   ├── db.py               # Multi-engine SQLAlchemy setup
│   │   │   ├── sites.py            # Định nghĩa 3 sites
│   │   │   └── seed.py             # Seed dữ liệu khởi tạo
│   │   ├── models/                 # SQLAlchemy ORM models
│   │   │   ├── Students.py         # Model SinhVien
│   │   │   ├── Teachers.py         # Model GiangVien
│   │   │   ├── Enrollments.py      # Model DangKy
│   │   │   ├── EnrollmentTransactions.py  # 3PC transaction state
│   │   │   ├── ReplicationOutbox.py       # Outbox pattern
│   │   │   └── ...
│   │   ├── routers/                # FastAPI API routers
│   │   │   ├── auth.py             # Đăng nhập / token
│   │   │   ├── enrollment.py       # Đăng ký, hủy, đổi lớp
│   │   │   ├── course.py           # Học phần
│   │   │   ├── class_section.py    # Lớp học phần
│   │   │   ├── student_management.py
│   │   │   ├── teacher.py
│   │   │   ├── failover.py         # Quản lý failover
│   │   │   ├── report.py
│   │   │   └── ...
│   │   ├── services/               # Business logic
│   │   │   ├── enrollment_3pc/     # Giao thức 3PC
│   │   │   │   ├── coordinator.py  # 3PC Coordinator (Can/Pre/Do Commit)
│   │   │   │   ├── domain.py       # Domain logic
│   │   │   │   └── db.py           # DB operations cho 3PC
│   │   │   ├── EnrollmentService.py
│   │   │   ├── ReplicationService.py  # Outbox-based replication
│   │   │   ├── KafkaQueueService.py   # Publish-and-wait pattern
│   │   │   ├── KafkaWorkerService.py  # Consumer worker
│   │   │   ├── FailoverService.py
│   │   │   └── ...
│   │   ├── alembic_HADONG/         # Migration cho site Hà Đông
│   │   ├── alembic_NGOCTRUC/       # Migration cho site Ngọc Trục
│   │   ├── alembic_HOALAC/         # Migration cho site Hòa Lạc
│   │   ├── monitoring/             # Prometheus metrics
│   │   ├── security/               # JWT auth
│   │   ├── schemas/                # Pydantic schemas
│   │   ├── exceptions/             # Exception handlers
│   │   ├── enums/                  # Enum definitions
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   │
│   ├── client/                     # Frontend React/Vite
│   │   ├── src/
│   │   │   ├── pages/
│   │   │   ├── components/
│   │   │   └── ...
│   │   ├── package.json
│   │   └── vite.config.js
│   │
│   ├── docker/                     # Docker infrastructure
│   │   ├── docker-compose.yml      # Full stack (20+ services)
│   │   ├── .env / env.example
│   │   ├── monitoring/             # Prometheus + Grafana configs
│   │   ├── fdw/                    # Foreign Data Wrapper setup
│   │   ├── k6/                     # k6 load test scripts
│   │   └── healthcheck/
│   │
│   ├── Benchmark/                  # Benchmark scripts
│   │   ├── CoSo/                   # Benchmark hệ thống phân tán
│   │   ├── Khoa/                   # Benchmark tập trung so sánh
│   │   └── docker-compose.yml
│   │
│   ├── seeds/
│   │   └── seed_db.py              # Script seed 700 SV + 40 GV/site
│   │
│   ├── sql/                        # SQL scripts
│   ├── scripts/                    # Utility scripts
│   ├── search/                     # Elasticsearch index setup
│   ├── db/                         # Schema definitions
│   └── docs/                       # Tài liệu bổ sung
│
└── REPORT/                         # Báo cáo bài tập lớn
```

---

## 🔌 API Endpoints

Tất cả endpoint có thể xem đầy đủ tại **Swagger UI**: http://localhost:8000/docs

### Authentication

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| `POST` | `/auth/login` | Đăng nhập, nhận JWT token |
| `GET` | `/users/me` | Lấy thông tin user hiện tại |

### Đăng ký học phần (Enrollments)

| Method | Endpoint | Quyền | Mô tả |
|--------|----------|-------|-------|
| `POST` | `/enrollments/register` | SinhVien | Đăng ký lớp học phần (qua Kafka + 3PC) |
| `DELETE` | `/enrollments/cancel` | SinhVien | Hủy đăng ký lớp học phần |
| `POST` | `/enrollments/swap` | SinhVien | Đổi lớp học phần (3PC) |
| `GET` | `/enrollments/history` | SinhVien | Lịch sử đăng ký |
| `GET` | `/enrollments/timetable` | SinhVien | Thời khóa biểu cơ bản |
| `GET` | `/enrollments/my-timetable` | SinhVien | Thời khóa biểu đầy đủ |
| `GET` | `/enrollments/class-students` | Admin/GiangVien | Danh sách SV trong lớp |

### Quản lý học phần & lớp

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| `GET` | `/courses` | Danh sách học phần (hỗ trợ search full-text) |
| `GET/POST/PUT/DELETE` | `/class-sections` | CRUD lớp học phần |
| `GET` | `/semesters` | Danh sách học kỳ |
| `GET` | `/schedules` | Lịch học |

### Quản lý người dùng

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| `GET/POST` | `/students` | Quản lý sinh viên |
| `GET/POST` | `/teachers` | Quản lý giảng viên |
| `GET` | `/branches` | Danh sách cơ sở |
| `GET` | `/departments` | Danh sách khoa |

### Hệ thống & Monitoring

| Method | Endpoint | Mô tả |
|--------|----------|-------|
| `GET` | `/health` | Health check |
| `GET` | `/metrics` | Prometheus metrics |
| `GET/POST` | `/failover` | Quản lý failover thủ công |
| `GET` | `/reports` | Báo cáo tổng hợp |

---

## 🗄️ Mô Hình Dữ Liệu

### Phân hoạch dữ liệu (Data Partitioning)

| Bảng | Loại | Mô tả |
|------|------|-------|
| `HocPhan` (Courses) | **Replicated** | Replicate lên cả 3 sites qua Outbox Pattern |
| `HocKy` (Semesters) | **Replicated** | Đồng bộ học kỳ trên toàn hệ thống |
| `Users` (Users) | **Replicated** | Mỗi site chứa toàn bộ user của cả hệ thống |
| `SinhVien` (Students) | **Partitioned** | Mỗi site chỉ chứa SV của cơ sở đó |
| `GiangVien` (Teachers) | **Partitioned** | Mỗi site chỉ chứa GV của cơ sở đó |
| `LopHocPhan` (ClassSections) | **Partitioned** | Lớp thuộc site nào quản lý ở site đó |
| `PhongHoc` (Classrooms) | **Partitioned** | Phòng học cục bộ từng site |
| `LichHoc` (Schedules) | **Partitioned** | Lịch học cục bộ |
| `DangKy` (Enrollments) | **Distributed** | Ghi trên cả site SV và site lớp (2 bản) |
| `ReplicationOutbox` | Internal | Hàng đợi replication |
| `EnrollmentTransactions` | Internal | Trạng thái giao dịch 3PC |

### Truy cập xuyên site (FDW)

Hệ thống cấu hình **PostgreSQL Foreign Data Wrapper (FDW)** để site Hà Đông có thể query dữ liệu tổng hợp từ các site khác qua foreign table views.

---

## ✨ Các Tính Năng Nổi Bật

### 1. Three-Phase Commit (3PC) Protocol

Đảm bảo tính **atomicity** khi đăng ký học phần xuyên site:

```
Phase 1 - Can Commit:
  Coordinator → "Bạn có thể commit không?"
  Sites       → "Có thể" / "Không thể" (kiểm tra slot còn)

Phase 2 - Pre-Commit:
  Coordinator → "Chuẩn bị commit, giữ lock"
  Sites       → "Đã sẵn sàng, chờ lệnh cuối"

Phase 3 - Do Commit:
  Coordinator → "Commit ngay!"
  Sites       → "Đã commit" / Recovery nếu timeout
```

### 2. Kafka Queue & Async Worker

- **Publish-and-wait pattern**: API gửi request vào Kafka topic `registration_requests`, worker xử lý 3PC và reply vào `registration_replies`
- **8 partitions** cho topic requests → xử lý song song
- Tránh **lost update** và **race condition** khi nhiều SV đăng ký cùng lúc

### 3. Replication Service (Outbox Pattern)

- Thay đổi dữ liệu replicated (HocPhan, HocKy) được ghi vào bảng `ReplicationOutbox`
- Background loop chạy mỗi **10 giây** để dispatch các sự kiện pending
- Đảm bảo **eventual consistency** giữa các sites

### 4. Auto Recovery

- **Enrollment 3PC recovery**: Phục hồi giao dịch `IN_DOUBT` mỗi 10 giây
- **Replication recovery**: Gửi lại các event bị lỗi tự động
- **Failover Service**: Phát hiện và xử lý site down, chuyển sang chế độ degraded

### 5. Full-text Search

- Elasticsearch index cho học phần và lớp học phần
- Hỗ trợ tìm kiếm tiếng Việt, search gợi ý

### 6. Monitoring & Observability

- **Prometheus** thu thập metrics từ: FastAPI (`/metrics`), PostgreSQL exporters, Redis exporter, cAdvisor
- **Grafana** dashboard visualize latency, throughput, DB connections
- **HTTP metrics middleware**: đếm request/response, latency per endpoint

### 7. Alembic Multi-Database Migrations

Ba config Alembic riêng biệt (`alembic_HADONG`, `alembic_NGOCTRUC`, `alembic_HOALAC`) để migrate schema độc lập cho từng site.

---

## 📊 Benchmark & Monitoring

### Chạy Benchmark với k6

```bash
# Khởi động với profile benchmark
cd RESULTS/docker
docker compose --profile benchmark up -d k6
```

Cấu hình qua biến môi trường trong `.env`:
```env
BENCH_VUS=10              # Số virtual users
BENCH_ITERATIONS=100      # Số lần lặp
BENCH_TARGET_SITE=HADONG  # Site benchmark
```

### Benchmark so sánh phân tán theo khoa và theo cơ sở

```bash
cd RESULTS/Benchmark
docker compose up -d

# Chạy script benchmark
./run.ps1
```

### Xem Grafana Dashboard

1. Truy cập http://localhost:3001
2. Đăng nhập `admin` / `admin123`
3. Vào **Dashboards** → xem metrics realtime

---

## 👥 Tài Khoản Mặc Định

| Vai trò | Username | Password | Cơ sở |
|---------|----------|----------|-------|
| Admin | `admin` | `admin123` | HADONG |
| Sinh viên (HADONG) | `SVHD26CNTT001` | `123456` | HADONG |
| Sinh viên (HOALAC) | `SVHL26CNTT001` | `123456` | HOALAC |
| Sinh viên (NGOCTRUC) | `SVNT26CNTT001` | `123456` | NGOCTRUC |
| Giảng viên (HADONG) | `GVHD26CNTT001` | `123456` | HADONG |
