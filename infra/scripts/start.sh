#!/bin/bash
# ============================================================
# START SCRIPT - Khởi động hệ thống CSDL Phân tán
# Hệ thống đăng ký học phần nhiều cơ sở
# ============================================================

set -e

# Màu sắc cho terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# Lên 2 cấp: infra/scripts -> infra -> root
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
DOCKER_DIR="$PROJECT_ROOT/docker"

echo -e "${CYAN}=========================================="
echo -e "  CSDL PHÂN TÁN - KHỞI ĐỘNG HỆ THỐNG"
echo -e "==========================================${NC}"
echo ""

# ============================================================
# BƯỚC 1: Kiểm tra Docker
# ============================================================
echo -e "${BLUE}[1/4] Kiểm tra Docker...${NC}"

if ! command -v docker &> /dev/null; then
    echo -e "${RED}✗ Docker không được cài đặt!${NC}"
    exit 1
fi

if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo -e "${RED}✗ Docker Compose không được cài đặt!${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Docker và Docker Compose đã sẵn sàng${NC}"
echo ""

# ============================================================
# BƯỚC 2: Kiểm tra .env
# ============================================================
echo -e "${BLUE}[2/4] Kiểm tra file .env...${NC}"

if [ ! -f "$DOCKER_DIR/.env" ]; then
    echo -e "${YELLOW}  File .env chưa tồn tại, tạo từ .env.example...${NC}"
    if [ -f "$DOCKER_DIR/env.example" ]; then
        cp "$DOCKER_DIR/env.example" "$DOCKER_DIR/.env"
        echo -e "${GREEN}✓ Đã tạo .env từ env.example${NC}"
        echo -e "${YELLOW}  Vui lòng kiểm tra và cập nhật .env nếu cần!${NC}"
    else
        echo -e "${RED}✗ File env.example không tồn tại!${NC}"
        exit 1
    fi
else
    echo -e "${GREEN}✓ File .env đã tồn tại${NC}"
fi

echo ""

# ============================================================
# BƯỚC 3: Khởi động Docker Compose
# ============================================================
echo -e "${BLUE}[3/4] Khởi động containers...${NC}"

cd "$DOCKER_DIR"

# Docker Compose v2 syntax (docker compose) hoặc v1 (docker-compose)
if docker compose version &> /dev/null; then
    COMPOSE_CMD="docker compose"
else
    COMPOSE_CMD="docker-compose"
fi

$COMPOSE_CMD up -d

echo -e "${GREEN}✓ Containers đã được khởi động${NC}"
echo ""

# ============================================================
# BƯỚC 4: Chờ và kiểm tra health
# ============================================================
echo -e "${BLUE}[4/4] Chờ containers healthy...${NC}"

# Chờ 15 giây cho initial health check
echo -e "${YELLOW}  Chờ 15 giây để containers khởi động...${NC}"
sleep 15

# ============================================================
# HIỂN THỊ TRẠNG THÁI
# ============================================================
echo ""
echo -e "${CYAN}=========================================="
echo -e "  TRẠNG THÁI CONTAINERS"
echo -e "==========================================${NC}"
$COMPOSE_CMD ps

echo ""
echo -e "${CYAN}=========================================="
echo -e "  THÔNG TIN KẾT NỐI"
echo -e "==========================================${NC}"
echo -e "${GREEN}PostgreSQL HADONG:${NC}   localhost:5432"
echo -e "${GREEN}PostgreSQL NGOCTRUC:${NC} localhost:5433"
echo -e "${GREEN}PostgreSQL HOALAC:${NC}  localhost:5434"
echo -e "${GREEN}Redis:${NC}              localhost:6379"
echo -e "${GREEN}Elasticsearch:${NC}      localhost:9200"
echo -e "${GREEN}Kibana:${NC}             localhost:5601"
echo ""

echo -e "${CYAN}=========================================="
echo -e "  CÁCH KIỂM TRA HEALTH"
echo -e "==========================================${NC}"
echo "Docker Inspect:"
echo "  docker inspect --format='{{.State.Health.Status}}' csdlpt_hadong"
echo "  docker inspect --format='{{.State.Health.Status}}' csdlpt_elasticsearch"
echo ""
echo "Docker Compose ps:"
echo "  $COMPOSE_CMD ps"
echo ""
echo "Xem Logs:"
echo "  $COMPOSE_CMD logs -f csdlpt_hadong"
echo "  $COMPOSE_CMD logs -f csdlpt_elasticsearch"
echo ""
echo "Kiểm tra nhanh (xem ONBOARDING.md):"
echo "  ./infra/scripts/check_health.sh"
echo ""

echo -e "${GREEN}✓ Khởi động hoàn tất!${NC}"
