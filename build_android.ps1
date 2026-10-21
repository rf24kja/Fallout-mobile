<#
.SYNOPSIS
    Build Android APK/AAB for Fallout 2 Reborn Mobile (Wasteland RPG Prototype)
.DESCRIPTION
    Reproducible build script for Godot 4.7.2 Android export.
    Supports both Debug (APK) and Release (AAB) builds.
.NOTES
    Requires: Godot 4.7.2 console, Android SDK at C:\Android\Sdk, export templates installed
    For Release: Set RELEASE_KEYSTORE_PASSWORD environment variable or pass -ReleaseKeystorePassword
#>

param(
    [string]$GodotPath = "C:\Users\rf24k\AppData\Local\Microsoft\WinGet\Packages\GodotEngine.GodotEngine_Microsoft.Winget.Source_8wekyb3d8bbwe\Godot_v4.7.2-stable_win64_console.exe",
    [string]$ProjectPath = "C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile",
    [ValidateSet("Debug", "Release")]
    [string]$BuildType = "Debug",
    [string]$ReleaseKeystorePassword = ""
)

$ErrorActionPreference = "Stop"

# Set build-specific parameters
if ($BuildType -eq "Debug") {
    $ExportPreset = "Android Debug"
    $OutputPath = "$ProjectPath\builds\android\Wasteland_RPG_Prototype_Debug.apk"
    $ExportFlag = "--export-debug"
} else {
    $ExportPreset = "Android Release"
    $OutputPath = "$ProjectPath\builds\android\Wasteland_RPG_Prototype_Release.aab"
    $ExportFlag = "--export-release"
}

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Wasteland RPG Prototype - Android $BuildType Build" -ForegroundColor Cyan
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

if ($BuildType -eq "Debug") {
    if (-not (Test-Path "$ProjectPath\keystore\debug.keystore")) {
        Write-Error "Debug keystore not found"
        exit 1
    }
    Write-Host "  [OK] Debug keystore" -ForegroundColor Green
} else {
    if (-not (Test-Path "$ProjectPath\keystore\release.keystore")) {
        Write-Error "Release keystore not found at $ProjectPath\keystore\release.keystore"
        exit 1
    }
    # Check if password provided via param or env var
    $keystorePass = $ReleaseKeystorePassword
    if (-not $keystorePass) {
        $keystorePass = $env:RELEASE_KEYSTORE_PASSWORD
    }
    if (-not $keystorePass) {
        Write-Error "Release keystore password not provided. Set RELEASE_KEYSTORE_PASSWORD env var or pass -ReleaseKeystorePassword"
        exit 1
    }
    Write-Host "  [OK] Release keystore" -ForegroundColor Green
}

$env:ANDROID_HOME = "C:\Android\Sdk"
$env:PATH += ";$env:ANDROID_HOME\cmdline-tools\latest\bin;$env:ANDROID_HOME\platform-tools;$env:ANDROID_HOME\build-tools\36.0.0"
$env:JAVA_HOME = "C:\Program Files\Microsoft\jdk-21.0.12.101-hotspot"
$env:ANDROID_SDK_ROOT = $env:ANDROID_HOME
$env:ANDROID_NDK_HOME = "$env:ANDROID_HOME\ndk\25.1.8937393"

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
Write-Host "Building $($BuildType.ToLower()) package..." -ForegroundColor Yellow

# Ensure output directory exists
$outputDir = Split-Path $OutputPath -Parent
if (-not (Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Run Godot headless export
$cmd = @(
    $GodotPath,
    "--headless",
    "--rendering-driver", "opengl3",
    "--rendering-method", "gl_compatibility",
    "--path", $ProjectPath,
    $ExportFlag, $ExportPreset,
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
Write-Host "Verifying package..." -ForegroundColor Yellow

if (-not (Test-Path $OutputPath)) {
    Write-Error "Package not found at output path: $OutputPath"
    exit 1
}

$packageSize = (Get-Item $OutputPath).Length
$sizeMB = [math]::Round($packageSize / 1MB, 2)
Write-Host "  [OK] Package created: $OutputPath" -ForegroundColor Green
Write-Host "  [OK] Size: $sizeMB MB" -ForegroundColor Green

# Verify package with aapt2 (works for both APK and AAB)
$aaptPath = "$env:ANDROID_HOME\build-tools\36.0.0\aapt2.exe"
if (Test-Path $aaptPath) {
    Write-Host ""
    Write-Host "Package Info:" -ForegroundColor Yellow
    & $aaptPath dump badging $OutputPath | Select-String -Pattern "package:|versionCode|versionName|application-label:|launchable-activity:|target-sdk-version:|compile-sdk-version:" | ForEach-Object { Write-Host "  $_" -ForegroundColor Gray }
}

# Check if we can install to connected device/emulator
Write-Host ""
Write-Host "Checking for connected devices..." -ForegroundColor Yellow
$devices = & "$env:ANDROID_HOME\platform-tools\adb.exe" devices
if ($devices -match '\w+\s+device') {
    Write-Host "  Devices found:" -ForegroundColor Green
    $devices | ForEach-Object { Write-Host "    $_" -ForegroundColor Gray }
    Write-Host ""
    if ($BuildType -eq "Debug") {
        Write-Host "To install: adb install -r `"$OutputPath`"" -ForegroundColor Cyan
    } else {
        Write-Host "Release AAB cannot be installed directly. Use bundletool or upload to Play Console." -ForegroundColor Cyan
    }
} else {
    Write-Host "  No devices connected" -ForegroundColor Yellow
    Write-Host ""
    if ($BuildType -eq "Debug") {
        Write-Host "To install later: adb install -r `"$OutputPath`"" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "BUILD SUCCESSFUL" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
exit 0