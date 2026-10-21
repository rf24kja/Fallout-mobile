# Item Balance Matrix — Weapons, Ammo, Armor, Healing, Utility

## Purpose

Structured design matrix mapping **Fallout 2 reference roles** → **Our Original Product Equivalents**.
Each entry defines: mechanical identity, visual identity, balance notes, implementation status.

**Golden Rule**: Same tactical role, different art/name/lore. Never invent weaker mechanics than the reference.

---

## 1. WEAPONS — ROLE STRUCTURE

### 1.1 Weapon Class Definitions (Our Product)

| Our Class | Role | Key Mechanical Identity | Progression Tier |
|-----------|------|------------------------|------------------|
| **Sidearms** | Backup, 1H, fast AP | Low AP (4-5), med range (15-20m), 1H, versatile ammo | Early → Mid |
| **Submachine Guns** | Close burst, 1H/2H | Burst-only (5-6 AP), high ROF, poor accuracy >15m | Early → Mid |
| **Shotguns** | Close cone, spread | Cone AoE, high per-pellet, DR weak, falloff steep | Early → Mid |
| **Rifles** | Mid-range precision | Aimed shot bonus, 2H, high single-shot dmg, optimal 30-50m | Mid → Late |
| **Heavy Weapons** | Area suppression | Very high AP (7-8), STR req, splash/cone, ammo-hungry | Late |
| **Energy Weapons** | Armor piercing | Low DT effectiveness, energy cells, no JHP/AP split | Mid → Late |
| **Melee/Unarmed** | Close control, no ammo | ST-based, high crit, special moves (push, disarm) | All tiers |
| **Explosives/Thrown** | Area denial | Timer/impact, splash, limited carry, high value | All tiers |

---

### 1.2 Weapon Balance Matrix — Original Product (24 Weapons)

