param (
    [switch]$Dev
)

$ErrorActionPreference = "Stop"

Write-Host "🍏 [ VendettaUI Build System ]" -ForegroundColor Cyan

# 1. Check/create package.lua
$packageJson = Get-Content -Raw "package.json"
$pkg = $packageJson | ConvertFrom-Json

$packageLuaContent = @"
-- Generated from package.json | build.ps1

return [[
$packageJson
]]
"@
Set-Content -Path "build/package.lua" -Value $packageLuaContent -Encoding UTF8

# 2. Config & Input
$config = "build/darklua.dev.config.json"
$input = "src/Init.lua"
$output = "dist/main.lua"
$temp = "dist/temp.lua"

if (!(Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist" | Out-Null
}

# 3. Locate darklua
$darklua = if (Test-Path ".bin/darklua.exe") { ".bin/darklua.exe" } else { "darklua" }

Write-Host "[ BUILD ] Processing $input through Darklua..." -ForegroundColor Yellow
$sw = [System.Diagnostics.Stopwatch]::StartNew()

& $darklua process $input $temp --config $config

if ($LASTEXITCODE -ne 0 -or !(Test-Path $temp)) {
    Write-Error "Darklua bundling failed!"
    exit 1
}

$sw.Stop()

# 4. Generate Header
$header = Get-Content -Raw "build/header.lua"
$date = Get-Date -Format "yyyy-MM-dd"
$header = $header -replace '\{\{VERSION\}\}', $pkg.version `
                  -replace '\{\{BUILD_DATE\}\}', $date `
                  -replace '\{\{DESCRIPTION\}\}', $pkg.description `
                  -replace '\{\{REPOSITORY\}\}', $pkg.repository `
                  -replace '\{\{LICENSE\}\}', $pkg.license

# 5. Assemble final dist/main.lua
$bundleBody = Get-Content -Raw $temp
$finalContent = "$header`n`n$bundleBody"
Set-Content -Path $output -Value $finalContent -Encoding UTF8
Remove-Item $temp -Force

$sizeKB = [math]::Round((Get-Item $output).Length / 1KB, 1)

Write-Host "✓ [ SUCCESS ] VendettaUI build completed successfully!" -ForegroundColor Green
Write-Host "  Version: $($pkg.version)" -ForegroundColor Gray
Write-Host "  Time:    $($sw.ElapsedMilliseconds)ms" -ForegroundColor Gray
Write-Host "  Size:    $sizeKB KB" -ForegroundColor Gray
Write-Host "  Output:  $output" -ForegroundColor Cyan
