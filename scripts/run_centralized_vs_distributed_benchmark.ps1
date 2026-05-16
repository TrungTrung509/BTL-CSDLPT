# ============================================================
# BENCHMARK SCRIPT - Centralized vs Distributed
# ============================================================

$ErrorActionPreference = "Stop"
$ProjectRoot = "e:\2.PTIT\DangKiHocPhan\BTL-CSDLPT"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  BENCHMARK: Centralized vs Distributed" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Output file
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$OutputFile = "$ProjectRoot\docs\benchmark\benchmark_results_$Timestamp.md"

# Ensure output dir exists
$null = New-Item -ItemType Directory -Force -Path "$ProjectRoot\docs\benchmark" 2>$null

Write-Host "[1/4] Running centralized queries..." -ForegroundColor Yellow

# Copy centralized queries to container
docker cp "$ProjectRoot\sql\benchmark\centralized_queries.sql" csdlpt_centralized:/tmp/centralized_queries.sql

# Run centralized benchmark
$CentralizedOutput = docker exec csdlpt_centralized psql -U csdlpt_user -d csdlpt_centralized -f /tmp/centralized_queries.sql 2>&1

Write-Host "[2/4] Running distributed queries..." -ForegroundColor Yellow

# Copy distributed queries to HADONG container
docker cp "$ProjectRoot\sql\benchmark\distributed_queries.sql" csdlpt_hadong:/tmp/distributed_queries.sql

# Run distributed benchmark
$DistributedOutput = docker exec csdlpt_hadong psql -U csdlpt_user -d csdlpt_hadong -f /tmp/distributed_queries.sql 2>&1

Write-Host "[3/4] Generating report..." -ForegroundColor Yellow

# Generate markdown report
$ReportContent = @"
# Benchmark Results: Centralized vs Distributed
Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")

## ENVIRONMENT

- **Centralized DB**: csdlpt_centralized (port 5435)
- **Distributed Sites**: csdlpt_hadong (5432), csdlpt_ngoctruc (5433), csdlpt_hoalac (5434)
- **Note**: FDW setup at HADONG site connects to NGOCTRUC and HOALAC

---

## CENTRALIZED MODEL RESULTS (port 5435)

\`\`\`
$CentralizedOutput
\`\`\`

---

## DISTRIBUTED MODEL RESULTS (HADONG site with FDW)

\`\`\`
$DistributedOutput
\`\`\`

---

## SUMMARY

| Query | Centralized Execution Time | Distributed Execution Time | Winner |
|-------|---------------------------|--------------------------|--------|
"@

# Parse execution times (rough extraction)
# Note: This is a simplified extraction. For precise timing, use pg_stat_statements.
$ReportContent += @"

---

## NOTES

- Times shown are from `EXPLAIN (ANALYZE, BUFFERS, FORMAT TEXT)`
- Distributed queries show `Foreign Scan` nodes when accessing remote sites
- Dataset size is small (~30 students, 30 LHP, 45 schedules per site), so differences may be minimal
- Architecture trends are more important than absolute values at this scale

## HOW TO RE-RUN

```powershell
powershell -ExecutionPolicy Bypass -File scripts/run_centralized_vs_distributed_benchmark.ps1
```
"@

# Save report
$ReportContent | Out-File -FilePath $OutputFile -Encoding UTF8

Write-Host "[4/4] Done. Report saved to: $OutputFile" -ForegroundColor Green
Write-Host ""
Write-Host "IMPORTANT: Check if FDW is configured at HADONG site." -ForegroundColor Red
Write-Host "If distributed queries fail, run FDW setup first:" -ForegroundColor Red
Write-Host "  docker compose -f docker/docker-compose.yml up fdw_setup" -ForegroundColor Red