| # | Our Weapon | Class | Tier | Damage | AP | Range | Ammo | Burst | Crit | STR | Value | Visual Identity | Mechanical Notes |
|---|------------|-------|------|--------|----|-------|------|-------|------|-----|-------|-----------------|------------------|
| 1 | **Scrap Knife** | Melee | 1 | 8-12 | 3 | 1.5m | — | — | 5% | 2 | 15 | Rusty shiv, tape grip | Emergency only |
| 2 | **Pipe Wrench** | Melee | 1 | 10-16 | 4 | 1.5m | — | — | 5% | 3 | 25 | Bent iron, industrial | Push attack (knockback) |
| 3 | **Machete** | Melee | 2 | 14-22 | 4 | 2m | — | — | 8% | 4 | 120 | Worn military, serrated | Bleed on crit |
| 4 | **Combat Knife** | Melee | 3 | 18-28 | 3 | 2m | — | — | 10% | 4 | 300 | Blackened tactical | Disarm chance |
| 5 | **Vibro-Blade** | Melee | 4 | 25-40 | 3 | 2m | Energy Cell | — | 15% | 5 | 1200 | Humming edge, battery | Ignores 50% DT |
| 6 | **Scrap Pistol** | Sidearm | 1 | 12-18 | 4 | 15m | .38 | — | 5% | 3 | 80 | Zip gun, duct tape | Jam chance 5% |
| 7 | **.38 Revolver** | Sidearm | 1 | 16-24 | 4 | 18m | .38 | — | 8% | 3 | 200 | Worn police issue | Reliable, no jam |
| 8 | **9mm Auto** | Sidearm | 2 | 18-26 | 4 | 20m | 9mm | — | 8% | 3 | 350 | Polymer frame, tactical | 15-round mag |
| 9 | **.44 Magnum** | Sidearm | 3 | 30-45 | 5 | 25m | .44 | — | 12% | 4 | 800 | Stainless, scoped option | High crit, 6-round |
| 10 | **10mm Tactical** | Sidearm | 3 | 22-32 | 4 | 22m | 10mm | — | 10% | 3 | 600 | Military polymer | AP ammo native |
| 11 | **Pipe SMG** | SMG | 1 | 10-14 | 5 | 12m | 9mm | Yes | 5% | 3 | 300 | Scrap metal, crude | 20-round, high spread |
| 12 | **9mm SMG** | SMG | 2 | 12-18 | 5 | 15m | 9mm | Yes | 5% | 3 | 500 | MP5-style, suppressor | 30-round, controllable |
| 13 | **10mm SMG** | SMG | 3 | 16-22 | 5 | 18m | 10mm | Yes | 8% | 4 | 900 | Bullpup, tactical | 30-round, low recoil |
| 14 | **Sawed-Off** | Shotgun | 1 | 8×14 | 5 | 8m | 12ga | — | 3% | 4 | 250 | Cut barrels, tape | Cone 60°, 2-shot |
| 15 | **Pump Shotgun** | Shotgun | 2 | 10×16 | 5 | 12m | 12ga | — | 5% | 4 | 500 | Wood furniture, tactical | 6-tube, reliable |
| 16 | **Combat Shotgun** | Shotgun | 3 | 12×18 | 5 | 15m | 12ga | — | 8% | 5 | 1200 | Drum mag, breach | 12-drum, fast cycle |
| 17 | **Hunting Rifle** | Rifle | 1 | 35-50 | 5 | 40m | .308 | — | 10% | 4 | 600 | Bolt-action, wood | 5-round, aimed +20% |
| 18 | **Assault Rifle** | Rifle | 2 | 28-38 | 5 | 35m | 5.56 | Yes | 8% | 4 | 1000 | AR-pattern, modular | 30-round, burst 3 |
| 19 | **Sniper Rifle** | Rifle | 3 | 50-75 | 6 | 60m | .308 | — | 15% | 5 | 2500 | Bolt, heavy barrel, bipod | Aimed +40%, 5-round |
| 20 | **Light Machine Gun** | Heavy | 3 | 30-42 | 7 | 40m | 5.56 | Yes | 5% | 6 | 2000 | Belt-fed, bipod | 100-belt, suppression |
| 21 | **Laser Pistol** | Energy | 2 | 25-35 | 4 | 20m | Microfusion | — | 10% | 2 | 800 | Sleek, glowing chamber | -50% DT, no JHP |
| 22 | **Laser Rifle** | Energy | 3 | 40-55 | 5 | 45m | Microfusion | — | 12% | 3 | 2000 | Long barrel, scope | -50% DT, accurate |
| 23 | **Plasma Rifle** | Energy | 4 | 55-75 | 6 | 40m | Microfusion | Yes | 10% | 4 | 4000 | Bulky, magnetic containment | -70% DT, splash 2m |
| 24 | **Gauss Rifle** | Energy | 4 | 70-100 | 7 | 55m | Microfusion | — | 18% | 6 | 8000 | Coilgun, capacitor bank | -80% DT, pierce cover |

---

### 1.3 Weapon Progression Flow

```
TIER 1 (Levels 1-5):     Scrap Knife → Pipe Wrench → .38 Revolver → Pipe SMG → Sawed-Off
TIER 2 (Levels 6-12):    Machete → 9mm Auto → 9mm SMG → Pump Shotgun → Hunting Rifle → Laser Pistol
TIER 3 (Levels 13-20):   Combat Knife → .44 Magnum → 10mm Tactical → 10mm SMG → Combat Shotgun → Assault Rifle → Laser Rifle
TIER 4 (Levels 21+):     Vibro-Blade → 10mm Tactical (max) → Sniper Rifle → LMG → Plasma Rifle → Gauss Rifle
```

**Progression Principle**: Each tier adds tactical options, not just +damage. Energy weapons introduce armor-pierce niche.

---

## 2. AMMO — TYPES & INTERACTIONS

### 2.1 Ammo Types (Our Product)

