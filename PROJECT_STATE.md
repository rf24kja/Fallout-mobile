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
| Debug APK | ✅ | `builds/fallout2_reborn_debug.apk` (43.2MB, rebuilt 2026-10-23) |
| Release APK | ⏳ | Not built yet |
| Package ID | ✅ | `asia.go24.wastelandprototype` (Godot: `com.example.wastelandrpgprototype`) |
| App Label | ✅ | "Wasteland RPG Prototype" |
| Keystore (Debug) | ✅ | `keystore/debug.keystore` |
| Keystore (Release) | ✅ | `keystore/release_jks.keystore` (JKS, alias=release) |

---

## Test Results (2026-10-22)

| Suite | Tests | Pass | Fail | Timeout |
|-------|-------|------|------|---------|
| Stage B | 11 | 11 | 0 | 0 |
| Stage C | 16 | 16 | 0 | 0 |
| Item System | 88 items | 88 | 0 | 0 |
| Combat DT/DR | 17 cases | 17 | 0 | 0 |
| **Total** | **44+** | **44+** | **0** | **0** |

**Latest APK**: `builds/fallout2_reborn_debug.apk` (92.8 MB, rebuilt 2026-10-22)

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

## Completed This Session (Stage D Week 1-3)

### Gameplay Systems — FULLY FUNCTIONAL ✅

#### Data Foundation (WS-2) ✅
- ✅ `WeaponDefinition.gd`, `ArmorDefinition.gd`, `AmmoDefinition.gd` extending `ItemDefinition`
- ✅ `data/weapons.json` with 24 weapons (7 classes: MELEE, PISTOL, SMG, SHOTGUN, RIFLE, HEAVY, ENERGY)
- ✅ `data/ammo.json` with 23 ammo types (6 classes: STANDARD, JHP, AP, INCENDIARY, MICROFUSION, SMALL_ENERGY)
- ✅ `data/armor.json` with 18 armor pieces (12 body, 6 head) — **per-damage-type DT/DR**
- ✅ `data/healing.json` with 6 items
- ✅ `data/chems.json` with 6 items (5 chems + candy)
- ✅ `data/utility.json` with 9 items (crafting materials, tools, survival)
- ✅ Refactored `ItemDatabase.gd` to load from all 6 JSON files
- ✅ All 87 items validated and loaded — **zero warnings, all compatibilities OK**

#### Equipment System (WS-2) ✅
- ✅ Added `equipment_slots` to `Inventory.gd` (weapon_primary, weapon_secondary, body, head, eyes, hands, feet, accessory×2)
- ✅ Equipment applies stats: weapon → combat, armor → DT/DR, weight recalc
- ✅ `equip_item(slot, item_instance)`, `unequip_item(slot)` work
- ✅ `get_equipped_bonuses()` calculates total stat bonuses from equipped items
- ✅ Save/load supports equipment

#### Combat DT/DR & Ammo (WS-2) ✅
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

#### Combat Integration (WS-3) ✅
- ✅ **CoverSystem.gd**: Line-of-fire checks using PhysicsRayQueryParameters2D, 5 cover levels (NONE/LIGHT/MEDIUM/HEAVY/BLOCKED)
- ✅ Cover accuracy penalties: NONE(0), LIGHT(-15), MEDIUM(-30), HEAVY(-50), BLOCKED(-100)
- ✅ Cover objects with meta tags (crate, wall_low, window, doorway, fence, etc.)
- ✅ **CombatUI integration**: CalledShotButton, CoverIndicator panel, TargetPanel with cover display
- ✅ **CalledShotPanel**: 8 body part buttons with hit chance, AP cost, effect descriptions
- ✅ **CombatEffects.gd**: Muzzle flash, projectile trails, impact sparks/blood, critical hits, miss indicators, damage numbers, death animations (normal/explosion/disintegrate/gib), hit reactions, screen shake, camera zoom
- ✅ CombatSystem callbacks: on_attack_result() and on_death() trigger visual effects
- ✅ **CombatUI script attachment fixed**: Removed return type hints from `_get_equipped_weapon()` that prevented script binding in Godot 4.7.2

#### Quest System ✅ (Week 2-3)
- ✅ **QuestManager.gd**: 3 branching quests (Find Vault, Merchant Woes, Lost Caravan) with 3 paths each
- ✅ Quest states: AVAILABLE, ACTIVE, COMPLETED, FAILED
- ✅ QuestLog UI: Track active/available/completed quests, show objectives
- ✅ EventBus integration for auto-updates on quest progress
- ✅ Registered as autoload

#### Mobile Combat UX ✅ (Week 2-3)
- ✅ **CombatHUD.gd**: Touch-friendly controls with AP/HP bars, hit chance display (color-coded)
- ✅ Action buttons: Attack, Called Shot, Reload, Defend, Item
- ✅ Weapon info panel: Name, damage, AP cost, ammo count
- ✅ Turn indicator with participant portraits
- ✅ Registered as autoload

#### Character Visual System ✅ (Week 2-3)
- ✅ **CharacterVisual.gd**: Paperdoll layered system (base, armor, helmet, weapon) with Z-index layering
- ✅ **Player Integration**: Equipment changes sync to visual via Inventory.get_all_equipped()

