$ErrorActionPreference = 'Continue'

Write-Host "=== BAT DAU CHAY DONG THOI K6 BENCHMARK ===" -ForegroundColor Cyan

$Cwd = "c:/HocTap/CSDLPT/BTL-CSDLPT/Benchmark"

$j1 = Start-Job -Name "coso_k6" -InitializationScript { Set-Location "c:/HocTap/CSDLPT/BTL-CSDLPT/Benchmark" } -ScriptBlock {
    Get-Content "CoSo/k6_test.js" -Raw | docker run --rm -i --network benchmark_bench_network grafana/k6 run - 2>&1 | Out-File -Encoding utf8 "coso_k6.log"
}

$j2 = Start-Job -Name "khoa_k6" -InitializationScript { Set-Location "c:/HocTap/CSDLPT/BTL-CSDLPT/Benchmark" } -ScriptBlock {
    Get-Content "Khoa/k6_test.js" -Raw | docker run --rm -i --network benchmark_bench_network grafana/k6 run - 2>&1 | Out-File -Encoding utf8 "khoa_k6.log"
}

Write-Host "CoSo  -> Job ID: $($j1.Id) | Trang thai: $($j1.State)" -ForegroundColor Green
Write-Host "Khoa  -> Job ID: $($j2.Id) | Trang thai: $($j2.State)" -ForegroundColor Yellow
Write-Host ""
Write-Host "Ca 2 dang chay song song (~2 phut 30 giay). Theo doi tren Grafana: http://localhost:3001" -ForegroundColor Cyan
Write-Host "Log: coso_k6.log va khoa_k6.log"
