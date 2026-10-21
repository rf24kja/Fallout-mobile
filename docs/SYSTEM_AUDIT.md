# System Audit — Current Prototype vs. Target Fidelity

## Executive Summary

**Current State**: Functional prototype with basic combat, character progression, inventory, and dialogue systems. All 28 tests pass.

**Critical Gaps**: 
- Combat missing DT/ammo interaction, called shots, body parts, cover mechanics
- Weapons: Only 1 placeholder weapon, no role structure, no ammo types
- Armor: Only DR, no DT, no weight/stealth tradeoffs
- Skills: Defined but not integrated into dialogue/world checks
- Quest: Single linear quest, no branching beyond keep/return

---

## 1. Combat System Audit

| Subsystem | Current | Target | Gap | Severity |
|-----------|---------|--------|-----|----------|
| Turn/AP System | ✅ Basic (AP pool, costs, end turn) | CRITICAL | Missing: Delay, Ready, Wait actions | MEDIUM |
| Initiative | ✅ AGI+PER sort | CRITICAL | OK | LOW |
| Hit Chance | ⚠️ Basic formula | CRITICAL | Missing: Range bands, cover %, called shots, lighting, target size | CRITICAL |
| Damage Calculation | ✅ Min/Max + STR for melee | CRITICAL | OK | LOW |
| **DR/DT Armor** | ⚠️ DR only (percentage) | **CRITICAL** | **DT (flat reduction) MISSING** | **CRITICAL** |
| Ammo Interaction | ❌ None | CRITICAL | No JHP/AP/special ammo modifiers | CRITICAL |
| Body Parts | ❌ None | HIGH | No called shots to eyes/head/arms/legs/groin | HIGH |
| Critical System | ✅ Basic (LK + weapon) | CRITICAL | Missing: Better Criticals, Sniper, Slayer perks | MEDIUM |
| Burst/Aimed Modes | ✅ AP cost modifiers | CRITICAL | Missing: Cone for burst, accuracy bonus for aimed | MEDIUM |
| Reload | ✅ AP cost only | HIGH | No magazine/ammo tracking | HIGH |
| Move Action | ✅ AP cost + position | HIGH | No hex grid, no facing, no opportunity fire | HIGH |
| AI | ⚠️ Nearest enemy attack | MEDIUM | No tactics, no cover use, no flee | MEDIUM |
| Status Effects | ❌ None | MEDIUM | No poison, rad, crippled limbs, blindness | MEDIUM |
| Combat Log | ⚠️ Signal only | LOW | No persistent log UI | LOW |

### Combat Code Quality
- **combat_system.gd**: Well-structured, signals-based, testable
- **Uses Dictionary for participants** — flexible but no type safety
- **Damage types enum** defined but armor only uses DR
- **AP costs hardcoded** in some places (reload=3, move=2, use_item=4)

---

## 2. Character System Audit

| Subsystem | Current | Target | Gap | Severity |
|-----------|---------|--------|-----|----------|
| SPECIAL Attributes | ✅ 7 stats, 1-10 | CRITICAL | Names copied (Strength, etc.) — need original names | HIGH |
| Derived Stats | ✅ HP, AP, Healing, Poison, Rad, Sequence, Crit | CRITICAL | Formulas slightly different from FO2 | MEDIUM |
| Skills | ✅ 18 skills with base stat deps | CRITICAL | Tag skills work, but skills not used in dialogue/world | HIGH |
| Skill Points | ✅ 5 + INT/2 per level | CRITICAL | OK | LOW |
| Perks | ✅ 13 perks with reqs/ranks | HIGH | Missing: Many iconic perks, no perk tree visualization | MEDIUM |
| Level Up | ✅ XP curve, HP gain, SP, Perk every 3 | CRITICAL | OK | LOW |
| SPECIAL Improvement | ✅ improve_special() | HIGH | No limit on total points (should cap) | MEDIUM |

### Character Code Quality
- **character_system.gd**: Excellent — comprehensive, well-tested, save/load works
- **Perk definitions** are data-driven — easy to extend
- **Skill recalculation** preserves invested points correctly
- **SPECIAL names are literal Fallout** — must rename for original IP

---

## 3. Item System Audit

| Subsystem | Current | Target | Gap | Severity |
|-----------|---------|--------|-----|----------|
| Item Definition | ✅ Resource-based, categories | HIGH | Missing weapon/armor/ammo specific fields | CRITICAL |
| Item Database | ⚠️ 6 items (2 quest, 2 consumable, 1 weapon, 1 misc) | CRITICAL | **Only 1 weapon (10mm Pistol), NO armor, NO ammo** | CRITICAL |
| Inventory | ✅ Weight, slots, stacking, save/load | HIGH | No equipment slots, no weapon/armor equipping | HIGH |
| Consumables | ⚠️ Stimpak, RadAway only | HIGH | No chems, no food, no tools, no crafting mats | HIGH |
| Weapons | ❌ 1 placeholder | CRITICAL | No weapon stats in ItemDefinition (damage, AP, range, skill, crit, burst, ammo type) | CRITICAL |
| Armor | ❌ None | CRITICAL | No armor items at all | CRITICAL |
| Ammo | ❌ None | CRITICAL | No ammo items, no caliber system | CRITICAL |
| Equipment Slots | ❌ None | CRITICAL | No paperdoll, no equip logic | CRITICAL |
| Item Condition | ❌ None | MEDIUM | No degradation/repair | MEDIUM |

