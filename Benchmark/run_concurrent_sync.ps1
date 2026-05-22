$ErrorActionPreference = 'Continue'
Write-Host "=== BAT DAU CHAY DONG THOI K6 BENCHMARK (Stateful & MinInterval) ===" -ForegroundColor Cyan

# Remove old logs
Remove-Item coso_k6.log, khoa_k6.log, coso_k6_err.log, khoa_k6_err.log -ErrorAction SilentlyContinue

Write-Host "Dang khoi chay k6 CoSo va k6 Khoa..." -ForegroundColor Yellow

$p1 = Start-Process -FilePath "docker" -ArgumentList "run --rm -i --network benchmark_bench_network grafana/k6 run -" -RedirectStandardInput "CoSo/k6_test.js" -RedirectStandardOutput "coso_k6.log" -RedirectStandardError "coso_k6_err.log" -PassThru -NoNewWindow
$p2 = Start-Process -FilePath "docker" -ArgumentList "run --rm -i --network benchmark_bench_network grafana/k6 run -" -RedirectStandardInput "Khoa/k6_test.js" -RedirectStandardOutput "khoa_k6.log" -RedirectStandardError "khoa_k6_err.log" -PassThru -NoNewWindow

Write-Host "CoSo Process ID: $($p1.Id)" -ForegroundColor Green
Write-Host "Khoa Process ID: $($p2.Id)" -ForegroundColor Yellow
Write-Host "Dang chay song song (~2 phut 30 giay). Theo doi tren Grafana: http://localhost:3001" -ForegroundColor Cyan

$p1, $p2 | Wait-Process

Write-Host "=== K6 BENCHMARK HOAN THANH ===" -ForegroundColor Cyan
