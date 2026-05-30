
# SETUP CENTRALIZED DATABASE

$ErrorActionPreference = "Stop"
$ProjectRoot = "e:\2.PTIT\DangKiHocPhan\BTL-CSDLPT"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  SETUP CENTRALIZED DATABASE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Start container
Write-Host "[1/6] Starting postgres_centralized container..." -ForegroundColor Yellow
docker compose -f "$ProjectRoot\docker\docker-compose.yml" up -d postgres_centralized

# Wait for container to be ready
Write-Host "Waiting for database to be ready..." -ForegroundColor Yellow
$MaxWait = 60
$Waited = 0
while ($Waited -lt $MaxWait) {
    $Ready = docker exec csdlpt_centralized pg_isready -U csdlpt_user -d csdlpt_centralized 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Database is ready!" -ForegroundColor Green
        break
    }
    Start-Sleep -Seconds 2
    $Waited += 2
}
if ($Waited -ge $MaxWait) {
    Write-Host "ERROR: Database did not become ready in $MaxWait seconds" -ForegroundColor Red
    exit 1
}

# Step 2: Drop and recreate schema
Write-Host "[2/6] Dropping old schema (if exists)..." -ForegroundColor Yellow
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;" 2>$null

# Step 3: Create schema
Write-Host "[3/6] Creating centralized schema..." -ForegroundColor Yellow
docker cp "$ProjectRoot\db\centralized\01_centralized_schema.sql" csdlpt_centralized:/tmp/centralized_schema.sql
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -f /tmp/centralized_schema.sql

# Step 4: Enable dblink extension
Write-Host "[4/6] Enabling dblink extension..." -ForegroundColor Yellow
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -c "CREATE EXTENSION IF NOT EXISTS dblink;"

# Step 5: Import data
Write-Host "[5/6] Importing data from 3 sites..." -ForegroundColor Yellow
docker cp "$ProjectRoot\db\centralized\02_import_data.sql" csdlpt_centralized:/tmp/import_data.sql
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -f /tmp/import_data.sql

# Step 6: Fix ReplicationOutbox column type and re-import
Write-Host "[6/6] Fixing ReplicationOutbox column type..." -ForegroundColor Yellow
docker cp "$ProjectRoot\scripts\fix_replicationoutbox.sql" csdlpt_centralized:/tmp/fix.sql
docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -f /tmp/fix.sql

Write-Host ""
Write-Host "  CENTRALIZED DATABASE SETUP COMPLETE" -ForegroundColor Green
Write-Host ""
Write-Host "Database: csdlpt_centralized (port 5435)" -ForegroundColor Cyan
Write-Host "User: csdlpt_user" -ForegroundColor Cyan
Write-Host "Password: csdlpt_pass" -ForegroundColor Cyan
Write-Host ""
Write-Host "Connect from host:" -ForegroundColor Yellow
Write-Host "  psql -h localhost -p 5435 -U csdlpt_user -d csdlpt_centralized" -ForegroundColor White
Write-Host ""
Write-Host "Run benchmark:" -ForegroundColor Yellow
Write-Host "  powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1" -ForegroundColor White
