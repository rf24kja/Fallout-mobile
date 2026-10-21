# Performance Baseline

## Test Environment

| Component | Specification |
|-----------|---------------|
| **Date** | 2026-10-21 |
| **Godot Version** | 4.7.2.stable |
| **Android SDK** | 36 (API 36) |
| **NDK Version** | 25.1.8937393 |
| **Java** | Microsoft JDK 21.0.12.101-hotspot |
| **Export Templates** | 4.7.2.stable |

## Device Status

**Physical Device Testing: NOT PERFORMED** - No physical ARM64 Android device available.

**Emulator Testing: BLOCKED** - Only x86_64 emulator (API 34) available. APK contains only arm64-v8a native libraries (INSTALL_FAILED_NO_MATCHING_ABIS).

## APK Metrics

| Build Type | File | Size | Architectures | Target SDK |
|------------|------|------|---------------|------------|
| Debug | `Wasteland_RPG_Prototype_Debug.apk` | ~28 MB | arm64-v8a | 36 |
| Release | `Wasteland_RPG_Prototype_Release.apk` | ~28 MB | arm64-v8a | 36 |

## Automated Test Performance (Headless)

| Test Suite | Tests | Duration | Status |
|------------|-------|----------|--------|
| Stage B (Core Systems) | 12 | ~3s | PASS |
| Stage C (Combat & Progression) | 16 | ~5s | PASS |
| **Total** | **28** | **~8s** | **ALL PASS** |

## Known Performance Considerations

1. **Texture Compression**: ETC2/ASTC enabled via `rendering/textures/vram_compression/import_etc2_astc = true`
2. **Rendering Method**: Mobile renderer with `gl_compatibility` mode
3. **Native Libraries**: arm64-v8a only (Godot 4.7.2 export templates limitation)
4. **Package Identity**: `com.example.wastelandrpgprototype` (Godot adds prefix)

## Pending Measurements (Require Physical Device)

- [ ] Cold startup time
- [ ] Average FPS (gameplay)
- [ ] Minimum FPS (combat)
- [ ] Frame time (ms)
- [ ] Memory consumption (MB)
- [ ] Navigation responsiveness (ms)
- [ ] Combat turn latency (ms)
- [ ] Scene transition time (ms)
- [ ] Battery impact

## Target Performance Goals

| Metric | Minimum Device | Recommended Device |
|--------|----------------|---------------------|
| **FPS** | 30 FPS sustained | 60 FPS sustained |
| **Startup** | < 5 seconds | < 3 seconds |
| **Memory** | < 300 MB | < 500 MB |
| **APK Size** | < 100 MB | < 100 MB |

## Next Actions

1. Obtain physical ARM64 Android device (API 30+)
2. Run full device test checklist
3. Record actual performance metrics
4. Profile with Android Studio / Perfetto if issues found
5. Optimize based on measured data

---
*Generated: 2026-10-21*