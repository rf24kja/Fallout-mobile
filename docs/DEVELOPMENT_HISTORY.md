# Development History — Fallout 2 Reborn Mobile

## Project Milestones

### 2026-10-21: Project Reorientation & IP Compliance
- **Decision**: Pivot from "original IP inspired by Fallout 2" to "Fallout 2 Reborn Mobile" — faithful mobile adaptation of original Fallout 2
- **SPECIAL Rename**: All 7 SPECIAL attributes renamed to avoid IP issues (Strength→Might, Perception→Awareness, Endurance→Vigor, Charisma→Presence, Intelligence→Intellect, Agility→Dexterity, Luck→Fortune)
- **Files Updated**: 11 files across character_system, combat_system, game_manager, inventory, item_definition, dialogue_manager, combat_hud, tests
- **Verification**: All 27 Godot headless tests PASS

### 2026-10-23: Save Migration System
- **Feature**: Save schema versioning (v1→v2) with SPECIAL attribute migration
- **Implementation**: `_migrate_save_data()`, `_migrate_v1_to_v2()` in game_manager.gd
- **Properties**: Idempotent, deterministic precedence, preserves all non-SPECIAL data
- **Tests Added**: 4 migration tests in Stage C suite — ALL PASS

### 2026-10-26: Data Foundation Complete (WS-2)
- **Weapon Data**: 24 weapons across 7 classes (MELEE, PISTOL, SMG, SHOTGUN, RIFLE, HEAVY, ENERGY)
- **Ammo Data**: 23 ammo types across 6 classes (STANDARD, JHP, AP, INCENDIARY, MICROFUSION, SMALL_ENERGY)
- **Armor Data**: 18 pieces (12 body, 6 head) with per-damage-type DT/DR
- **Healing/Chems/Utility**: 6+6+9 items
- **ItemDatabase**: Loads all 6 JSON files, 87 items validated, zero warnings

### 2026-10-28: Combat DT/DR & Ammo System (WS-2)
- **Damage Formula**: Full Fallout 2 DT/DR implementation with ammo modifiers
- **Ammo Modifiers Verified**: JHP (1.5× dmg, 1.5× DT), AP (0.75× dmg, 0.4× DT), Standard (1.0×)
- **Called Shots**: 8 body parts with effects (stun, disarm, cripple, knockdown, blind)
- **Damage Types**: 7 types with per-type DT/DR (NORMAL, LASER, FIRE, PLASMA, ELECTRICAL, EMP, EXPLOSIVE)
- **Tests**: 17 combat damage cases — ALL PASS

### 2026-10-30: Combat Integration & Mobile UX (WS-3)
- **Cover System**: 5 cover levels (NONE/LIGHT/MEDIUM/HEAVY/BLOCKED) with accuracy penalties
- **Combat UI**: CalledShotPanel, CoverIndicator, TargetPanel, CombatHUD with touch-friendly controls
- **Combat Effects**: Muzzle flash, projectiles, impacts, critical hits, death animations, screen shake
- **Character Visual**: Paperdoll layered system (base, armor, helmet, weapon) with Z-index
- **CombatHUD Fix**: Removed return type hints preventing script binding in Godot 4.7.2

### 2026-11-01: Quest System & Android Runtime (WS-3)
- **Quest Manager**: 3 branching quests (Find Vault, Merchant Woes, Lost Caravan) with 3 paths each
- **Quest States**: AVAILABLE, ACTIVE, COMPLETED, FAILED with EventBus integration
- **Stage E.8 Android**: x86_64 export template built from Godot 4.7.2 source (73MB libgodot_android.so)
- **APK**: stage_e8_final_opt.apk (41.2MB) — installs and runs on emulator
- **Rendering**: Host GPU (-gpu host) resolves GLES3 uniform limit (Intel Arc translation)
- **Device Tests**: 32/32 PASS on Android emulator, touch interactions verified

