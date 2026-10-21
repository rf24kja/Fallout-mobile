# System Fidelity — Preserved Mechanics Reference

## Purpose

This document defines which Fallout 2 mechanics must be preserved at **high design fidelity** in our original product. Not copied — *preserved in spirit and structural integrity*.

Each system is rated by fidelity requirement:
- **CRITICAL** — Core to tactical depth; cannot be simplified without losing RPG credibility
- **HIGH** — Important for systemic coherence; can be adapted but not dumbed down
- **MEDIUM** — Supports depth; can be streamlined for mobile if core logic preserved
- **FLEXIBLE** — Implementation details; mobile UX may reshape

---

## 1. Combat System — CRITICAL

### 1.1 Turn Structure
| Fallout 2 | Our Requirement | Fidelity |
|-----------|-----------------|----------|
| Sequential turns by sequence stat | Sequential turns by derived initiative | CRITICAL |
| AP pool per turn (5-15+) | AP pool per turn (5-15+) | CRITICAL |
| Actions cost discrete AP | Actions cost discrete AP | CRITICAL |
| End turn = pass remaining AP | End turn = pass remaining AP | CRITICAL |
| Delay/Ready actions | Delay/Ready actions | HIGH |

**Must Preserve:** The tension of "do I attack twice or move + attack?" — AP as a tactical currency.

### 1.2 Action Economy
| Action | FO2 AP Cost | Our Target | Fidelity |
|--------|-------------|------------|----------|
| Move 1 hex | 1 | 1-2 | CRITICAL |
| Aimed shot | +1-2 AP | +1-2 AP | CRITICAL |
| Burst fire | 5-6 | 5-6 | CRITICAL |
| Reload | 2-4 | 2-4 | CRITICAL |
| Use item | 3-4 | 3-4 | CRITICAL |
| Change stance | 1-2 | 1-2 | HIGH |

### 1.3 Hit Chance Calculation
```
Base Chance = Weapon Skill + PER bonus + Range modifier + Cover modifier + Target size + Lighting + Condition
```
**Must Preserve:**
- Skill as primary driver (not level)
- Range bands (point blank / optimal / max / beyond)
- Cover as % modifier, not binary
- Called shots to body parts with distinct effects
- Critical chance separate from hit chance

**Can Adapt:** Exact formula constants; mobile UI for called shots (radial menu).

### 1.4 Damage & Armor — CRITICAL
```
Final Damage = (Weapon Damage × Crit Multiplier) - DT
Then: Final Damage = max(1, Final Damage × (1 - DR%))
```
**Must Preserve:**
- **DT (Damage Threshold)** — flat reduction, makes armor feel solid
- **DR (Damage Resistance)** — % reduction, scales with damage
- Both matter; neither dominates
- Ammo types modify DT/DR interaction (JHP vs AP)

**Do NOT Simplify To:** Single "armor rating" or pure % reduction.

### 1.5 Body Parts & Called Shots — HIGH
| Body Part | Effect | Fidelity |
|-----------|--------|----------|
| Eyes | Blindness, -PER, crit chance | HIGH |
| Head | Stun, KO chance, -INT | HIGH |
| Arms | Drop weapon, -accuracy | HIGH |
| Legs | Slow, knock down, -AP | HIGH |
| Groin | Stun, high pain | MEDIUM |
| Torso | Standard damage | CRITICAL |

**Mobile Adaptation:** Radial menu for called shots; visual feedback on target preview.

---

## 2. Weapons & Ammo — CRITICAL

### 2.1 Weapon Role Structure (Must Have Clear Identity)
| Class | Role | Key Stats | Fidelity |
|-------|------|-----------|----------|
| Melee/Unarmed | Close control, no ammo | ST-based, high crit | CRITICAL |
| Pistols | Sidearm, 1H, fast | Low AP, med range | CRITICAL |
| SMGs | Close burst, 1H/2H | Burst only, high AP | CRITICAL |
| Shotguns | Close cone, spread | High per-pellet, DR weak | CRITICAL |
| Rifles | Mid-range precision | Aimed shots, 2H | CRITICAL |
| Heavy Weapons | Area suppression | Very high AP, STR req | HIGH |
| Energy Weapons | Armor piercing | Low DT effectiveness | HIGH |
| Explosives | Area denial | Timer/impact, splash | HIGH |

