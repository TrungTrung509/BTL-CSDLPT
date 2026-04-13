#!/bin/bash
# ============================================================
# RESET SCRIPT - Reset hoàn toàn hệ thống CSDL Phân tán
# CẢNH BÁO: Script này sẽ XÓA toàn bộ dữ liệu!
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

echo -e "${RED}=========================================="
echo -e "  CSDL PHÂN TÁN - RESET HOÀN TOÀN"
echo -e "==========================================${NC}"
echo ""

echo -e "${YELLOW}⚠️  CẢNH BÁO NGHIÊM TRỌNG!${NC}"
echo -e "${YELLOW}Script này sẽ XÓA:${NC}"
echo "  - Toàn bộ dữ liệu PostgreSQL (3 site)"
echo "  - Dữ liệu Redis"
echo "  - Dữ liệu Elasticsearch"
echo "  - Docker images của hệ thống"
echo ""
echo -e "${RED}⚠️  KHÔNG THỂ KHÔI PHỤC SAU KHI XÓA!${NC}"
echo ""

read -p "Bạn có chắc chắn muốn tiếp tục? Gõ 'YES' để xác nhận: " confirm

if [ "$confirm" != "YES" ]; then
    echo -e "${GREEN}Đã hủy. Dữ liệu được an toàn.${NC}"
    exit 0
fi

echo ""

cd "$DOCKER_DIR"

# Docker Compose v2 syntax hoặc v1
if docker compose version &> /dev/null; then
    COMPOSE_CMD="docker compose"
else
    COMPOSE_CMD="docker-compose"
fi

# ============================================================
# BƯỚC 1: Dừng và xóa containers + volumes
# ============================================================
echo -e "${BLUE}[1/3] Dừng và xóa containers...${NC}"
$COMPOSE_CMD down -v
echo -e "${GREEN}✓ Đã dừng và xóa containers${NC}"
echo ""

# ============================================================
# BƯỚC 2: Xóa images
# ============================================================
echo -e "${BLUE}[2/3] Xóa Docker images...${NC}"
$COMPOSE_CMD down --rmi local 2>/dev/null || true
echo -e "${GREEN}✓ Đã xóa images${NC}"
echo ""

# ============================================================
# BƯỚC 3: Dọn dẹp
# ============================================================
echo -e "${BLUE}[3/3] Dọn dẹp Docker system...${NC}"
docker system prune -f --volumes 2>/dev/null || true
echo -e "${GREEN}✓ Đã dọn dẹp${NC}"
echo ""

# ============================================================
# HOÀN TẤT
# ============================================================
echo -e "${CYAN}=========================================="
echo -e "  RESET HOÀN TẤT!"
echo -e "==========================================${NC}"
echo -e "${YELLOW}Để khởi động lại từ đầu:${NC}"
echo "  ./infra/scripts/start.sh"
echo ""
echo -e "${YELLOW}Sau khi khởi động, cần:${NC}"
echo "  1. Setup database: Chạy lại schema + seed"
echo "  2. Setup replication: sql/replication/*.sql"
echo "  3. Bootstrap ES: python scripts/bootstrap_search.py"
echo ""
