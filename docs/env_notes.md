# Environment Notes - Cấu hình Port và Biến Môi Trường

## Tổng quan

Tài liệu này ghi chú tất cả **port**, **biến môi trường**, và **endpoint** đang được sử dụng trong hệ thống Cơ sở dữ liệu phân tán.

## Thông tin kết nối

### PostgreSQL Sites

| Site | Container | Host Port | DB Port | Database | Username | Password |
|------|-----------|-----------|---------|----------|----------|----------|
| HADONG | `csdlpt_hadong` | 5432 | 5432 | `csdlpt_hadong` | `csdlpt_user` | `csdlpt_pass` |
| NGOCTRUC | `csdlpt_ngoctruc` | 5433 | 5432 | `csdlpt_ngoctruc` | `csdlpt_user` | `csdlpt_pass` |
| HOALAC | `csdlpt_hoalac` | 5434 | 5432 | `csdlpt_hoalac` | `csdlpt_user` | `csdlpt_pass` |

### Cache & Search Services

| Service | Container | Host Port | Mô tả |
|---------|-----------|-----------|--------|
| Redis | `csdlpt_redis` | 6379 | Cache layer |
| Elasticsearch | `csdlpt_elasticsearch` | 9200 | Search engine |
| Kibana | `csdlpt_kibana` | 5601 | Dashboard |

## Biến môi trường (.env)

### File: `docker/.env`

```bash
# ============================================================
# POSTGRESQL - HADONG (Publisher)
# ============================================================
HADONG_DB=csdlpt_hadong
HADONG_USER=csdlpt_user
HADONG_PASSWORD=csdlpt_pass
HADONG_PORT=5432

# ============================================================
# POSTGRESQL - NGOCTRUC (Subscriber)
# ============================================================
NGOCTRUC_DB=csdlpt_ngoctruc
NGOCTRUC_USER=csdlpt_user
NGOCTRUC_PASSWORD=csdlpt_pass
NGOCTRUC_PORT=5433

# ============================================================
# POSTGRESQL - HOALAC (Subscriber)
# ============================================================
HOALAC_DB=csdlpt_hoalac
HOALAC_USER=csdlpt_user
HOALAC_PASSWORD=csdlpt_pass
HOALAC_PORT=5434

# ============================================================
# REDIS
# ============================================================
REDIS_PORT=6379

# ============================================================
# ELASTICSEARCH
# ============================================================
ES_PORT=9200

# ============================================================
# KIBANA
# ============================================================
KIBANA_PORT=5601
```

## Connection Strings

### PostgreSQL (pgAdmin / Application)

```
# HADONG
postgresql://csdlpt_user:csdlpt_pass@localhost:5432/csdlpt_hadong

# NGOCTRUC
postgresql://csdlpt_user:csdlpt_pass@localhost:5433/csdlpt_ngoctruc

# HOALAC
postgresql://csdlpt_user:csdlpt_pass@localhost:5434/csdlpt_hoalac
```

### Redis

```
# Connection
redis://localhost:6379

# With password (nếu có)
redis://:password@localhost:6379
```

### Elasticsearch

```bash
# HTTP
http://localhost:9200

# HTTPS (nếu bật security)
https://localhost:9200
```

### Kibana

```
http://localhost:5601
```

## Replication Configuration

### Publisher Connection (từ Subscriber đến Publisher)

```bash
# Connection string format
host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass

# Trong Docker network:
# - Host = tên service (postgres_hadong)
# - Port = cổng INTERNAL của container (5432)
```

## Health Check Endpoints

### PostgreSQL

```bash
# pg_isready
docker exec -it csdlpt_hadong pg_isready -U csdlpt_user -d csdlpt_hadong

# SQL check
docker exec -it csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -c "SELECT 1;"
```

### Redis

```bash
# Ping
docker exec -it csdlpt_redis redis-cli ping

# Expected output: PONG
```

### Elasticsearch

```bash
# Cluster health
curl http://localhost:9200/_cluster/health

# Node info
curl http://localhost:9200/_nodes

# Indices
curl http://localhost:9200/_cat/indices
```

### Kibana

```bash
# Status API
curl http://localhost:5601/api/status

# Health
curl http://localhost:5601/api/health
```

## Docker Network

```bash
# Network name
csdlpt_network

# Network type
bridge

# Kiểm tra:
docker network inspect csdlpt_network
```

## Volumes

```bash
# PostgreSQL data volumes
postgres_hadong_data
postgres_ngoctruc_data
postgres_hoalac_data

# Redis data volume
redis_data

# Elasticsearch data volume
elasticsearch_data
```

## Kiểm tra Port đang sử dụng

### Windows

```powershell
# Tất cả port của hệ thống
netstat -an | findstr "5432 5433 5434 6379 9200 5601"

# Kiểm tra cổng cụ thể
netstat -an | findstr ":5432"
```

### Linux/Mac

```bash
# Tất cả port
netstat -tlnp | grep -E "5432|5433|5434|6379|9200|5601"

# Hoặc
ss -tlnp | grep -E "5432|5433|5434|6379|9200|5601"
```

## Environment Variables trong Docker

### PostgreSQL

| Variable | Mô tả | Giá trị mặc định |
|----------|-------|-------------------|
| `POSTGRES_DB` | Database name | csdlpt_hadong/ngoctruc/hoalac |
| `POSTGRES_USER` | Database user | csdlpt_user |
| `POSTGRES_PASSWORD` | Database password | csdlpt_pass |
| `POSTGRES_INITDB_ARGS` | Args khi init DB | -E UTF8 |

### Elasticsearch

| Variable | Mô tả | Giá trị mặc định |
|----------|-------|-------------------|
| `discovery.type` | Cluster type | single-node |
| `xpack.security.enabled` | Security | false |
| `ES_JAVA_OPTS` | Java heap | -Xms512m -Xmx512m |
| `cluster.name` | Cluster name | csdlpt-cluster |

### Kibana

| Variable | Mô tả | Giá trị mặc định |
|----------|-------|-------------------|
| `ELASTICSEARCH_HOSTS` | ES endpoint | http://elasticsearch:9200 |
| `SERVER_NAME` | Server name | csdlpt-kibana |
| `SERVER_HOST` | Host binding | 0.0.0.0 |

### Redis

| Variable | Mô tả | Giá trị mặc định |
|----------|-------|-------------------|
| `maxmemory` | Max memory | 256mb |
| `maxmemory-policy` | Eviction policy | allkeys-lru |

## Backup & Restore

### Backup Database

```bash
# HADONG
docker exec -it csdlpt_hadong pg_dump -U csdlpt_user csdlpt_hadong > backup_hadong.sql

# Tất cả sites
for site in hadong ngoctruc hoalac; do
  docker exec -it csdlpt_$site pg_dump -U csdlpt_user csdlpt_$site > backup_$site.sql
done
```

### Restore Database

```bash
# HADONG
docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong < backup_hadong.sql
```

## Troubleshooting

### Port bị chiếm

```powershell
# Tìm process chiếm port
netstat -ano | findstr ":5432"

# Kill process
taskkill /PID <PID> /F
```

### Container không start

```powershell
# Xem logs
docker logs csdlpt_hadong

# Rebuild
docker-compose -f docker/docker-compose.yml up -d --force-recreate csdlpt_hadong
```

---

*Cập nhật: 2026-04-04*