### 2026-11-09: GitHub Integration & Project Recovery
- **Repository**: https://github.com/rf24kja/Fallout-mobile connected as origin
- **Initial Publication**: Commit 16a893b — baseline project with .gitignore, docs, source code
- **Documentation Suite**: README.md, AGENTS.md, PROJECT_MANDATE.md, RECOVERY_GUIDE.md, PROJECT_STATE.md, NEXT_ACTIONS.md
- **Git LFS Migration**: Large binaries (.so, .apk) moved to LFS — force push ea7cb64
- **Recovery Validation**: Fresh clone → Godot 4.7.2 opens without parse errors
- **Release Build**: Manual apksigner workaround — Fallout2_Reborn_Mobile_Release_signed.apk (124MB) verified

### 2026-11-09: XP Progression Fidelity Fix
- **Bug Found**: `xp_for_level()` used linear formula `level * 1000` instead of Fallout 2 cumulative quadratic
- **Fix**: Changed to `1000 * level * (level - 1) / 2` matching original Fallout 2
- **Verification**: Comprehensive test suite `test_xp_progression.gd` — ALL PASS
  - Levels 1-25 exact XP thresholds verified
  - Boundary values (exact threshold, just below) verified
  - Edge cases (negative XP, zero XP) verified
  - Simulated level-up sequence 1→10 verified
  - Save/load compatibility verified
- **Evidence**: REA analysis confirms Fallout 2 uses cumulative XP curve

---

## Key Technical Decisions

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-10-21 | SPECIAL rename for original IP | Avoid Bethesda IP claims; mechanical equivalence preserved |
| 2026-10-23 | Save versioning with migration | Enable schema evolution without breaking player saves |
| 2026-10-28 | Per-damage-type DT/DR | Match Fallout 2's granular armor system (7 damage types) |
| 2026-10-30 | Cover system as enhancement | Fallout 2 had no cover; mobile UX benefits from tactical positioning |
| 2026-11-01 | Host GPU for Android emulator | Resolves GLES3 GL_MAX_FRAGMENT_UNIFORM_VECTORS=261 limit |
| 2026-11-09 | Git LFS for large binaries | Keep repo cloneable (<100MB), preserve build artifacts in history |
| 2026-11-09 | Manual apksigner for release | Godot 4.7.2 export preset keystore loading bug workaround |

---

## Test History

| Date | Suite | Tests | Pass | Fail | Notes |
|------|-------|-------|------|------|-------|
| 2026-10-26 | Stage B | 11 | 11 | 0 | Core systems |
| 2026-10-26 | Stage C | 16 | 16 | 0 | Combat, items, character |
| 2026-10-26 | Save Migration | 4 | 4 | 0 | v1→v2 migration |
| 2026-10-26 | Combat Damage | 17 | 17 | 0 | DT/DR, ammo, called shots |
| 2026-10-30 | Stage B+C | 32 | 32 | 0 | Full vertical slice |
| 2026-11-01 | Android Device | 32 | 32 | 0 | Emulator runtime |
| 2026-11-09 | XP Progression | 41 | 41 | 0 | Levels 1-25, boundaries, level-ups, save/load |

---

## Known Issues & Blockers

### P0 - Critical
- **Release Keystore in Godot Export**: Godot 4.7.2 fails to load release keystore from export_presets.cfg despite valid JKS file. Workaround: manual `apksigner` after export.
- **Git LFS Force Push Required**: History rewrite needed for large files; collaborators must re-clone.

### P1 - High
- **Combat AP Costs Unverified**: Weapon AP costs need REA extraction from Fallout 2 protos
- **Critical Hit Tables Missing**: Fallout 2 critical tables by weapon/body part not extracted
- **World Map Travel Not Implemented**: Core Fallout 2 system missing

### P2 - Medium
- **NPC Schedules/AI Not Implemented**: Day/night, faction behavior, companions
- **Reputation/Faction System Not Implemented**: Town and global reputation
- **Animation System**: CharacterVisual uses placeholder sprites (795 frames each, pipeline works but not production quality)

---

## Repository State

| Metric | Value |
|--------|-------|
| Remote | https://github.com/rf24kja/Fallout-mobile |
| Default Branch | master |
| Latest Commit | 4be19cf (docs: update project documentation) |
| LFS Tracked | *.apk, *.so |
| Large Files | custom_template_fixed_decoded/libgodot_android.so (73MB), builds/*.apk (37-124MB) |
| Recovery Tested | ✅ Fresh clone opens in Godot 4.7.2 |

---

*Last Updated: 2026-11-09 — XP progression fidelity verified, documentation published to GitHub*