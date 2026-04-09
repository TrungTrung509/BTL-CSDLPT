#!/bin/bash
# ============================================================
# RESEED - Sinh dữ liệu mẫu
# Hệ thống CSDL Phân tán - Đăng ký học phần
# ============================================================

set -e

# Màu sắc
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}=========================================="
echo -e "  CSDL PHÂN TÁN - RESEED DATA"
echo -e "==========================================${NC}"
echo ""

# Thư mục gốc
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SEEDS_DIR="$PROJECT_ROOT/seeds"

# ============================================================
# BƯỚC 1: Kiểm tra Python và venv
# ============================================================
echo -e "${BLUE}[1/3] Kiểm tra môi trường Python...${NC}"

if [ ! -d "$SEEDS_DIR/.venv" ]; then
    echo -e "${YELLOW}  Virtual environment chưa tồn tại, tạo mới...${NC}"

    cd "$SEEDS_DIR"
    python -m venv .venv

    echo -e "${YELLOW}  Cài đặt dependencies...${NC}"
    .venv/bin/pip install -q -r requirements.txt

    echo -e "${GREEN}  ✓ Đã tạo virtual environment${NC}"
else
    echo -e "${GREEN}  ✓ Virtual environment đã tồn tại${NC}"
fi

echo ""

# ============================================================
# BƯỚC 2: Generate dữ liệu
# ============================================================
echo -e "${BLUE}[2/3] Generate dữ liệu mẫu...${NC}"

cd "$SEEDS_DIR"
.venv/bin/python generate_data.py

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✓ Generate dữ liệu thành công${NC}"
else
    echo -e "${RED}✗ Generate dữ liệu thất bại${NC}"
    exit 1
fi

echo ""

# ============================================================
# BƯỚC 3: Import dữ liệu vào database
# ============================================================
echo -e "${BLUE}[3/3] Import dữ liệu vào 3 site...${NC}"

# Import function
import_to_site() {
    local site=$1
    local container=$2
    local db=$3
    local site_data=$4

    echo -e "${YELLOW}  -> Import vào $container:$db${NC}"

    # Common data (chạy trước)
    cat "$SEEDS_DIR/output/common/001_common_data.sql" | \
        docker exec -i "$container" psql -U csdlpt_user -d "$db" 2>/dev/null

    # Site data
    cat "$site_data" | \
        docker exec -i "$container" psql -U csdlpt_user -d "$db" 2>/dev/null

    # Indexes
    cat "$PROJECT_ROOT/sql/indexes.sql" | \
        docker exec -i "$container" psql -U csdlpt_user -d "$db" 2>/dev/null

    echo -e "${GREEN}     ✓ Done${NC}"
}

# Import vào 3 site
import_to_site "hadong" "csdlpt_hadong" "csdlpt_hadong" "$SEEDS_DIR/output/site_hadong/001_site_data.sql"
import_to_site "ngoctruc" "csdlpt_ngoctruc" "csdlpt_ngoctruc" "$SEEDS_DIR/output/site_ngoctruc/001_site_data.sql"
import_to_site "hoalac" "csdlpt_hoalac" "csdlpt_hoalac" "$SEEDS_DIR/output/site_hoalac/001_site_data.sql"

echo -e "${GREEN}✓ Import dữ liệu thành công${NC}"
echo ""

# ============================================================
# HOÀN TẤT
# ============================================================
echo -e "${CYAN}=========================================="
echo -e "  RESEED HOÀN TẤT!"
echo -e "==========================================${NC}"
echo ""

# Chạy check counts
echo -e "${BLUE}Kiểm tra số bản ghi:${NC}"
"$SCRIPT_DIR/check_counts.sh"

echo ""
echo -e "${GREEN}Các bước tiếp theo:${NC}"
echo "  1. Setup replication: ./scripts/setup_replication.sh"
echo "  2. Bootstrap ES: python scripts/bootstrap_search.py"
echo "  3. Reindex ES: ./scripts/reindex_es.sh"
echo ""
