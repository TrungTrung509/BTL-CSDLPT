# =============================================================
# Tạo Debezium connectors & Elasticsearch Mapping (Chuẩn)
# Đảm bảo ThoiGian là date cho cả index riêng & tổng
# =============================================================

$ConnectUrl = "http://localhost:8083/connectors"
$EsUrl      = "http://localhost:9200"

Write-Host "=== Bước 1: Kiểm tra dịch vụ ===" -ForegroundColor Cyan
try {
    Invoke-RestMethod -Uri $ConnectUrl -Method Get | Out-Null
    Write-Host "Kafka Connect ready." -ForegroundColor Green
} catch {
    Write-Host "LỖI: Kafka Connect chưa sẵn sàng." -ForegroundColor Red; return
}
try {
    Invoke-RestMethod -Uri "$EsUrl/_cluster/health" -Method Get | Out-Null
    Write-Host "Elasticsearch ready." -ForegroundColor Green
} catch {
    Write-Host "LỖI: Elasticsearch chưa sẵn sàng." -ForegroundColor Red; return
}

# --- Xoá connectors cũ ---
Write-Host "`n▶ Xoá connectors cũ..." -ForegroundColor Yellow
try {
    $connectors = (Invoke-RestMethod -Uri $ConnectUrl -Method Get)
    foreach ($c in $connectors) {
        Invoke-RestMethod -Uri "$ConnectUrl/$c" -Method Delete | Out-Null
    }
    Start-Sleep -Seconds 2
} catch { }

# --- Xoá index cũ triệt để ---
Write-Host "▶ Xoá index cũ..." -ForegroundColor Yellow
Invoke-RestMethod -Uri "$EsUrl/*nhatky*" -Method Delete -ErrorAction SilentlyContinue
Invoke-RestMethod -Uri "$EsUrl/*NhatKy*" -Method Delete -ErrorAction SilentlyContinue
Invoke-RestMethod -Uri "$EsUrl/nhat-ky-thao-tac" -Method Delete -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# --- Template ---
Write-Host "▶ Nạp Index Template..." -ForegroundColor Yellow
$template = @{
    index_patterns = @("*nhatky*", "*NhatKy*", "nhat-ky-thao-tac")
    priority = 100
    template = @{
        settings = @{ "index.refresh_interval" = "1s" }
        mappings = @{
            properties = @{
                ThoiGian   = @{ type = "date"; format = "epoch_millis||strict_date_optional_time" }
                MaGiaoTac = @{ type = "keyword" }
                MaSV      = @{ type = "keyword" }
                MaLopHP   = @{ type = "keyword" }
                MaCoSo    = @{ type = "keyword" }
                TrangThai = @{ type = "keyword" }
                ChiTiet   = @{ type = "text" }
            }
        }
    }
}
Invoke-RestMethod -Uri "$EsUrl/_index_template/nhatky_template" -Method Put -Body ($template | ConvertTo-Json -Depth 10) -ContentType "application/json"
Start-Sleep -Seconds 1

# --- Hàm tạo source ---
function Create-SourceConnector {
    param($Site, $HostName, $DB)
    $config1 = @{
        name = "src-$Site-ind"
        config = @{
            "connector.class"          = "io.debezium.connector.postgresql.PostgresConnector"
            "database.hostname"        = $HostName
            "database.port"            = "5432"
            "database.user"            = "csdlpt_user"
            "database.password"        = "csdlpt_pass"
            "database.dbname"          = $DB
            "database.server.name"     = $Site
            "topic.prefix"             = $Site
            "table.include.list"       = "public.nhatkythaotac"
            "plugin.name"              = "pgoutput"
            "slot.name"                = "dbz_${Site}_ind"
            "publication.name"         = "dbz_pub_${Site}_ind"
        }
    }
    $body1 = $config1 | ConvertTo-Json -Depth 10
    try { Invoke-RestMethod -Uri $ConnectUrl -Method Post -Body $body1 -ContentType "application/json" } catch { Write-Host "Lỗi tạo $($config1.name)" }
    
    $config2 = @{
        name = "src-$Site-uni"
        config = @{
            "connector.class"          = "io.debezium.connector.postgresql.PostgresConnector"
            "database.hostname"        = $HostName
            "database.port"            = "5432"
            "database.user"            = "csdlpt_user"
            "database.password"        = "csdlpt_pass"
            "database.dbname"          = $DB
            "database.server.name"     = "$Site-uni"
            "topic.prefix"             = "$Site-uni"
            "table.include.list"       = "public.nhatkythaotac"
            "plugin.name"              = "pgoutput"
            "slot.name"                = "dbz_${Site}_uni"
            "publication.name"         = "dbz_pub_${Site}_uni"
            "transforms"               = "route"
            "transforms.route.type"    = "org.apache.kafka.connect.transforms.RegexRouter"
            "transforms.route.regex"   = ".*"
            "transforms.route.replacement" = "nhat-ky-thao-tac"
        }
    }
    $body2 = $config2 | ConvertTo-Json -Depth 10
    try { Invoke-RestMethod -Uri $ConnectUrl -Method Post -Body $body2 -ContentType "application/json" } catch { Write-Host "Lỗi tạo $($config2.name)" }
}

Create-SourceConnector "hadong" "postgres_hadong" "csdlpt_hadong"
Create-SourceConnector "hoalac" "postgres_hoalac" "csdlpt_hoalac"
Create-SourceConnector "ngoctruc" "postgres_ngoctruc" "csdlpt_ngoctruc"

# --- Sink Connectors ---
Write-Host "▶ Tạo Sink Connectors..." -ForegroundColor Yellow
$sinkInd = @{
    name = "es-sink-ind"
    config = @{
        "connector.class" = "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector"
        "connection.url" = "http://elasticsearch:9200"
        "tasks.max" = "1"
        "topics.regex" = "(?i).*nhatkythaotac"
        "key.ignore" = "true"
        "schema.ignore" = "true"
        "transforms" = "unwrap"
        "transforms.unwrap.type" = "io.debezium.transforms.ExtractNewRecordState"
    }
}
Invoke-RestMethod -Uri $ConnectUrl -Method Post -Body ($sinkInd | ConvertTo-Json -Depth 10) -ContentType "application/json" -ErrorAction SilentlyContinue

$sinkUni = @{
    name = "es-sink-uni"
    config = @{
        "connector.class" = "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector"
        "connection.url" = "http://elasticsearch:9200"
        "tasks.max" = "1"
        "topics" = "nhat-ky-thao-tac"
        "key.ignore" = "true"
        "schema.ignore" = "true"
        "transforms" = "unwrap"
        "transforms.unwrap.type" = "io.debezium.transforms.ExtractNewRecordState"
    }
}

Invoke-RestMethod -Uri $ConnectUrl -Method Post -Body ($sinkUni | ConvertTo-Json -Depth 10) -ContentType "application/json" -ErrorAction SilentlyContinue

Write-Host "`n=== HOÀN TẤT ===" -ForegroundColor Cyan
Write-Host "Dữ liệu sẽ vào ES. Tạo Data View với pattern '*nhatky*', timestamp field = ThoiGian"