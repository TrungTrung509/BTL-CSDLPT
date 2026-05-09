param(
    [string]$User1 = "SVHD26CNTT001",
    [string]$Pass1 = "123456",
    [string]$User2 = "SVHD26CNTT002",
    [string]$Pass2 = "123456",
    [string]$ClassA = "HADONG_CSDLPT_01",
    [string]$ClassB = "HADONG_CSDLPT_02"
)

$composeArgs = @(
    "--profile", "benchmark",
    "run", "--rm",
    "-e", "USER1=$User1",
    "-e", "PASS1=$Pass1",
    "-e", "USER2=$User2",
    "-e", "PASS2=$Pass2",
    "-e", "CLASS_A=$ClassA",
    "-e", "CLASS_B=$ClassB",
    "-e", "BENCH_BASE_URL=http://host.docker.internal:8000"
)

Write-Host "Running Deadlock Demo with K6..." -ForegroundColor Cyan
Write-Host "VU 1: $User1 swaps from $ClassA to $ClassB" -ForegroundColor Yellow
Write-Host "VU 2: $User2 swaps from $ClassB to $ClassA" -ForegroundColor Yellow

docker compose @composeArgs k6 run /scripts/deadlock.js
if ($LASTEXITCODE -ne 0) {
    exit $LASTEXITCODE
}
