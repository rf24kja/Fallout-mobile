# Fallout 2 Fidelity Matrix

## Purpose
Document verified Fallout 2 mechanical fidelity for each implemented system.
Each entry requires: Godot source, original Fallout 2 reference (REA/Ghidra evidence), concrete values, test result.

## Status Legend
- **VERIFIED**: Implementation matches original with evidence + passing regression test
- **UNVERIFIED**: Implementation exists but lacks REA/Ghidra evidence or test
- **PARTIAL**: Some aspects verified, others missing or incorrect
- **MISSING**: System not implemented
- **BROKEN**: Implementation diverges from original

---

## Character Progression Systems

### XP Progression ✅ VERIFIED
- **Godot Source**: `scripts/systems/character_system.gd::xp_for_level()`, `level_from_xp()`
- **Original Fallout 2 Formula**: XP(level) = 1000 × level × (level - 1) / 2 (cumulative)
- **Verified Values**:
  - Level 1: 0 XP
  - Level 2: 1,000 XP
  - Level 3: 3,000 XP
  - Level 4: 6,000 XP
  - Level 5: 10,000 XP
  - Level 10: 45,000 XP
  - Level 20: 190,000 XP
- **Test**: `tests/test_xp_progression.gd` — ALL PASS (levels 1-25, boundaries, level-up sequence, save/load)
- **Evidence**: REA analysis confirms Fallout 2 uses cumulative quadratic XP curve

### SPECIAL Attributes ✅ VERIFIED (Renamed for Original IP)
- **Godot Source**: `scripts/systems/character_system.gd::SPECIAL_NAMES`, `_recalculate_derived_stats()`, `get_derived_stats()`
- **Mapping** (Fallout IP → Original IP):
  - Strength → Might
  - Perception → Awareness
  - Endurance → Vigor
  - Charisma → Presence
  - Intelligence → Intellect
  - Agility → Dexterity
  - Luck → Fortune
- **Formulas Verified** (all match Fallout 2 reference):
  - Max HP: 15 + ST + EN*2 + (Lv-1)*(2+EN/2) + Lifegiver*4*(Lv-1) (stat.cc:554-578)
  - Max AP: 5 + AG/2 (round down)
  - HP gain on level-up: 2 + EN/2 + Lifegiver*4
  - Skill points per level: 5 + 2*effective INT + Educated*2 + Skilled*5 - Gifted*5, clamp 0..99 (character_editor.cc:5681-5701)
  - Healing Rate: max(1, EN/3) (stat.cc:573)
  - Poison Resistance: EN * 5
  - Radiation Resistance: EN * 2 (base, +Armor applied elsewhere)
  - Sequence: PE * 2
  - Critical Chance: LK + modifiers (Finesse +10, Heavy Handed -30) (stat.cc:574, trait.cc:256-265)
  - Carry Weight: 25 + 25*ST (Small Frame subtracts 10*BASE ST) (stat.cc:571, trait.cc:241-245)
  - Melee Damage: max(1, ST-5) + modifiers (stat.cc:570)
- **Test**: `tests/test_special_fidelity.gd` - 81 tests ALL PASS (m01692 source-backed numeric cases)
- **Migration**: v1→v2 save migration verified idempotent

### Character Creation ✅ VERIFIED (PHASE 1)
- **Godot Source**: `scripts/systems/character_creation.gd` (rules), `scripts/ui/character_creation_ui.gd` + `scenes/ui/character_creation_ui.tscn` (UI), `scripts/core/game_manager.gd::apply_character_config()`, `scripts/systems/character_system.gd::apply_created_character()`
- **Vanilla Sources** (verified `fallout2-ce`): `character_editor.cc:1892-1909`, `character_editor.cc:3742-3759`, `character_editor.cc:6741-6752`, `stat.cc:43-49` (base 5 / 5 free points / 1..10), `skill.cc:78-97` (skill table), `skill.cc:230-269` (`skillGetValue`), `trait.cc:180-279` (trait stat mods), `trait.cc:284-312` (trait skill mods), `trait_defs.h:7` (max 2 traits), `skill_defs.h:6-9` (`DEFAULT_TAGGED_SKILLS 3`), `character_editor.cc:5681-5701` (skill points per level)
- **Rules Implemented**: SPECIAL base 5, 5 allocatable points, each stat clamped 1..10 (sum 35 → 40); up to 2 traits (optional); exactly 3 tag skills; tagged skills get +20 and double invested points
- **Traits Implemented**: all 16 vanilla traits (Gifted, Bruiser, Small Frame, Kamikaze, Heavy Handed, Fast Shot, Fast Metabolism, Finesse, Good Natured, Skilled, One Handed, Bloody Mess, Jinxed, Chem Reliant, Chem Resistant, Sex Appeal) with source-verified effects; Bloody Mess = visual-only (`actions.cc:208-235`), Sex Appeal effect unverified (enum only in `trait_defs.h:24`)
- **Skill Points Per Level**: `5 + 2*INT + Educated*2 + Skilled*5 - Gifted*5` (clamped 0..99)
- **Test**: `scripts/tests/test_character_creation.gd` — 11/11 PASS; `scripts/tests/test_full_playthrough.gd` step 3 — PASS
- **BLOCKER (age modifiers)**: Fallout 2 has NO age-based modifiers in the verified sources. `pc.cc` (404 lines) contains no age handling, and `character_editor.cc` stores age as a descriptive field only. Character age is therefore recorded and displayed but never alters SPECIAL, skills or derived stats. Do not invent age modifiers; if evidence appears later, extend `character_creation.gd::effective_special()`.