### 2.2 Ammo Types — CRITICAL
| Type | vs Unarmored | vs Light Armor | vs Heavy Armor | Cost | Fidelity |
|------|--------------|----------------|----------------|------|----------|
| FMJ/Standard | 100% | 70% | 40% | Base | CRITICAL |
| JHP/Hollowpoint | 150% | 50% | 10% | 2× | CRITICAL |
| AP/Armor Piercing | 70% | 100% | 120% | 3× | CRITICAL |
| Special (tracer, incendiary, etc.) | Varies | Varies | Varies | High | MEDIUM |

**Must Preserve:** Meaningful choice — wrong ammo = tactical failure. Economy pressure.

### 2.3 Weapon Degradation — MEDIUM
- Condition affects accuracy, damage, jam chance
- Repair skill + tools + parts
- Can streamline: fewer condition states (Pristine / Worn / Damaged / Broken)

---

## 3. Armor System — CRITICAL

### 3.1 Armor Slots & Layering
| Slot | Examples | Fidelity |
|------|----------|----------|
| Body | Leather, Metal, Combat, Power | CRITICAL |
| Head | Helmet, Hood, Power Helm | HIGH |
| Eyes | Goggles, Sunglasses | MEDIUM |
| Hands | Gloves | LOW |
| Feet | Boots | LOW |

### 3.2 Armor Stats Per Piece
```
DT (flat), DR (%), Weight, Stealth Penalty, Rad Resistance, Condition, Value
```
**Must Preserve:**
- Weight vs Protection tradeoff (encumbrance matters)
- Stealth penalty on heavy armor
- Different armor types vs different damage types (optional but good)
- Power Armor as late-game power spike (STR req, fusion cores)

### 3.3 Armor Progression
Early → Mid → Late → Endgame
Leather → Metal/Combat → Advanced Combat → Power Armor

Each tier must feel like a **real upgrade**, not just +numbers.

---

## 4. Character System — CRITICAL

### 4.1 Primary Attributes (SPECIAL Equivalent)
| Attribute | Core Effects | Fidelity |
|-----------|--------------|----------|
| Strength | Carry, Melee dmg, Heavy wield | CRITICAL |
| Perception | Range, Crit chance, Detect | CRITICAL |
| Endurance | HP, Rad resist, Poison resist | CRITICAL |
| Charisma | Dialogue, Companions, Barter | HIGH |
| Intelligence | Skill points, Crafting, Dialogue | CRITICAL |
| Agility | AP, Initiative, Stealth, Dodge | CRITICAL |
| Luck | Crit chance, All skills, RNG | HIGH |

**Must Preserve:** Each attribute gates multiple systems. No dump stats.

### 4.2 Skills — CRITICAL
| Category | Skills | Fidelity |
|----------|--------|----------|
| Combat | Small Guns, Big Guns, Energy, Melee, Unarmed, Throwing | CRITICAL |
| Utility | First Aid, Doctor, Sneak, Lockpick, Steal, Traps | CRITICAL |
| Social | Speech, Barter, Gambling | HIGH |
| Tech | Science, Repair, Pilot | HIGH |
| Outdoor | Outdoorsman | MEDIUM |

**Must Preserve:**
- Skill % based (0-200%+), not just ranks
- Tag skills = 2× growth
- Books = permanent +X%
- Skill checks in dialogue AND world (not just combat)

### 4.3 Derived Stats — CRITICAL
| Stat | Formula | Fidelity |
|------|---------|----------|
| HP | 15 + ST + EN×2 + Lv×(3+EN/2) | CRITICAL |
| AP | 5 + AG/2 | CRITICAL |
| Carry Weight | 25 × ST | CRITICAL |
| Melee Damage | ST/2 | CRITICAL |
| Crit Chance | LK/2 + Perks | CRITICAL |
| Sequence | PE×2 | HIGH |
| Healing Rate | EN/3 | MEDIUM |
| Poison Resist | EN×5 | MEDIUM |
| Rad Resist | EN×2 + Armor | HIGH |

### 4.4 Perks — HIGH
- Every 3 levels (or 4)
- Enable new tactics, not just +%
- Prerequisites: Attribute + Skill + Level
- Mutually exclusive choices (choose one path)

---

## 5. Quest & Dialogue — HIGH

### 5.1 Dialogue Structure
- Node-based with conditions
- Skill checks visible (tagged) or hidden (roleplay)
- Reputation/faction gates
- Multiple resolutions per quest
- Consequences persist

