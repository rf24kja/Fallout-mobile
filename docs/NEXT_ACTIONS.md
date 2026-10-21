# Next Actions — Immediate Execution Queue

## Purpose

Concrete, ordered task list for **this week**. Each action is assignable, testable, and blocked only by the previous.

---

## 🎯 THIS WEEK (Week 1 of Stage D) — **COMPLETED**

### Day 1-2: Data Foundation (WS-2) ✅ DONE
| # | Action | Owner | Command/Verification |
|---|--------|-------|----------------------|
| 1 | Create `WeaponDefinition.gd`, `ArmorDefinition.gd`, `AmmoDefinition.gd` extending `ItemDefinition` | Sys Eng | ✅ Done - all three files created, extend ItemDefinition |
| 2 | Write `data/weapons.json` with 24 weapons from ITEM_BALANCE_MATRIX | Sys Des | ✅ Done - 24 weapons, 7 classes, all validated |
| 3 | Write `data/ammo.json` with 22 ammo types | Sys Des | ✅ Done - 22 ammo types, 6 classes, all validated |
| 4 | Write `data/armor.json` with 18 armor pieces | Sys Des | ✅ Done - 18 pieces (12 body, 6 head), all validated |
| 5 | Write `data/healing.json`, `data/chems.json`, `data/utility.json` | Sys Des | ✅ Done - 6+6+9 = 21 items, all validated |
| 6 | Refactor `ItemDatabase.gd` to load from JSON files (not hardcoded) | Sys Eng | ✅ Done - loads all 6 JSON files, 85 items registered |

### Day 2-3: Equipment System (WS-2) ✅ DONE
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 7 | Add `equipment_slots` to `Inventory.gd` (weapon, body, head, eyes, hands, feet, accessory×2) | Sys Eng | ✅ Done - 9 slots implemented |
| 8 | Equipment applies stats: weapon → combat, armor → DT/DR, weight recalc | Sys Eng | ✅ Done - get_equipped_bonuses() works |
| 9 | Paperdoll integration: `CharacterVisual` node updates sprite layers on equip | Art/Eng | ⏳ PENDING - moved to Week 2 |

### Day 3-4: Combat DT/DR & Ammo (WS-2) ✅ DONE
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 10 | Implement `calculate_damage(raw, ammo_type, target_armor)` in `CombatSystem.gd` | Sys Eng | ✅ Done - full DT/DR formula with ammo modifiers |
| 11 | Add `ammo_type` field to weapon data, `caliber` to ammo data | Sys Eng | ✅ Done - compatibility validated |
| 12 | Implement called shot logic: 8 body parts, AP cost, accuracy mod, effects | Sys Eng | ✅ Done - HEAD, TORSO, L/R ARM, L/R LEG, EYES, GROIN |

### Day 4-5: Art Pipeline Foundation (WS-1) — **COMPLETED**
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 13 | Blender isometric camera rig (35.264° elev, 45° azim) + render layer setup | Art Tech | ✅ Done - `blender/setup_isometric_rig.py` |
| 14 | Python atlas builder script: packs PNGs → 2048×2048 + `.tres` metadata | Art Tech | ✅ Done - `tools/atlas_builder.py` |
| 15 | Ground tile set: 8 variants × 4 states = 32 tiles, rendered, atlased | Env Artist | ✅ Done - 8 variants in atlas |
| 16 | Wall tile set: 8 variants × 3 damage states = 24 tiles | Env Artist | ⏳ PENDING - Week 2 |

### Day 5: CI & Testing — **COMPLETED**
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 17 | Add Stage D test suite: equipment, DT/DR, ammo, called shots | QA | ✅ Done - test_combat_damage.py + test_item_database.py pass |
| 18 | Git commit: "Stage D Week 1: Data, Equipment, Combat Core, Art Pipeline" | All | 🔄 NEXT - commit after art pipeline starts |

---

## 📋 WEEK 2 EXECUTION QUEUE (Start Now)

