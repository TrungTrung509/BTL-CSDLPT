#!/bin/bash
# ============================================================
# STOP SCRIPT - Dừng hệ thống CSDL Phân tán
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
echo -e "  CSDL PHÂN TÁN - DỪNG HỆ THỐNG"
echo -e "==========================================${NC}"
echo ""

cd "$DOCKER_DIR"

# Docker Compose v2 syntax hoặc v1
if docker compose version &> /dev/null; then
    COMPOSE_CMD="docker compose"
else
    COMPOSE_CMD="docker-compose"
fi

echo -e "${BLUE}[1/2] Dừng containers...${NC}"
$COMPOSE_CMD stop

echo -e "${GREEN}✓ Containers đã dừng${NC}"
echo ""

echo -e "${BLUE}[2/2] Trạng thái hiện tại:${NC}"
$COMPOSE_CMD ps

echo ""
echo -e "${CYAN}=========================================="
echo -e "  DỮ LIỆU ĐƯỢC GIỮ NGUYÊN"
echo -e "==========================================${NC}"
echo -e "${GREEN}✓ Dữ liệu PostgreSQL được giữ nguyên (volumes)${NC}"
echo -e "${GREEN}✓ Dữ liệu Redis được giữ nguyên${NC}"
echo -e "${GREEN}✓ Dữ liệu Elasticsearch được giữ nguyên${NC}"
echo ""

echo -e "${CYAN}=========================================="
echo -e "  LỆNH TIẾP THEO"
echo -e "==========================================${NC}"
echo "Khởi động lại: ./infra/scripts/start.sh"
echo "Xóa hoàn toàn: ./infra/scripts/reset.sh"
echo ""
