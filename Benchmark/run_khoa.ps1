Get-Content "c:\HocTap\CSDLPT\BTL-CSDLPT\Benchmark\Khoa\k6_test.js" -Raw | `
    docker run --rm -i --network benchmark_bench_network grafana/k6 run - 2>&1 | `
    Out-File "c:\HocTap\CSDLPT\BTL-CSDLPT\Benchmark\khoa_k6.log" -Encoding utf8
Write-Host "=== KHOA XONG ==="