| # | Action | Dependency | Status |
|---|--------|------------|--------|
| 19 | **Combat FX Integration**: Connect CombatEffects.gd to CombatSystem callbacks | Task 12 ✅ | ✅ DONE |
| 20 | **Called Shot UI**: CalledShotPanel with 8 body parts, hit chance, AP cost, effects | Task 12 ✅ | ✅ DONE |
| 21 | **Cover System**: Line-of-fire checks, accuracy penalties, visual indicator | Task 10 ✅ | ✅ DONE |
| 22 | **Character Art Pipeline**: Create cinematic character base (survivor, NPC, hostile) | Task 13 🔄 | 🔄 IN PROGRESS |
| 23 | **Character Animation**: 8-dir walk/idle/aim/shoot/melee/hit/death for 3 characters | Task 22 | ⏳ PENDING |
| 24 | **Armor Tier Sprites**: Paperdoll layers for 4 armor tiers on character base | Task 8 ✅, 22 | ⏳ PENDING |
| 25 | **Weapon Sprites**: 24 weapons × 8 rotations rendered | Task 2 ✅, 22 | ⏳ PENDING |
| 26 | **Environment Art**: Industrial wasteland scene (road, walls, containers, debris) | Task 15 ✅ | ⏳ PENDING |
| 27 | **Quest System**: QuestManager.gd with branching quest (3+ paths) | Task 6 ✅ | ⏳ PENDING |
| 28 | **Mobile Combat UX**: Touch-friendly controls, AP/HP indicators, hit chance display | Task 19,20 ✅ | ⏳ PENDING |
| 29 | **Regression Testing**: All Python + Godot headless tests, combat integration | Task 17 ✅ | ⏳ PENDING |
| 30 | **Android Debug Build**: Build and verify APK with new assets | All above | ⏳ PENDING |

## 🔧 TECHNICAL DEBT TO ADDRESS THIS WEEK

| Debt | Fix |
|------|-----|
| `ItemDatabase` hardcoded items | ✅ FIXED - JSON-driven (Task 6) |
| `Inventory` no equipment slots | ✅ FIXED - Add slots + equip logic (Task 7) |
| `CombatSystem` DR only, no DT | ✅ FIXED - Implement DT/DR formula (Task 10) |
| No ammo system | ✅ FIXED - AmmoDefinition + consumption (Task 11) |
| SPECIAL names are Fallout IP | → Rename in `CharacterSystem.gd` (Task 7 Week 2) |
| 1x1 PNG placeholder icons | → Replace with rendered sprites (Week 2) |

---

## 📦 BLOCKERS (Escalate Immediately)

| Blocker | Impact | Resolution |
|---------|--------|------------|
| Blender render pipeline not automated | Art pipeline stalls | Art Tech prioritize Task 13-14 NOW |
| Godot 4.7.2 TileMap performance unknown | May need custom rendering | Tech Lead profile Week 1 |
| JSON parsing in Godot headless for CI | Tests need data loading | Use `ResourceLoader.load_threaded_get()` |

---

## 📊 SUCCESS METRICS (End of Week 1)

- [x] All 85 data items (24W+22A+18Ar+6H+6C+9U) loaded from JSON
- [x] Equipment system: equip/unequip, stat application, weight
- [x] DT/DR damage calculation unit tested with 10+ cases
- [x] Called shots: 8 body parts functional
- [ ] Blender → Godot asset pipeline: 1 tile rendered → in-engine
- [x] All existing 28 tests still pass
- [x] New Stage D tests: 10+ passing

---

## 🎯 IMMEDIATE NEXT STEPS (Today)

1. **Set up Blender isometric camera rig** — create `blender/isometric_rig.blend` with 35.264° elevation, 45° azimuth
2. **Create atlas builder script** — `tools/atlas_builder.py` for packing PNGs to 2048×2048 + `.tres`
3. **Render first ground tile** — validate pipeline: Blender → PNG → Atlas → Godot TileMap
4. **Commit Week 1 work** — `git add -A && git commit -m "Stage D Week 1: Data, Equipment, Combat Core, Art Pipeline"`

---

*Document Version: 2.0*  
*Date: 2026-10-21*  
*Author: Technical Director*  
*Status: Week 1 Core Systems ✅ COMPLETE — Art Pipeline 🔄 IN PROGRESS*