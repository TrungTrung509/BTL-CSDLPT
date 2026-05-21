Get-Content "c:\HocTap\CSDLPT\BTL-CSDLPT\Benchmark\CoSo\k6_test.js" -Raw | `
    docker run --rm -i --network benchmark_bench_network grafana/k6 run - 2>&1 | `
    Out-File "c:\HocTap\CSDLPT\BTL-CSDLPT\Benchmark\coso_k6.log" -Encoding utf8
Write-Host "=== COSO XONG ==="
