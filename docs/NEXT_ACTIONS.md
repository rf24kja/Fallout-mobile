# Next Actions — Immediate Execution Queue

## Purpose

Concrete, ordered task list for **this week**. Each action is assignable, testable, and blocked only by the previous.

---

## 🎯 THIS WEEK (Week 1 of Stage D)

### Day 1-2: Data Foundation (WS-2)
| # | Action | Owner | Command/Verification |
|---|--------|-------|----------------------|
| 1 | Create `WeaponDefinition.gd`, `ArmorDefinition.gd`, `AmmoDefinition.gd` extending `ItemDefinition` | Sys Eng | `godot --headless -s res://scripts/systems/weapon_definition.gd` — no errors |
| 2 | Write `data/weapons.json` with 24 weapons from ITEM_BALANCE_MATRIX | Sys Des | JSON validates, loads in `ItemDatabase._load_default_items()` |
| 3 | Write `data/ammo.json` with 21 ammo types | Sys Des | Same |
| 4 | Write `data/armor.json` with 18 armor pieces | Sys Des | Same |
| 5 | Write `data/healing.json`, `data/chems.json`, `data/utility.json` | Sys Des | Same |
| 6 | Refactor `ItemDatabase.gd` to load from JSON files (not hardcoded) | Sys Eng | All items registered, `get_item()` works for all |

### Day 2-3: Equipment System (WS-2)
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 7 | Add `equipment_slots` to `Inventory.gd` (weapon, body, head, eyes, hands, feet, accessory×2) | Sys Eng | `equip_item(slot, item_instance)`, `unequip_item(slot)` work |
| 8 | Equipment applies stats: weapon → combat, armor → DT/DR, weight recalc | Sys Eng | Character sheet shows equipped bonuses |
| 9 | Paperdoll integration: `CharacterVisual` node updates sprite layers on equip | Art/Eng | Visual changes in-game |

### Day 3-4: Combat DT/DR & Ammo (WS-2)
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 10 | Implement `calculate_damage(raw, ammo_type, target_armor)` in `CombatSystem.gd` | Sys Eng | Unit test: JHP vs DT=10 → 1.5×dmg × 1.5 DT effectiveness |
| 11 | Add `ammo_type` field to weapon data, `caliber` to ammo data | Sys Eng | Weapon only accepts matching caliber |
| 12 | Implement called shot logic: 6 body parts, AP cost, accuracy mod, effects | Sys Eng | `_perform_called_shot(attacker, target, body_part)` works |

### Day 4-5: Art Pipeline Foundation (WS-1)
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 13 | Blender isometric camera rig (35.264° elev, 45° azim) + render layer setup | Art Tech | Renders produce 5 passes |
| 14 | Python atlas builder script: packs PNGs → 2048×2048 + `.tres` metadata | Art Tech | `atlas_builder.py --input tiles/ --output atlases/` works |
| 15 | Ground tile set: 8 variants × 4 states = 32 tiles, rendered, atlased | Env Artist | In Godot TileMap, seamless, palette swap works |
| 16 | Wall tile set: 8 variants × 3 damage states = 24 tiles | Env Artist | Same |

### Day 5: CI & Testing
| # | Action | Owner | Verification |
|---|--------|-------|--------------|
| 17 | Add Stage D test suite: equipment, DT/DR, ammo, called shots | QA | `godot --headless --test StageDTestRunner` — all pass |
| 18 | Git commit: "Stage D Week 1: Data, Equipment, Combat Core, Art Pipeline" | All | Clean build, tests pass |

---

## 📋 WEEK 2 PREVIEW (Prepare Now)

| # | Action | Dependency |
|---|--------|------------|
| 19 | Combat FX: bullet impact, energy splash, blood decals | Task 12 |
| 20 | Called shot radial UI (8-slice) | Task 12 |
| 21 | Cover system: % hit mod, visual indicator | Task 10 |
| 22 | Character base sprites: 8-dir walk/idle/aim/shoot/melee/hit/death | Task 13 |
| 23 | Armor tier sprites on paperdoll (4 tiers) | Task 8, 22 |
| 24 | Weapon sprites: 24 weapons × 8 rotations | Task 2, 22 |
| 25 | Quest data format + `QuestManager.gd` | Task 6 |

---

## 🔧 TECHNICAL DEBT TO ADDRESS THIS WEEK

| Debt | Fix |
|------|-----|
| `ItemDatabase` hardcoded items | → JSON-driven (Task 6) |
| `Inventory` no equipment slots | → Add slots + equip logic (Task 7) |
| `CombatSystem` DR only, no DT | → Implement DT/DR formula (Task 10) |
| No ammo system | → AmmoDefinition + consumption (Task 11) |
| SPECIAL names are Fallout IP | → Rename in `CharacterSystem.gd` (Task 7 Week 2) |
| 1x1 PNG placeholder icons | → Replace with rendered sprites (Week 2) |

---

## 📦 BLOCKERS (Escalate Immediately)

| Blocker | Impact | Resolution |
|---------|--------|------------|
| Blender render pipeline not automated | Art pipeline stalls | Art Tech prioritize Task 13-14 |
| Godot 4.7.2 TileMap performance unknown | May need custom rendering | Tech Lead profile Week 1 |
| JSON parsing in Godot headless for CI | Tests need data loading | Use `ResourceLoader.load_threaded_get()` |

---

## 📊 SUCCESS METRICS (End of Week 1)

- [ ] All 78 data items (24W+21A+18Ar+6H+6C+9U) loaded from JSON
- [ ] Equipment system: equip/unequip, stat application, weight
- [ ] DT/DR damage calculation unit tested with 10+ cases
- [ ] Called shots: 6 body parts functional
- [ ] Blender → Godot asset pipeline: 1 tile rendered → in-engine
- [ ] All existing 28 tests still pass
- [ ] New Stage D tests: 10+ passing

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Author: Technical Director*  
*Status: ACTIVE — Execute Top to Bottom*