# Mobile UX Issues — Android x86_64 Emulator

**Date:** 2026-10-26  
**Device:** emulator-5554 (x86_64, 1080x1920 portrait)  
**APK:** game_x86_64_debug_optimized.apk  

---

## Screen & Resolution
- **Resolution**: 1080x1920 (portrait)
- **Aspect ratio**: 9:16 (0.5625)
- **DPI**: ~420 (emulator default)
- **Issue**: Game designed for landscape? Camera zoom 1.5x on Player node

## Camera & Player Visibility
- **Camera**: Camera2D following Player with zoom=1.5
- **Player visibility**: Player sprite visible in 03_game_running.png
- **World rendering**: Grid background renders (test_map.tscn)
- **Issue**: Camera framing unknown for mobile — may need zoom adjustment for portrait

## Touch Targets
- **Player movement**: Tap-to-move via NavigationAgent2D in player.gd `_unhandled_input()`
- **Interaction radius**: InteractionManager finds nearest interactable
- **Issue**: No visible touch feedback (ripple, highlight, cursor)
- **Issue**: Touch target sizes unknown — UI buttons may be too small for finger

## HUD Readability
- **CombatHUD**: CanvasLayer with action buttons, AP display, hit chance
- **Text size**: Unknown — not visible in screenshots
- **Issue**: Shader uniform limit may prevent HUD rendering entirely

## Text Legibility
- **DialogueUI**: DialogueText, SpeakerName, OptionsContainer
- **Font**: Default Godot font? No custom font configured
- **Issue**: Russian text support unverified
- **Issue**: Small screen + portrait = narrow dialogue boxes

## Inventory Usability
- **InventoryUI**: CanvasLayer at layer 15, grid-based
- **Item slots**: Unknown count, size
- **Issue**: No drag-drop on touch (mouse-centric design)
- **Issue**: No long-press context menus

## Dialogue Controls
- **Options**: Vertical button list in OptionsContainer
- **Close button**: CloseButton node
- **Issue**: Tap targets may be too small
- **Issue**: No swipe-to-advance or auto-advance

## Combat Targeting
- **CalledShotPanel**: Body part selection grid
- **Target selection**: Tap enemy to select
- **Issue**: Small enemy sprites = hard to tap accurately
- **Issue**: No visual targeting reticle or highlight

## Accidental World Taps
- **Problem**: Tap on empty ground moves player
- **Conflict**: Tap on UI button also triggers world tap (InputEvent propagation)
- **Fix needed**: UI should consume input events (set `mouse_filter = MOUSE_FILTER_STOP`)

## Screen Orientation
- **Current**: Portrait only (Android manifest)
- **Game design**: Isometric/top-down — landscape preferred
- **Issue**: Portrait wastes horizontal space, compresses vertical

## Performance & Latency
- **Frame time**: 2000-5000ms/frame (emulator SwiftShader)
- **Choreographer**: Skipping 1000+ frames
- **Input latency**: Unknown — no visual feedback
- **Real device**: Expected 16-33ms/frame (60-30 FPS)

---

## Functional vs Visual vs Emulator Issues

| Issue | Category | Severity | Fix Priority |
|-------|----------|----------|--------------|
| Shader uniform limit exceeded | Functional (blocks UI rendering) | CRITICAL | 1 — Must fix for any mobile |
| Touch events not visually confirmed | Functional | HIGH | 2 — Add debug overlay |
| No touch feedback (ripple/highlight) | UX | MEDIUM | 3 — Visual polish |
| Portrait orientation | Design | MEDIUM | 4 — Add landscape support |
| Small touch targets | UX | MEDIUM | 5 — Resize for mobile |
| No drag-drop inventory | UX | LOW | 6 — Touch-friendly redesign |
| Emulator frame drops | Emulator-only | LOW | N/A — Ignore on device |

---

## Recommended Immediate Fixes

1. **Reduce shader uniforms** — Simplify CanvasItem shaders, use fewer uniform parameters
2. **Add touch debug overlay** — Visual confirmation of tap coordinates and hit test results
3. **Fix input consumption** — Set `mouse_filter = MOUSE_FILTER_STOP` on all UI panels
4. **Test on physical device** — ARM64 device with Mali/Adreno GPU (higher uniform limits)