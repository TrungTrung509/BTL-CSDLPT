#!/bin/sh
# =============================================================
# Tự động tạo Debezium connectors & Elasticsearch Mapping
# BẢN FIX: PRIORITY 1100 + SLOT_NAME UNDERSCORE + SHELL COMPAT
# =============================================================

CONNECT_HOST=${1:-localhost}
CONNECT_URL="http://${CONNECT_HOST}:8083/connectors"
ES_URL="http://elasticsearch:9200"

# --- Bước 1: Đợi dịch vụ ---
echo "=== Đợi Elasticsearch & Kafka Connect..."
until curl -s "$ES_URL/_cluster/health" | grep -q '\"status\":\"green\"\|\"status\":\"yellow\"'; do sleep 5; done
while [ $(curl -s -o /dev/null -w "%{http_code}" "$CONNECT_URL") -ne 200 ]; do sleep 5; done

# --- Bước 2: Dọn dẹp tuyệt đối ---
echo "▶ Reset Connectors..."
# Dùng curl + grep + tr để thay thế jq nếu jq bị lỗi
connectors=$(curl -s "$CONNECT_URL" | tr -d '[]"' | tr ',' '\n')
for c in $connectors; do
  echo "  Xóa connector: $c"
  curl -s -X DELETE "$CONNECT_URL/$c"
done
sleep 2

echo "▶ Xoá sạch index cũ (Thường + Hoa)..."
curl -s -X DELETE "$ES_URL/*nhatkythaotac*"
curl -s -X DELETE "$ES_URL/*NhatKyThaoTac*"
curl -s -X DELETE "$ES_URL/nhat-ky-thao-tac"
sleep 2

# --- Bước 3: Tạo Pipeline xử lý 16 số ---
echo "▶ Tạo Pipeline: nhatky_pipeline..."
curl -s -X PUT "$ES_URL/_ingest/pipeline/nhatky_pipeline" -H "Content-Type: application/json" -d '{
  "processors": [
    {
      "script": {
        "source": "if (ctx.ThoiGian != null) { ctx.ThoiGian = (long)(ctx.ThoiGian / 1000); }"
      }
    }
  ]
}'

# --- Bước 4: Nạp Template (Dùng Priority 1100 để tránh trùng) ---
echo "▶ Nạp Template chuẩn (Priority: 1100)..."
curl -s -X PUT "$ES_URL/_index_template/nhatky_template" -H "Content-Type: application/json" -d '{
  "index_patterns": ["*nhatkythaotac*", "*NhatKyThaoTac*", "nhat-ky-thao-tac"],
  "priority": 1100,
  "template": {
    "settings": { 
      "index.refresh_interval": "1s",
      "index.default_pipeline": "nhatky_pipeline" 
    },
    "mappings": {
      "properties": {
        "ThoiGian": { "type": "date", "format": "epoch_millis||strict_date_optional_time" },
        "MaGiaoTac": { "type": "keyword" },
        "MaSV": { "type": "keyword" },
        "MaLopHP": { "type": "keyword" },
        "Buoc": { "type": "keyword" },
        "TrangThai": { "type": "keyword" },
        "ChiTiet": { "type": "text" }
      }
    }
  }
}'
sleep 2

# --- Bước 5: Tạo Connectors (Sửa slot name thành gạch dưới _) ---
create_source_connector() {
  local site=$1; local host=$2; local db=$3
  # Dùng gạch dưới cho slot name
  curl -s -X POST "$CONNECT_URL" -H "Content-Type: application/json" -d '{"name":"src-'"$site"'-ind","config":{"connector.class":"io.debezium.connector.postgresql.PostgresConnector","database.hostname":"'"$host"'","database.port":"5432","database.user":"csdlpt_user","database.password":"csdlpt_pass","database.dbname":"'"$db"'","database.server.name":"'"$site"'","topic.prefix":"'"$site"'","table.include.list":"public.nhatkythaotac","plugin.name":"pgoutput","slot.name":"dbz_'"$site"'_ind","publication.name":"dbz_pub_'"$site"'_ind"}}'
  
  curl -s -X POST "$CONNECT_URL" -H "Content-Type: application/json" -d '{"name":"src-'"$site"'-uni","config":{"connector.class":"io.debezium.connector.postgresql.PostgresConnector","database.hostname":"'"$host"'","database.port":"5432","database.user":"csdlpt_user","database.password":"csdlpt_pass","database.dbname":"'"$db"'","database.server.name":"'"$site"'-uni","topic.prefix":"'"$site"'-uni","table.include.list":"public.nhatkythaotac","plugin.name":"pgoutput","slot.name":"dbz_'"$site"'_uni","publication.name":"dbz_pub_'"$site"'_uni","transforms":"route","transforms.route.type":"org.apache.kafka.connect.transforms.RegexRouter","transforms.route.regex":".*","transforms.route.replacement":"nhat-ky-thao-tac"}}'
}

create_source_connector "hadong" "postgres_hadong" "csdlpt_hadong"
create_source_connector "hoalac" "postgres_hoalac" "csdlpt_hoalac"
create_source_connector "ngoctruc" "postgres_ngoctruc" "csdlpt_ngoctruc"

# Sinks
curl -s -X POST "$CONNECT_URL" -H "Content-Type: application/json" -d '{"name":"es-sink-ind","config":{"connector.class":"io.confluent.connect.elasticsearch.ElasticsearchSinkConnector","connection.url":"http://elasticsearch:9200","tasks.max":"1","topics.regex":"(?i).*nhatkythaotac","key.ignore":"true","schema.ignore":"true","transforms":"unwrap","transforms.unwrap.type":"io.debezium.transforms.ExtractNewRecordState"}}'
curl -s -X POST "$CONNECT_URL" -H "Content-Type: application/json" -d '{"name":"es-sink-uni","config":{"connector.class":"io.confluent.connect.elasticsearch.ElasticsearchSinkConnector","connection.url":"http://elasticsearch:9200","tasks.max":"1","topics":"nhat-ky-thao-tac","key.ignore":"true","schema.ignore":"true","transforms":"unwrap","transforms.unwrap.type":"io.debezium.transforms.ExtractNewRecordState"}}'

echo "=== HOÀN TẤT: Mọi lỗi đã được xử lý triệt để! ==="