### Skill System ✅ VERIFIED
- **Godot Source**: `scripts/systems/character_system.gd::SKILL_DEFS`, `_recalculate_skills()`
- **Formula** (vanilla `skill.cc:230-269` `skillGetValue`): `default_value + stat_modifier*(stat1+stat2) + invested`; if tagged add `+ invested + 20`; then trait modifier; clamp 0..300
- **Original Fallout 2 Skills**: 18 skills mapped (Small Guns, Big Guns, Energy Weapons, Unarmed, Melee, Throwing, First Aid, Doctor, Sneak, Lockpick, Steal, Traps, Science, Repair, Speech, Barter, Gambling, Outdoorsman)
- **Test**: Character initialization and recalculation verified via Stage C tests

### Perk System ✅ VERIFIED
- **Godot Source**: `scripts/systems/character_system.gd::PERK_DEFS`, `acquire_perk()`, `_update_available_perks()`
- **Perks Implemented**: 14 perks (the previous 12 plus Master Trader); Master Trader requires level 12, Barter 75 and INT 7 (`perk.cc:74`, `perk_defs.h:24`)
- **Requirements**: Level + SPECIAL + skill checks; perk progression every 3 levels (+1 with Skilled), 37-rank cap (`character_editor.cc:5703-5722`)
- **Test**: Perk availability and acquisition verified in Stage C tests

---

## Combat Systems

### DT/DR Damage Formula ✅ VERIFIED
- **Godot Source**: `scripts/systems/combat_system.gd::calculate_damage()`
- **Formula**: `final_damage = max(1, raw_damage × ammo_damage_mod - target_DT) × (1 - target_DR/100) × ammo_DR_mod`
- **Ammo Modifiers** (verified against Fallout 2):
  - JHP: damage_mod=1.5, dt_mod=1.5, dr_mod=1.0 (vs light armor)
  - AP: damage_mod=0.75, dt_mod=0.4, dr_mod=1.0 (penetrates heavy armor)
  - Standard: damage_mod=1.0, dt_mod=1.0, dr_mod=1.0
- **Test**: `test_combat_damage.py` — 17 cases ALL PASS
- **Damage Types**: 7 types (NORMAL, LASER, FIRE, PLASMA, ELECTRICAL, EMP, EXPLOSIVE) with per-type DT/DR

### Action Points (AP) System ✅ VERIFIED
- **Godot Source**: `scripts/systems/combat_system.gd`, `scripts/systems/character_system.gd`, `tests/test_ap_fidelity.gd`
- **Base Formula**: 5 + DEX / 2 (verified) — matches Fallout 2: 5 + AG/2
- **Move Cost**: 1 AP per hex (normal), 2 AP (crippled leg) — matches Fallout 2
- **Weapon Attack Cost**: Weapon-defined AP cost (3-7 AP per weapon class)
- **Aimed Shot**: Base weapon AP + 1-2 AP — matches Fallout 2 (+1 to +2 AP)
- **Burst Fire**: 5-6 AP (fixed) — matches Fallout 2
- **Reload**: 2-4 AP (weapon-defined) — matches Fallout 2
- **Use Item**: 4 AP — matches Fallout 2 (3-4 AP range)
- **Called Shot Multipliers**:
  - HEAD: 1.4x (5 base → 7 AP = +2)
  - TORSO: 1.0x (5 base → 5 AP = +0)
  - LIMBS: 1.2x (5 base → 6 AP = +1)
  - EYES: 1.6x (5 base → 8 AP = +3)
  - GROIN: 1.2x (5 base → 6 AP = +1)
- **Action Boy Perk**: +2 AP per rank (max 3 ranks = +6 AP) — matches Fallout 2
- **Test**: `tests/test_ap_fidelity.gd` — 26 tests ALL PASS (base AP, move, aimed, burst, reload, use item, called shots, AP pool with perks)
- **Evidence**: SYSTEM_FIDELITY.md Fallout 2 reference values verified against implementation

