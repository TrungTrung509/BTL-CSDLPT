#!/bin/bash
# RESET DATA - Xóa toàn bộ dữ liệu trên 3 site

set -e

# Màu sắc
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Thư mục gốc
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DOCKER_DIR="$PROJECT_ROOT/docker"

echo -e "  CSDL PHÂN TÁN - RESET ALL DATA"
echo ""

# Kiểm tra confirm
read -p "⚠️  CẢNH BÁO: Script này sẽ XÓA toàn bộ dữ liệu!"
read -p "Bạn có chắc chắn? Gõ 'yes' để xác nhận: " confirm

if [ "$confirm" != "yes" ]; then
    echo -e "${YELLOW}Đã hủy.${NC}"
    exit 0
fi

echo ""

# BƯỚC 1: Xóa dữ liệu PostgreSQL trên 3 site
echo -e "${BLUE}[1/4] Xóa dữ liệu PostgreSQL...${NC}"

# Hàm truncate cho một site
truncate_site() {
    local container=$1
    local db=$2

    echo -e "${YELLOW}  -> Truncate $container:$db${NC}"

    docker exec -i "$container" psql -U csdlpt_user -d "$db" <<-EOSQL
		-- Disable trigger để truncate nhanh hơn
		SET session_replication_role = replica;

		-- Truncate các bảng theo thứ tự (FK constraints)
		-- DangKy_Log: audit log thuộc site home của user (không replicate)
		TRUNCATE TABLE "DangKy_Log" CASCADE;
		-- DangKy: thuộc site mở lớp (không replicate)
		TRUNCATE TABLE "DangKy" CASCADE;
		TRUNCATE TABLE "LichHoc" CASCADE;
		TRUNCATE TABLE "LopHocPhan" CASCADE;
		TRUNCATE TABLE "PhongHoc" CASCADE;
		TRUNCATE TABLE "GiangVien" CASCADE;
		TRUNCATE TABLE "SinhVien" CASCADE;

		-- Không truncate bảng common vì replication sẽ tự đồng bộ
		-- TRUNCATE TABLE "HocKy" CASCADE;
		-- TRUNCATE TABLE "HocPhan" CASCADE;
		-- TRUNCATE TABLE "Khoa" CASCADE;
		-- TRUNCATE TABLE "CoSo" CASCADE;

		-- Re-enable trigger
		SET session_replication_role = DEFAULT;
	EOSQL

    echo -e "${GREEN}     ✓ Done${NC}"
}

# Truncate cho từng site
truncate_site "csdlpt_hadong" "csdlpt_hadong"
truncate_site "csdlpt_ngoctruc" "csdlpt_ngoctruc"
truncate_site "csdlpt_hoalac" "csdlpt_hoalac"

echo -e "${GREEN}✓ Đã xóa dữ liệu PostgreSQL${NC}"
echo ""

# BƯỚC 2: Xóa dữ liệu Redis
echo -e "${BLUE}[2/4] Xóa dữ liệu Redis...${NC}"

docker exec -i csdlpt_redis redis-cli FLUSHALL
echo -e "${GREEN}✓ Đã xóa dữ liệu Redis${NC}"
echo ""

# BƯỚC 3: Xóa Elasticsearch Index
echo -e "${BLUE}[3/4] Xóa Elasticsearch Index...${NC}"

# Xóa index hocphan nếu tồn tại
response=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9200/hocphan)

if [ "$response" = "200" ]; then
    curl -X DELETE "http://localhost:9200/hocphan" 2>/dev/null
    echo -e "${GREEN}✓ Đã xóa index 'hocphan'${NC}"
else
    echo -e "${YELLOW}  Index 'hocphan' không tồn tại, bỏ qua${NC}"
fi

echo ""

# BƯỚC 4: Xóa Replication Subscriptions (nếu có)
echo -e "${BLUE}[4/4] Reset Replication state...${NC}"

echo -e "${YELLOW}  Replication subscriptions được giữ nguyên${NC}"
echo -e "${YELLOW}  Để reset replication, chạy thủ công: DROP SUBSCRIPTION${NC}"
echo ""

# HOÀN TẤT
echo -e "  RESET HOÀN TẤT!"
echo ""
echo -e "${GREEN}Các bước tiếp theo:${NC}"
echo "  1. Reseed dữ liệu: ./scripts/reseed.sh"
echo "  2. Setup replication: Get-Content sql/replication/01_setup_publisher.sql | docker exec -i csdlpt_hadong psql ..."
echo "  3. Bootstrap ES: python scripts/bootstrap_search.py"
echo ""
