# HƯỚNG DẪN HEALTHCHECK VÀ STARTUP ORDER

## Mục lục

1. [Mục tiêu](#1-mục-tiêu)
2. [Danh sách Services](#2-danh-sách-services)
3. [Healthcheck của từng Service](#3-healthcheck-của-từng-service)
4. [Thứ tự khởi động (depends_on)](#4-thứ-tự-khởi-động-depends_on)
5. [Cách chạy startup scripts](#5-cách-chạy-startup-scripts)
6. [Cách kiểm tra trạng thái](#6-cách-kiểm-tra-trạng-thái)
7. [Lỗi thường gặp](#7-lỗi-thường-gặp)
8. [Checklist nghiệm thu](#8-checklist-nghiệm-thu)

---

## 1. Mục tiêu

Tài liệu này mô tả cách hệ thống đảm bảo **thứ tự khởi động đúng** và **trạng thái sẵn sàng** của tất cả services thông qua:

- **Docker Healthcheck**: Kiểm tra service có thực sự ready không
- **depends_on + service_healthy**: Đảm bảo service phụ thuộc chỉ start khi service chính healthy
- **Startup Scripts**: Tự động hóa việc khởi động/dừng/reset

---

## 2. Danh sách Services

| Service | Container | Port | Vai trò | Healthcheck |
|--------|-----------|------|---------|------------|
| `postgres_hadong` | `csdlpt_hadong` | 5432 | Publisher (Master) | `pg_isready` kiểm tra DB đích |
| `postgres_ngoctruc` | `csdlpt_ngoctruc` | 5433 | Subscriber | `pg_isready` kiểm tra DB đích |
| `postgres_hoalac` | `csdlpt_hoalac` | 5434 | Subscriber | `pg_isready` kiểm tra DB đích |
| `redis` | `csdlpt_redis` | 6379 | Cache | `redis-cli ping` |
| `elasticsearch` | `csdlpt_elasticsearch` | 9200 | Search | `curl _cluster/health` |
| `kibana` | `csdlpt_kibana` | 5601 | Dashboard | HTTP `/api/status` |

---

## 3. Healthcheck của từng Service

### 3.1 PostgreSQL (3 sites)

**Cấu hình trong `docker-compose.yml`:**

```yaml
healthcheck:
  test: ["CMD-SHELL", "pg_isready -U ${HADONG_USER:-csdlpt_user} -d ${HADONG_DB:-csdlpt_hadong}"]
  interval: 10s
  timeout: 5s
  retries: 5
  start_period: 10s
```

**Giải thích:**
- `pg_isready`: Kiểm tra PostgreSQL process có sẵn sàng nhận kết nối
- `-d`: Chỉ định database cụ thể (không phải chỉ check process)
- `start_period: 10s`: Thời gian grace period trước khi bắt đầu healthcheck

**Script kiểm tra thủ công:**
```bash
docker exec -i csdlpt_hadong pg_isready -U csdlpt_user -d csdlpt_hadong
# Output: accepting connections = OK
```

### 3.2 Redis

**Cấu hình trong `docker-compose.yml`:**

```yaml
healthcheck:
  test: ["CMD", "redis-cli", "ping"]
  interval: 10s
  timeout: 5s
  retries: 5
  start_period: 5s
```

**Giải thích:**
- `redis-cli ping`: Gửi PING, nhận PONG nếu Redis sẵn sàng
- `start_period: 5s`: Redis khởi động nhanh, chỉ cần 5s

**Script kiểm tra thủ công:**
```bash
docker exec -i csdlpt_redis redis-cli ping
# Output: PONG
```

### 3.3 Elasticsearch

**Cấu hình trong `docker-compose.yml`:**

```yaml
healthcheck:
  test: ["CMD-SHELL", "curl -s http://localhost:9200/_cluster/health | grep -q '\"status\":\"green\"\\|\"status\":\"yellow\"'"]
  interval: 30s
  timeout: 10s
  retries: 5
  start_period: 60s
```

**Giải thích:**
- `curl _cluster/health`: Gọi API health của ES cluster
- Chấp nhận cả `green` (tốt) và `yellow` (1 node cluster vẫn OK)
- `start_period: 60s`: Elasticsearch cần thời gian bootstrap lâu
- `interval: 30s`: ES khởi động chậm, check ít hơn

**Script kiểm tra thủ công:**
```bash
curl http://localhost:9200/_cluster/health
# Output: {"cluster_name":"csdlpt-cluster","status":"green",...}
```

### 3.4 Kibana

**Cấu hình trong `docker-compose.yml`:**

```yaml
depends_on:
  elasticsearch:
    condition: service_healthy
```

**Giải thích:**
- Kibana không có healthcheck riêng trong compose
- Phụ thuộc hoàn toàn vào `elasticsearch` healthy
- Nếu ES chưa ready, Kibana sẽ chờ

**Script kiểm tra thủ công:**
```bash
curl -s -o /dev/null -w "%{http_code}" http://localhost:5601/api/status
# Output: 200 (nếu ready)
```

---

## 4. Thứ tự khởi động (depends_on)

### 4.1 Sơ đồ phụ thuộc

```
┌─────────────────────────────────────────────────────────────┐
│                    STARTUP ORDER                            │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  Layer 1: PostgreSQL (khởi động song song)                  │
│  ┌─────────────┐ ┌─────────────┐ ┌─────────────┐           │
│  │  HADONG     │ │  NGOCTRUC   │ │  HOALAC     │           │
│  │  (5432)     │ │  (5433)     │ │  (5434)     │           │
│  └──────┬──────┘ └──────┬──────┘ └──────┬──────┘           │
│         │                │                │                   │
│         └────────────────┼────────────────┘                   │
│                          │                                    │
│  Layer 2: Redis + Elasticsearch                              │
│              (chạy song song, độc lập)                        │
│         ┌────────────────┴────────────────┐                 │
│         ▼                                 ▼                 │
│  ┌─────────────┐                 ┌─────────────┐           │
│  │    Redis    │                 │Elasticsearch│           │
│  │   (6379)    │                 │   (9200)     │           │
│  └─────────────┘                 └──────┬──────┘           │
│                                           │                   │
│  Layer 3: Kibana (chỉ sau ES healthy)     │                   │
│              ┌─────────────────────────────┘                  │
│              ▼                                                │
│  ┌─────────────────┐                                         │
│  │     Kibana       │                                         │
│  │    (5601)        │                                         │
│  └─────────────────┘                                         │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 4.2 Chi tiết depends_on

| Service | depends_on | Điều kiện | Lý do |
|---------|------------|-----------|-------|
| `postgres_ngoctruc` | `postgres_hadong` | `service_healthy` | Replication cần HADONG up trước |
| `postgres_hoalac` | `postgres_hadong` | `service_healthy` | Replication cần HADONG up trước |
| `kibana` | `elasticsearch` | `service_healthy` | Kibana cần ES để hoạt động |

**Không có depends_on:**
- `redis`: Không phụ thuộc service nào, có thể start độc lập
- `elasticsearch`: Không phụ thuộc service nào, có thể start độc lập

### 4.3 Thứ tự khởi động thực tế

1. **Layer 1**: `postgres_hadong`, `postgres_ngoctruc`, `postgres_hoalac` (song song)
2. **Layer 2**: `redis`, `elasticsearch` (song song, sau Layer 1)
3. **Layer 3**: `kibana` (chỉ sau ES healthy)

---

## 5. Cách chạy startup scripts

### 5.1 Khởi động (start)

```bash
# Linux/Mac
./infra/scripts/start.sh

# Hoặc bash
bash ./infra/scripts/start.sh
```

**Script thực hiện:**
1. Kiểm tra Docker + Docker Compose
2. Kiểm tra/tạo .env
3. Chạy `docker compose up -d`
4. Chờ 15s và hiển thị trạng thái

### 5.2 Dừng (stop)

```bash
./infra/scripts/stop.sh
```

**Script thực hiện:**
1. Chạy `docker compose stop`
2. Hiển thị trạng thái
3. **Dữ liệu được giữ nguyên**

### 5.3 Reset hoàn toàn (reset)

```bash
./infra/scripts/reset.sh
```

**Cảnh báo:**
- Script yêu cầu gõ "YES" để xác nhận
- Xóa toàn bộ volumes + images
- **KHÔNG THỂ KHÔI PHỤC**

---

## 6. Cách kiểm tra trạng thái

### 6.1 Kiểm tra nhanh bằng docker compose

```bash
cd docker

# Xem trạng thái tất cả containers
docker compose ps

# Hoặc (Docker Compose v1)
docker-compose ps
```

**Output mẫu:**
```
NAME                    STATUS          PORTS
csdlpt_hadong          healthy         0.0.0.0:5432->5432/tcp
csdlpt_ngoctruc        healthy         0.0.0.0:5433->5432/tcp
csdlpt_hoalac          healthy         0.0.0.0:5434->5432/tcp
csdlpt_redis           healthy         0.0.0.0:6379->6379/tcp
csdlpt_elasticsearch   healthy         0.0.0.0:9200->9200/tcp
csdlpt_kibana          running         0.0.0.0:5601->5601/tcp
```

### 6.2 Kiểm tra health bằng docker inspect

```bash
# Kiểm tra 1 container
docker inspect --format='{{.State.Health.Status}}' csdlpt_hadong
# Output: healthy

# Kiểm tra tất cả
docker inspect --format='{{.State.Health.Status}}' \
  csdlpt_hadong csdlpt_ngoctruc csdlpt_hoalac csdlpt_redis csdlpt_elasticsearch
```

**Các trạng thái possible:**
- `healthy`: Healthcheck pass, service sẵn sàng
- `unhealthy`: Healthcheck fail, cần kiểm tra
- `starting`: Đang trong startup period
- `<none>`: Không có healthcheck

### 6.3 Kiểm tra PostgreSQL

```bash
# Từ container
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT 1;"

# pg_isready
docker exec -i csdlpt_hadong pg_isready -U csdlpt_user -d csdlpt_hadong
# Output: accepting connections

# Xem version
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT version();"
```

### 6.4 Kiểm tra Redis

```bash
# Ping
docker exec -i csdlpt_redis redis-cli ping
# Output: PONG

# Xem info
docker exec -i csdlpt_redis redis-cli info
```

### 6.5 Kiểm tra Elasticsearch

```bash
# Cluster health
curl http://localhost:9200/_cluster/health
# Output: {"cluster_name":"csdlpt-cluster","status":"green",...}

# Nodes
curl http://localhost:9200/_nodes

# Indices
curl http://localhost:9200/_cat/indices
```

### 6.6 Kiểm tra Kibana

```bash
# Status API
curl http://localhost:5601/api/status

# Health
curl http://localhost:5601/api/health
```

### 6.7 Xem logs

```bash
# Tất cả containers
cd docker
docker compose logs -f

# Container cụ thể
docker compose logs -f csdlpt_hadong
docker compose logs -f csdlpt_elasticsearch

# 50 dòng gần nhất
docker compose logs --tail=50 csdlpt_hadong
```

---

## 7. Lỗi thường gặp

### Lỗi 1: "port is already allocated"

**Nguyên nhân:** Port đã được container hoặc service khác chiếm dụng.

**Giải pháp:**
```bash
# Kiểm tra port nào đang dùng
netstat -an | findstr "5432"

# Hoặc Linux/Mac
netstat -tlnp | grep 5432

# Đổi port trong docker/.env
# VD: HADONG_PORT=5435
```

### Lỗi 2: "cannot connect to publisher" (Replication)

**Nguyên nhân:** Subscriber start trước khi Publisher ready.

**Giải pháp:**
```bash
# Kiểm tra HADONG healthy chưa
docker inspect --format='{{.State.Health.Status}}' csdlpt_hadong

# Chờ và thử lại replication
docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc \
  -c "ALTER SUBSCRIPTION sub_common_tables REFRESH PUBLICATION;"
```

### Lỗi 3: "Elasticsearch JVM out of memory"

**Nguyên nhân:** Không đủ RAM cho Elasticsearch.

**Giải pháp:**
```yaml
# Giảm bộ nhớ trong docker-compose.yml
environment:
  - "ES_JAVA_OPTS=-Xms256m -Xmx256m"
```

### Lỗi 4: "Kibana cannot connect to Elasticsearch"

**Nguyên nhân:** Elasticsearch chưa healthy khi Kibana start.

**Giải pháp:**
```bash
# Kiểm tra ES health
curl http://localhost:9200/_cluster/health

# Restart Kibana
docker compose restart kibana
```

### Lỗi 5: "Volume permission denied"

**Nguyên nhân:** Volume cũ có permission không đúng.

**Giải pháp:**
```bash
# Xóa volumes cũ
docker compose down -v

# Khởi động lại
docker compose up -d
```

---

## 8. Checklist nghiệm thu

### 8.1 Healthcheck hoạt động

- [ ] Tất cả containers có healthcheck trong compose
- [ ] Healthcheck không fail khi service up bình thường
- [ ] `docker inspect` hiển thị `healthy` cho 5/6 services

### 8.2 Thứ tự khởi động đúng

- [ ] PostgreSQL HADONG up trước (là Publisher)
- [ ] PostgreSQL NGOCTRUC/HOALAC chờ HADONG healthy
- [ ] Kibana chờ Elasticsearch healthy

### 8.3 Startup scripts hoạt động

- [ ] `./start.sh` khởi động đúng
- [ ] `./stop.sh` dừng đúng, giữ data
- [ ] `./reset.sh` xóa đúng sau khi confirm

### 8.4 Kiểm tra kết nối

- [ ] PostgreSQL 5432, 5433, 5434 respond
- [ ] Redis 6379 respond (PONG)
- [ ] Elasticsearch 9200 respond (cluster health)
- [ ] Kibana 5601 respond (HTTP 200)

---

## Cấu trúc file

```
docker/
├── docker-compose.yml              # Cấu hình chính
├── healthcheck/
│   ├── check_postgres.sh           # Script healthcheck PostgreSQL
│   ├── check_redis.sh             # Script healthcheck Redis
│   ├── check_elasticsearch.sh     # Script healthcheck ES
│   └── check_kibana.sh            # Script healthcheck Kibana
└── ...

infra/scripts/
├── start.sh                        # Script khởi động
├── stop.sh                         # Script dừng
├── reset.sh                        # Script reset
└── ...
```

---

*Cập nhật: 2026-04-04*