| Our Ammo | Caliber/Type | Weapons | vs Unarmored | vs Light Armor (DT 5-15) | vs Heavy Armor (DT 20+) | Cost Mult | Rarity | Visual |
|----------|--------------|---------|--------------|--------------------------|-------------------------|-----------|--------|--------|
| **.38 Standard** | .38 | .38 Revolver | 100% | 70% | 30% | 1.0× | Common | Brass, lead nose |
| **.38 JHP** | .38 | .38 Revolver | 150% | 40% | 10% | 2.0× | Uncommon | Hollow cavity |
| **.38 AP** | .38 | .38 Revolver | 70% | 100% | 120% | 3.0× | Rare | Black tip |
| **9mm Standard** | 9mm | 9mm Auto, 9mm SMG | 100% | 75% | 35% | 1.0× | Common | Brass, FMJ |
| **9mm JHP** | 9mm | 9mm Auto, 9mm SMG | 150% | 45% | 15% | 2.0× | Uncommon | Hollow point |
| **9mm AP** | 9mm | 9mm Auto, 9mm SMG | 75% | 100% | 110% | 2.5× | Rare | Black tip |
| **10mm Standard** | 10mm | 10mm Pistol/SMG | 100% | 80% | 40% | 1.0× | Common | Brass, bottlenecked |
| **10mm JHP** | 10mm | 10mm Pistol/SMG | 140% | 50% | 20% | 2.0× | Uncommon | Hollow point |
| **10mm AP** | 10mm | 10mm Pistol/SMG | 80% | 110% | 130% | 2.5× | Rare | Tungsten core |
| **.44 Standard** | .44 | .44 Magnum | 100% | 85% | 50% | 1.0× | Uncommon | Large brass |
| **.44 JHP** | .44 | .44 Magnum | 160% | 55% | 25% | 2.5× | Rare | Massive hollow |
| **.44 AP** | .44 | .44 Magnum | 85% | 120% | 140% | 3.0× | Very Rare | Depleted uranium |
| **.308 Standard** | .308 | Hunting Rifle, Sniper | 100% | 90% | 60% | 1.0× | Uncommon | Rifle brass |
| **.308 AP** | .308 | Hunting Rifle, Sniper | 90% | 110% | 130% | 2.0× | Rare | Steel core |
| **5.56 Standard** | 5.56 | Assault Rifle, LMG | 100% | 85% | 55% | 1.0× | Common | NATO brass |
| **5.56 AP** | 5.56 | Assault Rifle, LMG | 85% | 115% | 135% | 2.0× | Uncommon | Green tip |
| **12ga Buckshot** | 12ga | All Shotguns | 100% (×pellets) | 40% (×pellets) | 15% (×pellets) | 1.0× | Common | Red hull |
| **12ga Slug** | 12ga | All Shotguns | 120% (single) | 100% (single) | 80% (single) | 1.5× | Uncommon | Brass hull |
| **12ga Dragon's Breath** | 12ga | All Shotguns | 80% + Fire | 60% + Fire | 40% + Fire | 3.0× | Rare | Orange hull |
| **Microfusion Cell** | Energy | Laser/Plasma | 100% | 150%* | 200%* | 1.0× | Uncommon | Blue glow |
| **Microfusion Overcharge** | Energy | Laser/Plasma | 130% | 180%* | 250%* | 3.0× | Rare | Red glow, unstable |

*Energy weapons ignore DT (flat reduction). DR still applies.

### 2.2 Ammo Economy Design
- **Standard**: Baseline, cheap, plentiful
- **JHP**: Anti-personnel, expensive, useless vs armor — creates "wrong ammo" punishment
- **AP**: Anti-armor, very expensive, weak vs unarmored — tactical choice
- **Special**: Situational (Dragons Breath, Overcharge) — high cost, unique effects

**Inventory Pressure**: Player must choose loadout. 3-4 ammo types max carried.

---

## 3. ARMOR — DT/DR SYSTEM

### 3.1 Armor Slots
| Slot | Items | Notes |
|------|-------|-------|
| **Body** | 12 armors | Primary DT/DR, weight, stealth |
| **Head** | 6 helms | Adds DT/DR, perception effects |
| **Eyes** | 4 items | Night vision, glare resist, no DT |
| **Hands** | 3 gloves | Melee bonus, no DT |
| **Feet** | 3 boots | Move AP, rad resist, no DT |

### 3.2 Body Armor Matrix (12 Pieces)

