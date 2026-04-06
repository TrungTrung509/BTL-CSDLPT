param(
    [ValidateSet('all', 'hadong', 'ngoctruc', 'hoalac')]
    [string]$Site = 'all'
)

$ErrorActionPreference = 'Stop'

function Invoke-Docker {
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Args
    )

    & docker @Args
    if ($LASTEXITCODE -ne 0) {
        throw "Docker command failed: docker $($Args -join ' ')"
    }
}

$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
$commonSql = Join-Path $repoRoot 'seeds\output\common\001_common_data.sql'
$indexesSql = Join-Path $repoRoot 'sql\indexes.sql'

$sites = @(
    @{
        Key = 'hadong'
        Container = 'csdlpt_hadong'
        Database = 'csdlpt_hadong'
        SiteSql = Join-Path $repoRoot 'seeds\output\site_hadong\001_site_data.sql'
    },
    @{
        Key = 'ngoctruc'
        Container = 'csdlpt_ngoctruc'
        Database = 'csdlpt_ngoctruc'
        SiteSql = Join-Path $repoRoot 'seeds\output\site_ngoctruc\001_site_data.sql'
    },
    @{
        Key = 'hoalac'
        Container = 'csdlpt_hoalac'
        Database = 'csdlpt_hoalac'
        SiteSql = Join-Path $repoRoot 'seeds\output\site_hoalac\001_site_data.sql'
    }
)

if ($Site -ne 'all') {
    $sites = $sites | Where-Object { $_.Key -eq $Site }
}

foreach ($path in @($commonSql, $indexesSql) + ($sites | ForEach-Object { $_.SiteSql })) {
    if (-not (Test-Path $path)) {
        throw "Missing file: $path"
    }
}

foreach ($siteConfig in $sites) {
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "Seeding $($siteConfig.Container)" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan

    Invoke-Docker -Args @('cp', $commonSql, "$($siteConfig.Container):/tmp/001_common_data.sql")
    Invoke-Docker -Args @('cp', $siteConfig.SiteSql, "$($siteConfig.Container):/tmp/001_site_data.sql")
    Invoke-Docker -Args @('cp', $indexesSql, "$($siteConfig.Container):/tmp/indexes.sql")

    Invoke-Docker -Args @('exec', '-e', 'PGCLIENTENCODING=UTF8', $siteConfig.Container, 'psql', '-U', 'csdlpt_user', '-d', $siteConfig.Database, '-f', '/tmp/001_common_data.sql')
    Invoke-Docker -Args @('exec', '-e', 'PGCLIENTENCODING=UTF8', $siteConfig.Container, 'psql', '-U', 'csdlpt_user', '-d', $siteConfig.Database, '-f', '/tmp/001_site_data.sql')
    Invoke-Docker -Args @('exec', '-e', 'PGCLIENTENCODING=UTF8', $siteConfig.Container, 'psql', '-U', 'csdlpt_user', '-d', $siteConfig.Database, '-f', '/tmp/indexes.sql')

    Invoke-Docker -Args @('exec', $siteConfig.Container, 'rm', '-f', '/tmp/001_common_data.sql', '/tmp/001_site_data.sql', '/tmp/indexes.sql')
}

Write-Host ""
Write-Host "Seed completed successfully." -ForegroundColor Green
