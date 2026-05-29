#!/bin/bash
# CHECK COUNTS - Kiểm tra số bản ghi trên 3 site

set -e

# Màu sắc
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "  CHECK COUNTS - Kiểm tra số bản ghi"
echo ""

# MẢNG CÁC BẢNG CẦN KIỂM TRA

# Bảng dùng chung (Replication)
SHARED_TABLES=("CoSo" "users" "Khoa" "HocPhan" "HocKy")

# Bảng cục bộ (Local)
LOCAL_TABLES=("SinhVien" "GiangVien" "PhongHoc" "LopHocPhan" "LichHoc" "DangKy")

# Thông tin các site
SITES=(
    "hadong:csdlpt_hadong:csdlpt_hadong"
    "ngoctruc:csdlpt_ngoctruc:csdlpt_ngoctruc"
    "hoalac:csdlpt_hoalac:csdlpt_hoalac"
)

# HÀM LẤY COUNT TỪ MỘT SITE

get_count() {
    local container=$1
    local db=$2
    local table=$3

    # Dùng double quotes cho table name vì PostgreSQL case-sensitive
    count=$(docker exec -i "$container" psql -U csdlpt_user -d "$db" -t -c "SELECT COUNT(*) FROM \"$table\";" 2>/dev/null | tr -d ' ')
    echo "${count:-0}"
}

# BẢNG DÙNG CHUNG (Replication)
echo -e "${BOLD}${BLUE}━━━ BẢNG DÙNG CHUNG (Replication) ━━━${NC}"
echo ""

# Header
printf "${BOLD}%-15s %12s %12s %12s %8s${NC}\n" "TABLE" "HADONG" "NGOCTRUC" "HOALAC" "MATCH?"
echo "────────────────────────────────────────────────────"

all_match=true

for table in "${SHARED_TABLES[@]}"; do
    # Lấy counts từ 3 site
    count_hadong=$(get_count "csdlpt_hadong" "csdlpt_hadong" "$table")
    count_ngoctruc=$(get_count "csdlpt_ngoctruc" "csdlpt_ngoctruc" "$table")
    count_hoalac=$(get_count "csdlpt_hoalac" "csdlpt_hoalac" "$table")

    # Kiểm tra match
    if [ "$count_hadong" = "$count_ngoctruc" ] && [ "$count_hadong" = "$count_hoalac" ]; then
        match="${GREEN}✓${NC}"
    else
        match="${RED}✗${NC}"
        all_match=false
    fi

    printf "%-15s %12s %12s %12s %s\n" "$table" "$count_hadong" "$count_ngoctruc" "$count_hoalac" "$match"
done

echo ""

if $all_match; then
    echo -e "${GREEN}✓ Tất cả bảng dùng chung có số bản ghi KHỚP nhau!${NC}"
else
    echo -e "${RED}✗ Có bảng dùng chung có số bản ghi KHÔNG khớp!${NC}"
    echo -e "${YELLOW}Kiểm tra replication đang hoạt động hay không.${NC}"
fi

echo ""

# BẢNG CỤC BỘ (Local)

echo -e "${BOLD}${BLUE}━━━ BẢNG CỤC BỘ (Local) ━━━${NC}"
echo ""

# Header
printf "${BOLD}%-15s %12s %12s %12s${NC}\n" "TABLE" "HADONG" "NGOCTRUC" "HOALAC"
echo "──────────────────────────────────────────────────"

for table in "${LOCAL_TABLES[@]}"; do
    count_hadong=$(get_count "csdlpt_hadong" "csdlpt_hadong" "$table")
    count_ngoctruc=$(get_count "csdlpt_ngoctruc" "csdlpt_ngoctruc" "$table")
    count_hoalac=$(get_count "csdlpt_hoalac" "csdlpt_hoalac" "$table")

    printf "%-15s %12s %12s %12s\n" "$table" "$count_hadong" "$count_ngoctruc" "$count_hoalac"
done

echo ""

# THÔNG TIN REPLICATION

echo -e "${BOLD}${BLUE}━━━ REPLICATION STATUS ━━━${NC}"
echo ""

# Kiểm tra replication tại HADONG (Publisher)
echo -e "${CYAN}Publisher (HADONG):${NC}"
replication_count=$(docker exec -i csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -t -c "SELECT COUNT(*) FROM pg_stat_replication;" 2>/dev/null | tr -d ' ')
if [ -n "$replication_count" ] && [ "$replication_count" -gt 0 ]; then
    echo -e "  ${GREEN}✓ Có $replication_count subscriber(s) đang kết nối${NC}"
else
    echo -e "  ${YELLOW}⚠ Chưa có subscriber nào kết nối${NC}"
fi

# Kiểm tra subscription tại NGOCTRUC
echo -e "${CYAN}Subscriber (NGOCTRUC):${NC}"
sub_ngoctruc=$(docker exec -i csdlpt_ngoctruc psql -U csdlpt_user -d csdlpt_ngoctruc -t -c "SELECT COUNT(*) FROM pg_subscription;" 2>/dev/null | tr -d ' ')
if [ -n "$sub_ngoctruc" ] && [ "$sub_ngoctruc" -gt 0 ]; then
    echo -e "  ${GREEN}✓ Có $sub_ngoctruc subscription(s)${NC}"
else
    echo -e "  ${YELLOW}⚠ Chưa có subscription nào${NC}"
fi

# Kiểm tra subscription tại HOALAC
echo -e "${CYAN}Subscriber (HOALAC):${NC}"
sub_hoalac=$(docker exec -i csdlpt_hoalac psql -U csdlpt_user -d csdlpt_hoalac -t -c "SELECT COUNT(*) FROM pg_subscription;" 2>/dev/null | tr -d ' ')
if [ -n "$sub_hoalac" ] && [ "$sub_hoalac" -gt 0 ]; then
    echo -e "  ${GREEN}✓ Có $sub_hoalac subscription(s)${NC}"
else
    echo -e "  ${YELLOW}⚠ Chưa có subscription nào${NC}"
fi

echo ""

# ELASTICSEARCH

echo -e "${BOLD}${BLUE}━━━ ELASTICSEARCH ━━━${NC}"
echo ""

es_count=$(curl -s "http://localhost:9200/hocphan/_count" 2>/dev/null | grep -o '"count":[0-9]*' | cut -d':' -f2)

if [ -n "$es_count" ]; then
    echo -e "  ${GREEN}✓ Index 'hocphan': $es_count documents${NC}"
else
    echo -e "  ${YELLOW}⚠ Index 'hocphan' không tồn tại hoặc chưa có dữ liệu${NC}"
fi

echo ""
echo -e "${CYAN}==========================================${NC}"