| # | Armor | Tier | DT | DR | Weight | Stealth | Rad Res | Value | Visual Identity | Special |
|---|-------|------|----|----|--------|---------|---------|-------|-----------------|---------|
| 1 | **Wasteland Rags** | 1 | 0 | 5% | 3 | 0% | 0% | 20 | Dirty cloth, scraps | Baseline |
| 2 | **Leather Jacket** | 1 | 2 | 10% | 8 | -5% | 0% | 150 | Worn leather, patches | Light, cheap |
| 3 | **Reinforced Leather** | 2 | 4 | 15% | 12 | -10% | 0% | 400 | Metal studs, plates | Early upgrade |
| 4 | **Metal Armor** | 2 | 8 | 20% | 25 | -25% | 10% | 800 | Scrap metal plates | Heavy, rad resist |
| 5 | **Combat Armor** | 3 | 12 | 25% | 18 | -15% | 15% | 1500 | Sleek polymer-ceramic | Balanced |
| 6 | **Combat Armor Mk II** | 3 | 15 | 30% | 20 | -20% | 20% | 3000 | Darker, sealed joints | Mid-game peak |
| 7 | **Brotherhood Armor** | 3 | 18 | 35% | 22 | -25% | 25% | 5000 | Emblem, advanced seals | Faction reward |
| 8 | **Tactical Vest** | 3 | 10 | 20% | 10 | -5% | 5% | 1200 | Modular, pouches | High carry + |
| 9 | **Riot Gear** | 3 | 20 | 30% | 30 | -30% | 15% | 4000 | Full coverage, helmet | Melee resist + |
| 10 | **Advanced Power Armor** | 4 | 25 | 40% | 45 | -40% | 50% | 15000 | Frame-assisted, servos | STR+2, AP+2 |
| 11 | **Tesla Power Armor** | 4 | 22 | 45% | 40 | -35% | 60% | 20000 | Coils, energy dispersal | Energy DR 60% |
| 12 | **X-01 Prototype** | 4 | 30 | 50% | 35 | -30% | 70% | 50000 | Sleek, sealed, apex | Best overall |

### 3.3 Helmet Matrix (6 Pieces)

| # | Helmet | DT | DR | Weight | Perception | Special |
|---|--------|----|----|--------|------------|---------|
| 1 | Leather Cap | 1 | 5% | 1 | 0 | — |
| 2 | Metal Helmet | 3 | 10% | 4 | -1 | — |
| 3 | Combat Helmet | 5 | 15% | 3 | 0 | Night vision |
| 4 | Riot Helmet | 8 | 20% | 5 | -1 | Gas resist |
| 5 | Power Armor Helm | 10 | 25% | 8 | -2 | HUD, rad 30% |
| 6 | X-01 Helmet | 12 | 30% | 6 | 0 | Full HUD, rad 50% |

### 3.4 Armor Balance Notes

**DT/DR Interaction Formula**:
```
Raw Damage = Weapon Damage × Crit Multiplier
After DT = max(1, Raw Damage - DT)
Final Damage = After DT × (1 - DR/100)
```

**Ammo Modifiers Applied BEFORE DT/DR**:
- JHP: ×1.5 damage, ×1.5 DT effectiveness (armor blocks more)
- AP: ×0.8 damage, ×0.5 DT effectiveness (armor blocks less)
- Energy: DT ignored, DR applies normally

**Weight → AP Penalty**: Every 25 weight over STR×25 = -1 AP (encumbrance)

**Stealth Penalty**: Adds to detection radius, reduces sneak success

---

## 4. HEALING & CHEMS

### 4.1 Healing Items

| Item | HP Heal | AP Cost | Rad | Addiction | Weight | Value | Visual | Notes |
|------|---------|---------|-----|-----------|--------|-------|--------|-------|
| **Stimpak** | 25-40 | 4 | 0 | 5% | 0.5 | 40 | Red syringe | Combat heal |
| **Super Stimpak** | 60-80 | 4 | 0 | 10% | 0.5 | 200 | Blue syringe | Delayed heal (2 turns) |
| **Trauma Kit** | 15-25 | 6 | 0 | 0% | 2.0 | 80 | Bandage roll | Out of combat only |
| **Doctor's Bag** | 40-60 | 8 | 0 | 0% | 3.0 | 300 | Medical case | Requires Doctor skill |
| **Healing Powder** | 10-15 | 5 | +5 | 15% | 0.5 | 15 | Tribal pouch | Cheap, rad cost |
| **Herbal Remedy** | 8-12 | 5 | 0 | 5% | 0.3 | 10 | Dried herbs | No addiction risk |

### 4.2 Chems (Buffs + Addiction Risk)

