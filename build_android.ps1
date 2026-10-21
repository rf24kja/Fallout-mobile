<#
.SYNOPSIS
    Build Android APK for Fallout 2 Reborn Mobile
.DESCRIPTION
    Reproducible build script for Godot 4.7.2 Android export.
    Uses headless Godot to export debug APK.
.NOTES
    Requires: Godot 4.7.2 console, Android SDK at C:\Android\Sdk, export templates installed
#>

param(
    [string]$GodotPath = "C:\Users\rf24k\AppData\Local\Microsoft\WinGet\Packages\GodotEngine.GodotEngine_Microsoft.Winget.Source_8wekyb3d8bbwe\Godot_v4.7.2-stable_win64_console.exe",
    [string]$ProjectPath = "C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile",
    [string]$ExportPreset = "Android Debug",
    [string]$OutputPath = "C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\builds\android\Fallout2_Reborn_Mobile_Debug.apk",
    [string]$AndroidSdkPath = "C:\Android\Sdk"
)

$ErrorActionPreference = "Stop"

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Fallout 2 Reborn Mobile - Android Build" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Verify prerequisites
Write-Host "Verifying prerequisites..." -ForegroundColor Yellow

if (-not (Test-Path $GodotPath)) {
    Write-Error "Godot not found at: $GodotPath"
    exit 1
}
Write-Host "  [OK] Godot: $GodotPath" -ForegroundColor Green

if (-not (Test-Path $ProjectPath)) {
    Write-Error "Project not found at: $ProjectPath"
    exit 1
}
Write-Host "  [OK] Project: $ProjectPath" -ForegroundColor Green

if (-not (Test-Path "$ProjectPath\export_presets.cfg")) {
    Write-Error "export_presets.cfg not found in project"
    exit 1
}
Write-Host "  [OK] export_presets.cfg" -ForegroundColor Green

if (-not (Test-Path "$ProjectPath\keystore\debug.keystore")) {
    Write-Error "Debug keystore not found"
    exit 1
}
Write-Host "  [OK] Debug keystore" -ForegroundColor Green

$env:ANDROID_HOME = $AndroidSdkPath
$env:PATH += ";$env:ANDROID_HOME\cmdline-tools\latest\bin;$env:ANDROID_HOME\platform-tools;$env:ANDROID_HOME\build-tools\34.0.0"
$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot"
$env:ANDROID_SDK_ROOT = $AndroidSdkPath
$env:ANDROID_NDK_HOME = "$AndroidSdkPath\ndk\25.1.8937393"

if (-not (Test-Path "$env:ANDROID_HOME\platform-tools\adb.exe")) {
    Write-Error "Android SDK not properly configured at $env:ANDROID_HOME"
    exit 1
}
Write-Host "  [OK] Android SDK: $env:ANDROID_HOME" -ForegroundColor Green
Write-Host "  [OK] Java SDK: $env:JAVA_HOME" -ForegroundColor Green

# Check export templates
$templateDir = "$env:APPDATA\Godot\export_templates\4.7.2.stable"
if (-not (Test-Path "$templateDir\android_debug.apk")) {
    Write-Error "Android export templates not found at $templateDir"
    exit 1
}
Write-Host "  [OK] Export templates" -ForegroundColor Green

Write-Host ""
Write-Host "Building APK..." -ForegroundColor Yellow

# Ensure output directory exists
$outputDir = Split-Path $OutputPath -Parent
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Run Godot headless export (Godot 4 uses --export-debug for debug builds)
$cmd = @(
    $GodotPath,
    "--headless",
    "--rendering-driver", "opengl3",
    "--rendering-method", "gl_compatibility",
    "--path", $ProjectPath,
    "--export-debug", $ExportPreset,
    $OutputPath
)

Write-Host "Command: $($cmd -join ' ')" -ForegroundColor Gray

$exitCode = 0
try {
    & $cmd[0] $cmd[1..($cmd.Length-1)]
    $exitCode = $LASTEXITCODE
} catch {
    Write-Error "Godot export failed: $_"
    exit 1
}

if ($exitCode -ne 0) {
    Write-Error "Godot export failed with exit code $exitCode"
    exit $exitCode
}

Write-Host ""
Write-Host "Verifying APK..." -ForegroundColor Yellow

if (-not (Test-Path $OutputPath)) {
    Write-Error "APK not found at output path: $OutputPath"
    exit 1
}

$apkSize = (Get-Item $OutputPath).Length
Write-Host "  [OK] APK created: $OutputPath" -ForegroundColor Green
Write-Host "  [OK] Size: $([math]::Round($apkSize / 1MB, 2)) MB" -ForegroundColor Green

# Verify APK with aapt2
$aaptPath = "$env:ANDROID_HOME\build-tools\34.0.0\aapt2.exe"
if (Test-Path $aaptPath) {
    Write-Host ""
    Write-Host "APK Info:" -ForegroundColor Yellow
    & $aaptPath dump badging $OutputPath | Select-String -Pattern "package:|versionCode|versionName|application-label:|launchable-activity:" | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
}

# Check if we can install to connected device/emulator
Write-Host ""
Write-Host "Checking for connected devices..." -ForegroundColor Yellow
$devices = & "$env:ANDROID_HOME\platform-tools\adb.exe" devices
if ($devices -match '\w+\s+device') {
    Write-Host "  Devices found:" -ForegroundColor Green
    $devices | ForEach-Object { Write-Host "    $_" -ForegroundColor Gray }
    Write-Host ""
    Write-Host "To install: adb install -r `"$OutputPath`"" -ForegroundColor Cyan
} else {
    Write-Host "  No devices connected" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "To install later: adb install -r `"$OutputPath`"" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "BUILD SUCCESSFUL" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
exit 0