### Item Code Quality
- **item_definition.gd**: Clean base class, but too generic — needs weapon/armor/ammo subclasses
- **item_database.gd**: Hardcoded items — should be data-driven (JSON/CSV)
- **Inventory** doesn't integrate with combat (equipped weapon, armor)

---

## 4. Dialogue/Quest System Audit

| Subsystem | Current | Target | Gap | Severity |
|-----------|---------|--------|-----|----------|
| Dialogue Nodes | ✅ Node-based, conditions, options | HIGH | OK structure | LOW |
| Conditions | ✅ Stat checks, quest flags, inventory | HIGH | Missing: Skill checks, reputation, time | MEDIUM |
| Consequences | ✅ Quest flags, items, caps | HIGH | Missing: Reputation, faction, world state | MEDIUM |
| Skill-gated Options | ✅ INT 7 example | HIGH | Only INT example, no other skills | HIGH |
| Branching | ⚠️ Single quest (keep/return) | HIGH | No multi-path, no mutually exclusive | HIGH |
| Quest Tracking | ✅ Flags in GameManager | HIGH | OK | LOW |
| Reputation | ❌ None | MEDIUM | No faction/town reputation | MEDIUM |
| Dialogue UI | ⚠️ Basic | MEDIUM | No skill tags visible, no history | MEDIUM |

### Dialogue Code Quality
- **dialogue_manager.gd**: Well-structured, condition/consequence system works
- **dialogue_types.gd**: Clean data classes
- **Hardcoded dialogues** — should be external data files

---

## 5. World/Exploration Audit

| Subsystem | Current | Target | Gap | Severity |
|-----------|---------|--------|-----|----------|
| Movement | ❌ None (combat only) | HIGH | No overworld, no hex/tile movement | HIGH |
| Random Encounters | ❌ None | MEDIUM | — | MEDIUM |
| Time System | ❌ None | MEDIUM | No day/night, no travel time | MEDIUM |
| Factions | ❌ None | MEDIUM | — | MEDIUM |
| Save/Load | ✅ Full character + inventory | CRITICAL | OK | LOW |

---

## 6. Visual/UX Audit

| Subsystem | Current | Target | Gap | Severity |
|-----------|---------|--------|-----|----------|
| Combat UI | ⚠️ Basic buttons | HIGH | No hex grid, no AP preview, no called shot UI | HIGH |
| Inventory UI | ⚠️ Basic list | HIGH | No paperdoll, no drag-drop equip | HIGH |
| Character Sheet | ❌ None | HIGH | — | HIGH |
| Dialogue UI | ⚠️ Basic | MEDIUM | No skill tags, no history | MEDIUM |
| Art Style | ❌ Placeholder 1x1 PNGs | CRITICAL | **No coherent art direction** | CRITICAL |

---

## 7. Placeholder Identification Summary

### 🔴 CRITICAL Placeholders (Block Vertical Slice)
1. **Weapon System** — Only 1 weapon, no stats, no ammo, no roles
2. **Armor System** — No armor items, DR only (no DT), no equipment slots
3. **Ammo System** — Does not exist
4. **Art Assets** — 1x1 PNG placeholders, no isometric rendering
5. **Equipment/Paperdoll** — No equip logic, no visual representation

### 🟠 HIGH Placeholders (Degrade Quality)
6. **Skill Integration** — Skills exist but don't gate dialogue/world
7. **Quest Branching** — Only 1 linear quest
8. **Combat Tactics** — No cover, called shots, body parts, burst cone
9. **AI** — Dumb nearest-target only

### 🟡 MEDIUM Placeholders (Polish)
10. **Perk Tree** — Missing iconic perks, no UI
11. **Status Effects** — No poison/rad/cripple in combat
12. **Reputation** — No faction system
13. **Item Condition** — No degradation/repair

---

## 8. Immediate Action Plan

### Phase 1: Item/Combat Foundation (Week 1-2)
1. Extend ItemDefinition → WeaponDefinition, ArmorDefinition, AmmoDefinition
2. Add DT field to armor, ammo_type to weapon
3. Implement JHP/AP ammo damage modifiers in combat
4. Create equipment slots (weapon, armor, helmet, accessory)
5. Populate ItemDatabase with 20+ original items covering all roles

### Phase 2: Combat Depth (Week 2-3)
1. Add called shots (body parts with effects)
2. Add cover system (percentage hit chance modifier)
3. Add burst cone, aimed shot accuracy bonus
4. Add status effects (crippled limbs, blindness, poison)

### Phase 3: Character Polish (Week 3)
1. Rename SPECIAL to original names (Might, Awareness, Vitality, Presence, Intellect, Dexterity, Fortune)
2. Integrate skills into dialogue conditions
3. Add remaining iconic perks

### Phase 4: Quest/World (Week 4)
1. Design 3 branching quests with ≥3 solutions each
2. Add reputation system
3. Basic overworld movement

### Phase 5: Visual Pipeline (Week 4-5)
1. Isometric tile rendering
2. Character sprite system
3. Coherent gritty art direction

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Auditor: Lead Systems Designer*