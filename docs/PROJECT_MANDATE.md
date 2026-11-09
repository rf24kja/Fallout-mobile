# PROJECT MANDATE — Fallout 2 Reborn Mobile

## Non-Negotiable Product Requirements

### 1. Core Identity
**This is a Fallout 2 adaptation.** Not an original IP "inspired by" Fallout 2. Every gameplay system must match the original game's behavior exactly where verifiable.

### 2. Fidelity Baseline (P0 — Must Have)

| System | Requirement | Verification Method |
|--------|-------------|---------------------|
| SPECIAL Attributes | Exact calculations (Strength, Perception, Endurance, Charisma, Intelligence, Agility, Luck) | REA + Ghidra + Original game |
| Derived Statistics | HP, AP, AC, Melee Damage, Carry Weight, Sequence, Healing Rate, Critical Chance, etc. | REA + Original formulas |
| Character Creation | Traits, Tag Skills, attribute allocation per original rules | Original character creation |
| Leveling & Perks | XP thresholds, perk list, perk effects per original | REA + Original game |
| Skills | All 18 skills, base values, modifiers, use conditions | REA + Original game |
| Combat — Action Points | AP calculation, weapon AP costs, movement AP, aimed shot AP | REA + Combat testing |
| Combat — Damage | DT/DR system, damage types, resistance, threshold | REA + Original formulas |
| Combat — Criticals | Critical hit tables, body parts, critical effects | REA + Original tables |
| Combat — Aimed Shots | Body part modifiers, AP costs, critical chance bonuses | REA + Original game |
| Weapons & Ammo | All original stats: damage, range, AP, capacity, weight, value | REA + Original data |
| Armor | All original stats: DT/DR per damage type, weight, value | REA + Original data |
| Inventory | Weight limit, containers, stacking, equipment slots | Original game behavior |
| NPC AI | Combat behavior, flee thresholds, targeting priority | REA + Original observation |
| Dialogue | Dialogue trees, skill checks, reputation effects | Original game scripts |
| Quests | Quest stages, objectives, rewards, world state changes | Original game data |
| World Map | Travel speed, encounters, locations, reputation | Original game data |
| Save/Load | Full state serialization, version migration | Testing + Original format |
| Reputation | Town reputation, karma, titles, faction standing | Original formulas |

### 3. Mobile Adaptation Requirements (P1 — Must Have)

| Feature | Requirement |
|---------|-------------|
| Touch Controls | Full gameplay via touch: movement, combat, inventory, dialogue |
| UI Scaling | Responsive layout for phone/tablet, landscape/portrait |
| Performance | 60 FPS on mid-range Android (Snapdragon 7-series equivalent) |
| Battery | No wake locks, efficient rendering, background pause/resume |
| Screen Sizes | Safe area handling, notch/cutout support |
| Orientation | Landscape primary, portrait for menus |

### 4. Visual Modernization (P2 — Should Have)

| Feature | Requirement |
|---------|-------------|
| Character Animation | Smooth 8-directional isometric animation |
| Combat Effects | Muzzle flashes, impact particles, blood, critical indicators |
| Environment | Dynamic lighting, weather, time-of-day |
| UI Polish | Transitions, feedback, accessibility (text size, contrast) |
| Cinematics | Dialogue portraits, scene transitions |

### 5. Extended Content (P3 — Nice to Have)

New content **must not** replace or simplify original systems:
- New weapons/armor with balanced stats
- New quests/locations consistent with lore
- New companions with unique dialogue
- Quality-of-life features (auto-sort, quick-save, etc.)

---

## Technical Constraints

### Engine
- **Godot 4.7.2** — Do not migrate without demonstrated necessity
- **GDScript** — Primary language; C# only if performance-critical

### Platforms
- **Primary**: Android (API 31+), ARM64 + x86_64
- **Future**: iOS (not currently supported)

### Original Game Data
- **Original Fallout 2 installation is READ-ONLY**
- Located at `C:\Code\REA_FALLOUT\Fallout2`
- Used ONLY for reference/reverse engineering
- **NEVER commit original game files to GitHub**

### Reverse Engineering Tools
- **REA CLI** — Primary binary analysis tool
- **Ghidra** — Decompilation and deep analysis
- Findings must be documented in `FALLOUT2_FIDELITY_MATRIX.md`

---

## Quality Gates

### Before Any Commit
- [ ] No secrets in diff
- [ ] Relevant tests pass
- [ ] Android build succeeds (if applicable)
- [ ] No regression in verified systems

### Before Any Push to `main`/`master`
- [ ] All quality gates pass
- [ ] APK verified with `apksigner`
- [ ] APK installs and runs on device
- [ ] Documentation updated

### Release Criteria
- [ ] All P0 systems verified
- [ ] Android Release build signed and tested
- [ ] Recovery guide validated
- [ ] GitHub Release created with APK artifact

---

## Decision Log

| Date | Decision | Rationale |
|------|----------|-----------|
| 2026-11-09 | GitHub repo = canonical remote | Single source of truth for recovery |
| 2026-11-09 | Godot 4.7.2 fixed | Stability over latest features |
| 2026-11-09 | Original game READ-ONLY | Legal compliance, data integrity |
| 2026-11-09 | Fidelity over velocity | Core value proposition |

---

## Success Metrics

1. **Gameplay**: Complete Arroyo → Klamath → Den → Modoc → Vault City → Gecko → Redding → New Reno → Sierra Army Depot → Navarro → Enclave Oil Rig playable
2. **Fidelity**: Zero known deviations from original mechanics in P0 systems
3. **Mobile**: 60 FPS sustained, < 500MB RAM, < 10% battery/hour
4. **Recovery**: Fresh clone → Godot open → APK build → Device install → Play in < 30 min
5. **History**: All meaningful development preserved in GitHub with traceable commits