#### CI & Testing ✅
- ✅ Stage D test suite: equipment, DT/DR, ammo, called shots (`test_combat_damage.py`, `test_item_database.py`)
- ✅ All 17 combat damage tests pass
- ✅ All 87 item database tests pass
- ✅ **ALL 27 GODOT HEADLESS TESTS PASS** (Stage B 11/11 + Stage C 16/16)
- ✅ Android Debug APK built and verified (92.8MB, minSdk 24, target 36, debuggable=true, rebuilt 2026-10-22)
- ✅ Art Approval Sheet generated: `artifacts/art_review/pistol/ART_APPROVAL_SHEET.png`

---

### Technical Placeholder Assets — RETAINED FOR GAMEPLAY DEVELOPMENT 🔄

**CLASSIFICATION: TECHNICAL_PLACEHOLDER** — All visual assets below are functional pipeline outputs, not approved production artwork. They serve as technical placeholders for gameplay development only.

| Asset Category | Status | Notes |
|----------------|--------|-------|
| Base Characters (3) | 🔄 TECHNICAL_PLACEHOLDER | survivor, npc_friendly, hostile — 795 frames each. Pipeline works, visual quality NOT verified for production. |
| Armor Tier Sprites (4 tiers) | 🔄 TECHNICAL_PLACEHOLDER | 192 frames total. Blender pipeline functional, materials/geometry are primitive placeholders. |
| Weapon Sprites (24 × 8) | 🔄 TECHNICAL_PLACEHOLDER | 192 frames. Low-poly primitive geometry, flat materials. NOT cinematic quality. |
| Environment Tiles (102) | 🔄 TECHNICAL_PLACEHOLDER | Ground, Wall, Container, Debris, Road. Functional TileSets, primitive geometry/materials. |
| CharacterVisual Paperdoll | ✅ Functional | Layering system works correctly with placeholder assets. |
| REV2 Pistol (Rejected) | ❌ REJECTED | `production_pistol_rev2` assets moved to `artifacts/art_review/pistol/revision2/` — excluded from production APK |

**Art Direction Target**: Serious, cinematic, semi-realistic post-apocalyptic — realistic proportions, believable mechanical construction, detailed shapes/silhouettes, worn materials, physically plausible materials, consistent cinematic lighting. Avoid toy-like geometry, primitive shapes, cartoon proportions, flat placeholder materials.

**Production Art Pipeline Status**: RESTARTED — Concept phase in progress. Do not use placeholder pipeline for production assets.

### Art Production Pipeline — RESTARTED WITH PROPER CONCEPT PHASE 🎨

| Step | Action | Status |
|------|--------|--------|
| 1 | **Art Direction & Reference Board** | ✅ DONE — VISUAL_DIRECTION.md created |
| 2 | **REV2 PRODUCTION ATTEMPT** (primitive-based procedural modeling) | ❌ **REJECTED** — Box-like proportions, flat materials, insufficient weathering, weak gameplay visibility |
| 3 | **Professional Concept Art Phase** (NEW) | 🔄 **CONCEPT_CANDIDATE — PENDING USER APPROVAL** |
| 4 | **In-Game Validation** of approved concept | ⏳ BLOCKED |
| 5 | **User Approval Gate** (Concept) | ⏳ PENDING — **DO NOT MODEL** |
| 6 | **Production Modeling** from approved concept | ⏳ BLOCKED |
| 7 | **Scale to Full Catalog** (only after production model approved) | ⏳ BLOCKED |

**REV2 REJECTION REASONS:**
- Primitive box-like geometry, mechanically unconvincing proportions
- Flat-looking materials without believable wear/weathering
- Mechanical details appear disconnected
- Weak detail visibility despite large Blender renders
- Almost invisible weapon in actual gameplay screenshots
- Game scene still looks like a debug grid

**NEW CONCEPT REQUIREMENTS:**
- Original post-apocalyptic sidearm design (not Fallout IP)
- Serious classic isometric RPG presentation
- Realistic mechanical silhouettes, functional industrial design
- Mature cinematic post-apocalyptic atmosphere
- Used, weathered equipment aesthetic
- Professional concept sheet: side profile, 3/4 perspective, material palette, surface wear references, major silhouette/proportions, original design identity
- Must be detailed enough to guide actual hard-surface modeling with UV unwrapping, textures, bevels, weighted normals, realistic materials

**Quality Gates (MANDATORY - no stage may be inferred from earlier):**
- TECHNICAL_PIPELINE_READY ✅
- CONCEPT_APPROVED ⏳
- MODEL_REVIEWED ⏳
- GAMEPLAY_SPRITES_VALIDATED ⏳
- IN_GAME_VISUALS_VALIDATED ⏳
- MOBILE_DEVICE_VALIDATED ⏳
- PRODUCTION_ASSET_APPROVED ⏳

---

## Next Actions

See `docs/NEXT_ACTIONS.md` for full execution queue.

---

*Last Updated: 2026-10-22 (Corrected: 2026-10-22 — Visual assets reclassified as TECHNICAL_PLACEHOLDER)*