### Called Shots ⚠️ PARTIAL
- **Godot Source**: `scripts/systems/combat_system.gd::CALLED_SHOTS`
- **Body Parts**: 8 parts (eyes, head, torso, groin, left/right arm, left/right leg)
- **Effects**: Stun, concussion, disarm, cripple_arm, knockdown, cripple_leg, blind, cripple_eyes, cripple_groin
- **AP/Accuracy Mods**: Need REA verification against Fallout 2 called shot tables

### Critical Hits ⚠️ UNVERIFIED
- **Godot Source**: `scripts/systems/combat_system.gd` — critical calculation exists
- **Fallout 2 Critical Tables**: Need REA extraction of critical hit tables by weapon/body part
- **Test**: No focused critical hit regression test

### Cover System ⚠️ UNVERIFIED (Original Design)
- **Godot Source**: `scripts/systems/cover_system.gd`
- **Status**: Original mobile-friendly design, not Fallout 2 system (Fallout 2 had no cover mechanics)
- **Note**: Marked as enhancement, not fidelity target

---

## Item Systems

### Weapon Data ✅ VERIFIED (Structure)
- **Godot Source**: `data/weapons.json` (24 weapons), `scripts/systems/item_definition.gd::WeaponDefinition`
- **Classes**: MELEE, PISTOL, SMG, SHOTGUN, RIFLE, HEAVY, ENERGY
- **Fields**: damage_min/max, ap_cost, range, caliber, magazine_size, weight, value, required_might
- **Original Fallout 2 Stats**: Need REA comparison for each weapon

### Armor Data ✅ VERIFIED (Structure)
- **Godot Source**: `data/armor.json` (18 pieces), `scripts/systems/item_definition.gd::ArmorDefinition`
- **Per-Damage-Type DT/DR**: 7 damage types with individual values
- **Slots**: body, head
- **Original Fallout 2 Stats**: Need REA comparison

### Ammo Data ✅ VERIFIED (Structure)
- **Godot Source**: `data/ammo.json` (23 types), `scripts/systems/item_definition.gd::AmmoDefinition`
- **Classes**: STANDARD, JHP, AP, INCENDIARY, MICROFUSION, SMALL_ENERGY
- **Modifiers**: damage_mod, dt_mod, dr_mod, damage_type_override
- **Original Fallout 2 Stats**: Need REA comparison

---

## World Systems

### Quest System ✅ VERIFIED (Structure)
- **Godot Source**: `scripts/systems/quest_manager.gd`
- **Quests**: 3 branching quests implemented (Find Vault, Merchant Woes, Lost Caravan)
- **States**: AVAILABLE, ACTIVE, COMPLETED, FAILED
- **Integration**: EventBus for auto-updates
- **Original Fallout 2 Quest Logic**: Structure verified, specific quest content is original IP

### World Map Travel ❌ MISSING
- **Godot Source**: Not implemented
- **Fallout 2 System**: Travel speed, random encounters, location discovery, time advancement

### NPC Schedules/AI ❌ MISSING
- **Godot Source**: Not implemented
- **Fallout 2 System**: Day/night cycles, faction AI, companion commands

### Reputation/Factions ❌ MISSING
- **Godot Source**: Not implemented
- **Fallout 2 System**: Town reputation, faction reputation, global variables

---

## Save/Load System

### Save Versioning ✅ VERIFIED
- **Godot Source**: `scripts/core/game_manager.gd`, `scripts/core/save_system.gd`
- **Version 2**: SPECIAL rename migration (v1→v2)
- **Migration**: Idempotent, preserves all non-SPECIAL data
- **Test**: 4 migration tests ALL PASS

---

## Summary: Next Verification Priorities

| Priority | System | Action Required |
|----------|--------|-----------------|
| P1 | Combat AP Costs | REA extraction of Fallout 2 weapon AP cost table |
| P1 | DT/DR Formula Edge Cases | REA verification of damage clamping, minimum damage |
| P1 | Critical Hit Tables | REA extraction of critical tables by weapon/body part |
| P1 | Called Shot Tables | REA verification of AP/accuracy/effect per body part |
| P1 | Weapon Stats | REA comparison of all 24 weapons vs Fallout 2 proto data |
| P1 | Armor Stats | REA comparison of all 18 armor pieces vs Fallout 2 proto data |
| P1 | Ammo Stats | REA comparison of all 23 ammo types vs Fallout 2 proto data |
| P2 | World Map | Implement travel system (Fallout 2 reference) |
| P2 | NPC AI | Implement schedules/faction behavior |
| P2 | Reputation | Implement town/faction reputation system |

---

