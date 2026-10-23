# Next Actions — Immediate Execution Queue

## Purpose

Concrete, ordered task list for **this week**. Each action is assignable, testable, and blocked only by the previous.

---

## 🎯 THIS WEEK — ART PIPELINE RECOVERY & TECHNICAL STABILIZATION

### 🎨 ART PRODUCTION PIPELINE — NEW TRACK (Restarted After REV2 Rejection)

| # | Action | Dependency | Status |
|---|--------|------------|--------|
| A1 | **Art Direction & Reference Board**: Define cinematic post-apocalyptic style, gather references | — | ✅ DONE (defined in VISUAL_DIRECTION.md) |
| A2 | **REV2 Production Attempt** (primitive-based procedural modeling) | A1 | ❌ **REJECTED** — Box-like proportions, flat materials, weak gameplay visibility |
| A3 | **Professional Concept Art**: Create CONCEPT_APPROVAL.png for ONE original post-apocalyptic sidearm | A1 | 🔄 **CONCEPT_CANDIDATE — PENDING USER APPROVAL** |
| A4 | **User Approval Gate**: Review concept sheet, approve or request revision | A3 | ⏳ **BLOCKED — DO NOT MODEL UNTIL APPROVED** |
| A5 | **Production Modeling** from approved concept (UV, textures, bevels, weighted normals, materials) | A4 | ⏳ BLOCKED |
| A6 | **In-Game Validation** of approved model at mobile scale | A5 | ⏳ BLOCKED |
| A7 | **Scale to Full Catalog** (characters, armor, weapons, environment) | A6 | ⏳ BLOCKED |

**CRITICAL**: Do NOT scale production to full catalog until A4 (User Approval) is complete. Gameplay development continues with TECHNICAL_PLACEHOLDER assets.

---

### 🔧 TECHNICAL STABILIZATION (Parallel — Safe to Execute Now)

| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| T1 | **Fix `called_shot_panel.gd` parse error** (line 124: expected 'in' or ':' after 'for' variable) | Sys Eng | Godot headless --check-only passes |
| T2 | **Fix `quest_log.gd` parse errors** (missing QuestManager signals, static calls) | Sys Eng | Godot headless --check-only passes |
| T3 | **Investigate InventoryUI scene missing** from test environment | Sys Eng | InventoryUI.tscn loads and instanced in test |
| T4 | **APK Size Audit** — identify 94MB bloat source (libgodot_android.so 72MB is expected debug) | Build Eng | APK analyzer report, exclude dev assets properly |
| T5 | **Verify `weapons_dev.json` excluded** from APK export (currently 3KB included) | Build Eng | Verify excluded in export_presets.cfg |
| T6 | **Run full Godot headless test suite** after all parse fixes | QA | Stage B 11/11 + Stage C 16/16 = 27/27 PASS |
| T7 | **Git commit**: "Art pipeline recovery: concept phase, parse fixes, APK audit" | All | Clean commit with updated PROJECT_STATE.md |

---

## 📋 COMPLETED — Gameplay Systems (Stage D Week 1-3)

| # | System | Status | Notes |
|---|--------|--------|-------|
| 1-20 | Data Foundation, Equipment, Combat DT/DR, Ammo, Called Shots | ✅ DONE | All 44+ tests pass |
| 21-30 | Combat FX, Called Shot UI, Cover System | ✅ DONE | Integrated with CombatSystem |
| 31-40 | Quest System (3 branching quests), Mobile Combat UX (CombatHUD) | ✅ DONE | Autoloads registered |
| 41-45 | Character Visual (Paperdoll), Player Integration | ✅ DONE | Layered equipment system |
| 46-50 | CI & Testing: Stage B 11/11, Stage C 16/16, Android Debug APK 49.6MB | ✅ DONE | All passing |
| 51 | CombatUI script attachment fix | ✅ DONE | Removed return type hints |

---

## 📦 BLOCKERS (Escalate Immediately)

| Blocker | Impact | Resolution |
|---------|--------|------------|
| **CONCEPT_APPROVAL.png not created** | Cannot proceed to production modeling | **PRIORITY 1** — Create professional concept sheet for one sidearm |
| `called_shot_panel.gd` parse error | APK export fails, test suite blocked | Fix GDScript syntax error on line 124 |
| `quest_log.gd` parse errors | Quest UI non-functional | Fix missing signals and static calls |
| InventoryUI missing from test scene | In-game visual validation incomplete | Add InventoryUI to test_map.tscn or create minimal test scene |
| APK includes dev assets (`weapons_dev.json`, review images) | Bloated APK, potential IP issues | Fix export_presets.cfg exclude_filter |

---

## 📊 SUCCESS METRICS (End of This Week)

- [ ] **CONCEPT_APPROVAL.png** created and presented for user review
- [ ] **Zero Godot parse errors** (`godot --headless --check-only` passes)
- [ ] **All 27 Godot headless tests pass** (Stage B 11/11 + Stage C 16/16)
- [ ] **APK size audit complete** — dev assets excluded, only runtime assets included
- [ ] **InventoryUI scene** accessible for visual testing
- [ ] **Git commit** with updated PROJECT_STATE.md reflecting art pipeline restart

---

## 🎯 IMMEDIATE NEXT STEPS (Today — Priority Order)

1. **Create CONCEPT_APPROVAL.png** — Professional concept sheet for ONE original post-apocalyptic sidearm (side profile, 3/4 view, material palette, wear references, silhouette)
2. **Fix `called_shot_panel.gd` line 124** parse error
3. **Fix `quest_log.gd`** parse errors (QuestManager signals, static calls)
3. **Fix export_presets.cfg** to properly exclude `weapons_dev.json` and art review images
4. **Verify APK contents** with `aapt dump badging` or `apkanalyzer`
5. **Add InventoryUI to test scene** or create minimal visual validation scene
6. **Run Godot headless full test suite** — confirm 27/27 pass
7. **Git commit** all fixes

---

## 🎨 CONCEPT SHEET REQUIREMENTS (for CONCEPT_APPROVAL.png)

**File**: `artifacts/art_review/pistol/concept/CONCEPT_APPROVAL.png`

**Contents**:
- Side profile (orthographic)
- Three-quarter perspective view
- Material palette (swatches with roughness/metallic values)
- Surface wear references (edge wear, scratches, corrosion, grime)
- Major silhouette and proportions callouts
- Original design identity notes (not derivative of existing IP)

**Style Target**: Serious classic isometric RPG, realistic mechanical silhouettes, functional industrial design, mature cinematic post-apocalyptic atmosphere, used/weathered equipment

**Production Note**: If image-generation tools available, use for concept phase ONLY — not as fake proof of 3D asset. Document tool/provenance. If no suitable tool, report limitation and identify exact production dependency.

---

*Document Version: 3.0*  
*Date: 2026-10-22*  
*Author: Technical Director*  
*Status: Gameplay Systems ✅ COMPLETE — Art Pipeline 🔄 CONCEPT PHASE — Technical Stabilization 🔄 IN PROGRESS*