| Chem | Effect | Duration | Addiction | Weight | Value | Visual |
|------|--------|----------|-----------|--------|-------|--------|
| **Psycho** | +3 STR, +20% DR | 3 min | 20% | 0.5 | 150 | Red inhaler |
| **Buffout** | +3 ST, +3 EN, +20 HP | 3 min | 15% | 0.5 | 120 | Blue pill |
| **Mentats** | +3 IN, +3 PE, +10% crit | 3 min | 10% | 0.5 | 100 | Red pill |
| **Jet** | +2 AP, +10% speed | 1 min | 35% | 0.3 | 80 | Silver canister |
| **Med-X** | +50% DR, ignore pain | 3 min | 25% | 0.5 | 200 | Auto-injector |
| **Ultrajet** | +3 AP, +15% speed | 2 min | 50% | 0.3 | 500 | Gold canister |

**Addiction System**: Each use rolls vs addiction chance. Addicted = withdrawal penalties when not dosing. Doctor/Chemist can cure.

---

## 5. UTILITY & TOOLS

| Item | Use | Skill | Weight | Value | Visual |
|------|-----|-------|--------|-------|--------|
| **Lockpick Set** | Open locks | Lockpick | 0.5 | 50 | Metal picks |
| **Electronic Lockpick** | Open electronic locks | Lockpick+Science | 1.0 | 300 | Probe device |
| **Repair Kit** | Repair items | Repair | 2.0 | 200 | Tools, parts |
| **Science Kit** | Hack terminals, analyze | Science | 1.5 | 300 | Portable scanner |
| **Doctor's Bag** | Heal crippled limbs | Doctor | 3.0 | 300 | Medical case |
| **Geiger Counter** | Detect radiation | — | 0.5 | 150 | Handheld meter |
| **Motion Sensor** | Detect movement | — | 0.5 | 200 | Beeping box |
| **Flare** | Light area | — | 0.2 | 5 | Red stick |
| **Rope** | Climb, descend | Outdoorsman | 3.0 | 50 | Coiled hemp |

---

## 6. IMPLEMENTATION STATUS

| Category | Designed | Coded | Tested | In Game |
|----------|----------|-------|--------|---------|
| Weapon Definitions | ✅ 24 | ❌ | ❌ | ❌ |
| Ammo Definitions | ✅ 21 | ❌ | ❌ | ❌ |
| Armor Definitions | ✅ 18 | ❌ | ❌ | ❌ |
| Healing Items | ✅ 6 | ⚠️ 2 (Stimpak, RadAway) | ✅ | ✅ |
| Chems | ✅ 6 | ❌ | ❌ | ❌ |
| Utility Items | ✅ 9 | ❌ | ❌ | ❌ |
| Weapon/Armor Equip System | ❌ | ❌ | ❌ | ❌ |
| Ammo-Consumption Logic | ❌ | ❌ | ❌ | ❌ |
| DT/DR Damage Calc | ❌ | ❌ | ❌ | ❌ |
| Called Shots | ❌ | ❌ | ❌ | ❌ |

---

## 7. DATA-DRIVEN IMPLEMENTATION PLAN

### 7.1 File Structure
```
data/
├── weapons.json       # 24 weapons with all stats
├── ammo.json          # 21 ammo types with modifiers
├── armor.json         # 18 armor pieces
├── healing.json       # 6 healing items
├── chems.json         # 6 chems
├── utility.json       # 9 utility items
└── progression.json   # Tier unlocks, vendor tables
```

### 7.2 Required Code Changes

1. **ItemDefinition subclasses**:
   ```gdscript
   class WeaponDefinition extends ItemDefinition:
       damage_min, damage_max, ap_cost, range, skill, crit_chance, burst_rounds, ammo_type, handedness
   
   class ArmorDefinition extends ItemDefinition:
       dt, dr, slot, stealth_penalty, rad_resist, str_req
   
   class AmmoDefinition extends ItemDefinition:
       caliber, dmg_mult_unarmored, dmg_mult_light, dmg_mult_heavy, dt_modifier, dr_modifier
   ```

2. **Combat System**: Integrate ammo_type → lookup AmmoDefinition → apply modifiers before DT/DR

3. **Inventory**: Add equipment_slots dictionary, equip/unequip logic, weight recalculation

4. **Character System**: Apply armor DT/DR to damage taken, apply weapon stats to attacks

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Author: Lead Systems Designer*  
*Status: DESIGN COMPLETE — Awaiting Implementation*