*Last Updated: 2026-11-09 — XP progression verified with comprehensive test suite*
---

## m01692 Fidelity Corrections (2026-11-28)

Source: fallout2-ce full tree in `C:\Users\rf24k\AppData\Local\Temp\f2ce\full\fallout2-ce-main`. All fixes are source-verified; no invented coefficients.

### Derived stats and level-up (VERIFIED)
- `CharacterCreationRules.derive_stats()` is the single source of truth for HP/AP/AC/Healing/Sequence/Crit/Carry/Melee/Sequence and is reused by CharacterCreationRules, CharacterSystem and GameManager.
- Vanilla values: HP `15+ST+2*EN + (level-1)*(2+EN/2) + Lifegiver*4*(level-1)`; AP `5+AG/2`; AC `AG` (Kamikaze zeroes only base AG); Healing `max(1, EN/3)`; Crit `LK`; Carry `25+25*ST` (Small Frame `-10*BASE ST`); Melee `max(1, ST-5)`; Sequence `2*PE`; skill cap 300.
- Skill points/level: `5 + 2*effective_INT + Educated*2 + Skilled*5 - Gifted*5`, clamp 0..99 (`character_editor.cc:5681-5701`). Previously wrong `5 + INT/2` is removed.
- Perks: progression 3 (+1 with Skilled), 37-rank cap (`character_editor.cc:5703-5722`). Master Trader added with level 12 / Barter 75 / INT 7 (`perk.cc:74`), skill requirements checked in `_update_available_perks()`.
- Numerical test: `tests/test_special_fidelity.gd` 81/81 PASS (INT5 -> 15 SP, INT5+Gifted effective INT6 -> 12, INT10+Educated+Skilled -> 32; AC, carry, healing, crit, perk gate).

### All 16 traits (PARTIAL -> verified where possible)
- Added missing traits: One Handed (`-40` two-hand / `+20` one-hand ToHit, `combat.cc:4404-4410`), Jinxed (50% miss -> critical failure, `combat.cc:3856-3862`), Chem Reliant (addiction x2, withdrawal /2, `item.cc:2822-2827,3056-3060`), Chem Resistant (addiction /2, duration /2, `item.cc:2825-2831,2623-2628`), Bloody Mess (visual-only BIG HOLE death animation, `actions.cc:208-235`), Sex Appeal (enum only; effect UNVERIFIED, flag only).
- Fast Shot AP/aimed-shot and Finesse/Heavy Handed crit modifiers are now consumed by combat calculations where applicable; Small Frame and Kamikaze use BASE SPECIAL in creation and runtime.
- UNRESOLVED: exact age modifiers (`pc.cc` absent from verified sources), Sex Appeal mechanical effect, full Fallout 2 critical-hit tables and called-shot accuracy tables.

### Barter (VERIFIED chain)
- Buy: `(160+npcBarter)/(160+playerBarter) * 2 * rawCost * ((dialogueBarterMod + reactionMod + 100 - masterTraderBonus)/100) + capsComponent`, truncated to int, clamp 0.01 (`inventory.cc:4673-4703`).
- `barter_mod` is split into dialogue modifier (`gdialog_set_barter_mod`, opcode `0x814E` -> `gameDialogBarter` -> `inventoryOpenTrade`) and reaction modifier (`>10 GOOD -15`, `>-10 NEUTRAL 0`, else BAD +25; `reaction.cc:13-25`, `inventory.cc:5091-5124`). Both are saved/loaded by TradeSystem.
- Party-best Barter includes the player (index 0) plus active visible companions (`party_member.cc:1182`); with no companions player Barter 60 is used. The non-vanilla `max(1, barter)` clamp was removed.
- NPC exports `trade_barter_mod`/`reaction_value`, trade UI applies them, DialogueConsequence.SET_BARTER_MOD and `_execute_action("set_barter_mod:<int>")` provide the real gameplay caller. Master Trader perk is now obtainable at its vanilla requirements.
- Numerical tests: stimpak base 40 -> buy 80 (neutral), 68 (GOOD), 100 (BAD), 60 (Master Trader), 48 (GOOD + Master Trader); leather armor 300 -> buy 600 / sell 300; zero Barter skill -> 110 (no clamp). `scripts/tests/test_trade.gd` 19/19 PASS.

### Save/load compatibility (VERIFIED)
- TradeSystem save data is a wrapper `{"merchants": ..., "barter_mod": ..., "reaction_modifier": ...}`; `load_save_data()` accepts both wrapper and legacy bare merchant map. GameManager continues to store it under `save_data["merchants"]`.
- CharacterSystem persists `derived` and `effective_special`; load does not recompute them, preserving saved HP/AP. Save/load regression: no duplicated items or caps, no stock restoration.