#!/bin/sh
# ============================================================
# HEALTHCHECK - Kibana
# Kiểm tra Kibana có sẵn sàng hay không
# ============================================================

HOST="${KIBANA_HOST:-localhost}"
PORT="${KIBANA_PORT:-5601}"

# Kiểm tra API status endpoint
# Kibana trả về 200 khi ready (kể cả status "available")
# Không dùng health endpoint vì Kibana không có endpoint như ES
response=$(curl -s -o /dev/null -w "%{http_code}" "http://${HOST}:${PORT}/api/status" 2>/dev/null)

if [ "$response" = "200" ]; then
    echo "Kibana is ready"
    exit 0
else
    echo "Kibana is not ready (HTTP $response)"
    exit 1
fi
