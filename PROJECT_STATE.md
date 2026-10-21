# Fallout 2 Reborn Mobile — Project State (Mobile Project)

## Project Objective (CORRECTED 2026-10-21)

**Build an ORIGINAL mobile-first post-apocalyptic RPG with its own IP, art, world, branding, and presentation — but with mechanics, systemic depth, combat logic, balancing discipline, and quest-design quality benchmarked against Fallout 2.**

See root `C:\Code\REA_FALLOUT\PROJECT_STATE.md` for complete project state including REA tooling.

---

## Mobile Project Status

| Component | Status | Details |
|-----------|--------|---------|
| Godot Version | ✅ | 4.7.2.stable |
| Export Templates | ✅ | 4.7.2.stable at `%APPDATA%\Godot\export_templates\4.7.2.stable\` |
| Android SDK | ✅ | Platform 36, Build-Tools 36.0.0, NDK 25.1 |
| Debug APK | ✅ | `builds/android/Wasteland_RPG_Prototype_Debug.apk` |
| Release APK | ✅ | `builds/android/Wasteland_RPG_Prototype_Release.apk` |
| Package ID | ✅ | `asia.go24.wastelandprototype` (Godot: `com.example.wastelandrpgprototype`) |
| App Label | ✅ | "Wasteland RPG Prototype" |
| Keystore (Debug) | ✅ | `keystore/debug.keystore` |
| Keystore (Release) | ✅ | `keystore/release_jks.keystore` (JKS, alias=release) |

---

## Test Results (2026-10-21)

| Suite | Tests | Pass | Fail |
|-------|-------|------|------|
| Stage B | 12 | 12 | 0 |
| Stage C | 16 | 16 | 0 |
| Item System | 86 items | 86 | 0 |
| Combat DT/DR | 17 cases | 17 | 0 |
| **Total** | **45+** | **45+** | **0** |

---

## Design Documents (in `docs/`)

- GAME_VISION.md
- SYSTEM_FIDELITY.md
- SYSTEM_AUDIT.md
- ITEM_BALANCE_MATRIX.md
- QUEST_DESIGN_PRINCIPLES.md
- VISUAL_DIRECTION.md
- STAGE_D_EXECUTION.md
- NEXT_ACTIONS.md
- BRANDING_AND_IP.md
- DEVICE_TEST_CHECKLIST.md
- PERFORMANCE_BASELINE.md
- STAGE_D_PROPOSAL.md

---

## Completed This Session (Stage D Week 1)

### Data Foundation (WS-2) ✅
- ✅ `WeaponDefinition.gd`, `ArmorDefinition.gd`, `AmmoDefinition.gd` extending `ItemDefinition`
- ✅ `data/weapons.json` with 24 weapons (7 classes: MELEE, PISTOL, SMG, SHOTGUN, RIFLE, HEAVY, ENERGY)
- ✅ `data/ammo.json` with 23 ammo types (6 classes: STANDARD, JHP, AP, INCENDIARY, MICROFUSION, SMALL_ENERGY)
- ✅ `data/armor.json` with 18 armor pieces (12 body, 6 head) — **per-damage-type DT/DR**
- ✅ `data/healing.json` with 6 items
- ✅ `data/chems.json` with 6 items (5 chems + candy)
- ✅ `data/utility.json` with 9 items (crafting materials, tools, survival)
- ✅ Refactored `ItemDatabase.gd` to load from all 6 JSON files
- ✅ All 86 items validated and loaded — **zero warnings, all compatibilities OK**

### Equipment System (WS-2) ✅
- ✅ Added `equipment_slots` to `Inventory.gd` (weapon_primary, weapon_secondary, body, head, eyes, hands, feet, accessory×2)
- ✅ Equipment applies stats: weapon → combat, armor → DT/DR, weight recalc
- ✅ `equip_item(slot, item_instance)`, `unequip_item(slot)` work
- ✅ `get_equipped_bonuses()` calculates total stat bonuses from equipped items
- ✅ Save/load supports equipment

### Combat DT/DR & Ammo (WS-2) ✅
- ✅ Implemented `calculate_damage(raw, ammo_type, target_armor)` in `CombatSystem.gd` with full DT/DR formula
- ✅ Added `ammo_type` field to weapon data, `caliber` to ammo data
- ✅ Ammo modifiers: damage_modifier, dt_modifier, dr_modifier, damage_type_override
- ✅ JHP: 1.5× damage, 1.5× DT effectiveness (good vs light armor)
- ✅ AP: 0.7-0.9× damage, 0.4-0.5× DT (penetrates heavy armor)
- ✅ **FIXED**: Energy ammo dt_modifier=1.0 (respects armor DT, not bypass)
- ✅ **FIXED**: Dragon's Breath ammo has damage_type_override=FIRE (type 2)
- ✅ **FIXED**: Armor uses per-damage-type DT/DR dicts matching DamageType enum (0-6)
- ✅ Implemented called shot logic: 8 body parts with AP cost, accuracy mod, damage multiplier, effects
- ✅ Body part effects: stun, concussion, disarm, cripple_arm, knockdown, cripple_leg, blind, cripple_eyes, cripple_groin
- ✅ Unit tests passing for 17 DT/DR/ammo cases (all passing)

### Combat Integration (WS-3) ✅
- ✅ **CoverSystem.gd**: Line-of-fire checks using PhysicsRayQueryParameters2D, 5 cover levels (NONE/LIGHT/MEDIUM/HEAVY/BLOCKED)
- ✅ Cover accuracy penalties: NONE(0), LIGHT(-15), MEDIUM(-30), HEAVY(-50), BLOCKED(-100)
- ✅ Cover objects with meta tags (crate, wall_low, window, doorway, fence, etc.)
- ✅ **CombatUI integration**: CalledShotButton, CoverIndicator panel, TargetPanel with cover display
- ✅ **CalledShotPanel**: 8 body part buttons with hit chance, AP cost, effect descriptions
- ✅ **CombatEffects.gd**: Muzzle flash, projectile trails, impact sparks/blood, critical hits, miss indicators, damage numbers, death animations (normal/explosion/disintegrate/gib), hit reactions, screen shake, camera zoom
- ✅ CombatSystem callbacks: on_attack_result() and on_death() trigger visual effects

### Art Pipeline Foundation (WS-1) ✅
- ✅ Blender isometric camera rig (35.264° elev, 45° azim) + render layer setup (`blender/setup_isometric_rig.py`)
- ✅ Python atlas builder script: packs PNGs → 2048×2048 + `.tres` metadata (`tools/atlas_builder.py`)
- ✅ Ground tile set: 8 variants rendered, packed into atlas_000.png with texture_atlas.tres
- ✅ Test tiles generated: 8 variants (clean, grid, cracked, rubble, blood, dark, ash, sand)

### CI & Testing ✅
- ✅ Stage D test suite: equipment, DT/DR, ammo, called shots (`test_combat_damage.py`, `test_item_database.py`)
- ✅ All 17 combat damage tests pass
- ✅ All 86 item database tests pass
- ✅ Git commit: "Stage D Week 1: Data, Equipment, Combat Core, Art Pipeline"

---

## Next Actions

See `docs/NEXT_ACTIONS.md` for Day-by-Day Week 1 execution queue.

---

*Last Updated: 2026-10-21*