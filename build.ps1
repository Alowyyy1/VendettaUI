param (
    [switch]$Dev
)

$ErrorActionPreference = "Stop"

Write-Host "[ VendettaUI Build System ]" -ForegroundColor Cyan

$utf8NoBom = New-Object System.Text.UTF8Encoding $false

$packageJson = [System.IO.File]::ReadAllText("$PWD/package.json", $utf8NoBom)
$pkg = $packageJson | ConvertFrom-Json

$packageLuaContent = "-- Generated from package.json | build.ps1`n`nreturn [[`n$packageJson`n]]"
[System.IO.File]::WriteAllText("$PWD/build/package.lua", $packageLuaContent, $utf8NoBom)

$config = "build/darklua.dev.config.json"
$input = "src/Init.lua"
$output = "dist/main.lua"
$temp = "dist/temp.lua"

if (!(Test-Path "dist")) {
    New-Item -ItemType Directory -Path "dist" | Out-Null
}

$darklua = if (Test-Path ".bin/darklua.exe") { ".bin/darklua.exe" } else { "darklua" }

Write-Host "[ BUILD ] Processing $input through Darklua..." -ForegroundColor Yellow
$sw = [System.Diagnostics.Stopwatch]::StartNew()

& $darklua process $input $temp --config $config

if ($LASTEXITCODE -ne 0 -or !(Test-Path $temp)) {
    Write-Error "Darklua bundling failed!"
    exit 1
}

$sw.Stop()

$header = [System.IO.File]::ReadAllText("$PWD/build/header.lua", $utf8NoBom)
$date = Get-Date -Format "yyyy-MM-dd"
$header = $header.Replace('{{VERSION}}', $pkg.version)
$header = $header.Replace('{{BUILD_DATE}}', $date)
$header = $header.Replace('{{DESCRIPTION}}', $pkg.description)
$header = $header.Replace('{{REPOSITORY}}', $pkg.repository)
$header = $header.Replace('{{LICENSE}}', $pkg.license)

$bundleBody = [System.IO.File]::ReadAllText("$PWD/$temp", $utf8NoBom)
$finalContent = "$header`n`n$bundleBody"
[System.IO.File]::WriteAllText("$PWD/$output", $finalContent, $utf8NoBom)
$gotovye = [System.IO.Path]::Combine("D:\", [System.Text.Encoding]::UTF8.GetString([System.Byte[]](208, 147, 208, 190, 208, 191, 208, 190, 208, 178, 209, 139, 208, 181)))
if (Test-Path $gotovye) {
    Copy-Item -Path "examples/login.lua" -Destination (Join-Path $gotovye "Login.lua") -Force
    Copy-Item -Path "examples/server_def.lua" -Destination (Join-Path $gotovye "server_def.lua") -Force
    Copy-Item -Path "examples/main_menu.lua" -Destination (Join-Path $gotovye "main_menu.lua") -Force
}
Remove-Item $temp -Force

$sizeKB = [math]::Round((Get-Item $output).Length / 1KB, 1)

Write-Host "[ SUCCESS ] VendettaUI build completed successfully!" -ForegroundColor Green
Write-Host "  Version: $($pkg.version)" -ForegroundColor Gray
Write-Host "  Time:    $($sw.ElapsedMilliseconds)ms" -ForegroundColor Gray
Write-Host "  Size:    $sizeKB KB" -ForegroundColor Gray
Write-Host "  Output:  $output" -ForegroundColor Cyan
