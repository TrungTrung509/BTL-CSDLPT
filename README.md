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

### Luồng đăng ký học phần

```
Sinh viên → REST API → Kafka Queue → 3PC Coordinator
                                         ↓
                              [Can Commit?] → [Pre-Commit] → [Do Commit]
                                         ↓              ↓           ↓
                                     Coordinator   Site A      Site B/C
```

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

## 🛠️ Công Nghệ Sử Dụng

### Backend
| Thư viện | Phiên bản | Mục đích |
|----------|-----------|----------|
| `FastAPI` | 0.135.3 | REST API framework |
| `SQLAlchemy` | 2.0.49 | ORM multi-engine |
| `Alembic` | 1.18.4 | Database migration |
| `aiokafka` | 0.12.0 | Kafka async producer/consumer |
| `Elasticsearch` | ≥ 8.0.0 | Full-text search |
| `psycopg2-binary` | 2.9.11 | PostgreSQL driver |
| `python-jose` | 3.5.0 | JWT authentication |
| `passlib` + `bcrypt` | — | Password hashing |
| `prometheus-client` | 0.23.1 | Metrics exposition |
| `uvicorn` | 0.44.0 | ASGI server |

### Frontend
| Thư viện | Phiên bản | Mục đích |
|----------|-----------|----------|
| `React` | 18.3.1 | UI framework |
| `Vite` | 5.4.8 | Build tool |
| `Ant Design` | 5.21.2 | Component library |
| `TanStack Query` | 5.56.2 | Server state management |
| `React Router` | 6.26.2 | Client-side routing |
| `Axios` | 1.7.7 | HTTP client |

### Infrastructure
| Dịch vụ | Image | Mục đích |
|---------|-------|----------|
| PostgreSQL | `postgres:15-alpine` | Distributed databases (×3 sites + centralized) |
| Redis | `redis:7-alpine` | Cache layer |
| Apache Kafka | `apache/kafka:3.7.0` (KRaft) | Message broker |
| Elasticsearch | `8.11.0` | Search engine |
| Kibana | `8.11.0` | ES dashboard |
| Prometheus | `v3.5.0` | Metrics collection |
| Grafana | `12.1.1` | Metrics visualization |
| cAdvisor | `0.56.2` | Container metrics |
| Kafka UI | `provectuslabs/kafka-ui` | Kafka management |
| Kafka Connect | `confluentinc/cp-kafka-connect:7.5.0` | Debezium CDC |
| k6 | `grafana/k6` | Load testing |

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