### 5.2 Quest Design Patterns (Benchmark)
| Pattern | FO2 Example | Our Standard |
|---------|-------------|--------------|
| Multiple solutions | The Den: Slavers (fight/steal/talk/science) | ≥3 paths per major quest |
| Skill-gated options | Vault City: Doctor/Science/Repair | 2+ skill checks per branch |
| Moral ambiguity | Modoc: Bravin vs Grisham | No "good" choice |
| Time pressure | Arroyo: Temple of Trials timer | Optional, not forced |
| Faction reputation | NCR vs Vault City vs New Reno | 3+ factions per region |

---

## 6. Economy & Items — HIGH

### 6.1 Item Categories with Mechanical Purpose
| Category | Mechanical Role | Fidelity |
|----------|-----------------|----------|
| Weapons | Combat tools | CRITICAL |
| Ammo | Resource management | CRITICAL |
| Armor | Survival tools | CRITICAL |
| Healing | Tactical (Stimpak) vs Strategic (Doctor) | CRITICAL |
| Chems | Temporary buffs + addiction risk | HIGH |
| Tools | World interaction (lockpick, repair) | HIGH |
| Crafting | Economy loop, customization | MEDIUM |
| Quest Items | Gates, keys, evidence | CRITICAL |
| Junk | Economy filler, crafting parts | MEDIUM |

### 6.2 Economy Principles
- Money scarce early, meaningful late
- Barter skill matters
- Weight forces choices
- No vendor trash — everything has use or clear value

---

## 7. World Systems — MEDIUM

### 7.1 Travel
- Overworld map with random encounters
- Encounter difficulty scales with level + region
- Vehicle/fast travel as late-game unlock

### 7.2 Time
- Day/night cycle affects NPCs, visibility, encounters
- Healing/rest takes time
- Quest deadlines (some)

### 7.3 Reputation
- Per-settlement + per-faction
- Affects prices, dialogue, quest availability, hostility

---

## 8. Mobile Adaptations (Where Fidelity Meets UX)

| System | Adaptation | Fidelity Preserved |
|--------|------------|-------------------|
| Hex grid movement | Tap-to-move + path preview | Full tactical positioning |
| Called shots | Radial menu on long-press | All body parts, all effects |
| Inventory | Drag-drop + sort/filter | Full weight/value management |
| Dialogue | Scrollable, searchable history | Full branching, skill tags |
| Combat log | Collapsible, filterable | Full detail on tap |
| Character sheet | Tabbed, collapsible sections | All stats visible |

---

## 9. Implementation Status Tracker

| System | Current State | Target Fidelity | Gap | Priority |
|--------|---------------|-----------------|-----|----------|
| Turn/AP System | Basic (Stage C) | CRITICAL | AP costs, delay/ready | HIGH |
| Hit Chance | Basic formula | CRITICAL | Range bands, cover, called shots | HIGH |
| Damage/Armor | DR only | CRITICAL | DT missing, ammo interaction | CRITICAL |
| Weapon Roles | Placeholder | CRITICAL | No role structure | CRITICAL |
| Ammo Types | None | CRITICAL | Only generic "ammo" | CRITICAL |
| Armor System | Basic DR | CRITICAL | No DT, no weight/stealth | CRITICAL |
| Attributes | SPECIAL clone | CRITICAL | Names copied, not adapted | HIGH |
| Skills | Partial | CRITICAL | Missing non-combat skills | HIGH |
| Perks | None | HIGH | — | MEDIUM |
| Dialogue | Basic | HIGH | No skill gates, no persistence | HIGH |
| Quest System | Linear | HIGH | No branching | HIGH |
| Economy | Basic | HIGH | No scarcity, no barter | MEDIUM |

---

## 10. Red Lines — Do Not Cross

❌ **Single "armor rating" stat**  
❌ **Auto-hit / auto-miss** (no hit chance calculation)  
❌ **Generic "damage" ammo** (no JHP/AP distinction)  
❌ **Linear weapon upgrades** (Tier 1 → Tier 2 → Tier 3 with only +dmg)  
❌ **Skill checks only in combat**  
❌ **Quest markers on map** (no exploration)  
❌ **Fast travel from start**  
❌ **Infinite inventory**  
❌ **No consequence for failure**  
❌ **Cartoon visual style**

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Author: Lead Systems Designer*  
*Status: APPROVED — Design Constitution*