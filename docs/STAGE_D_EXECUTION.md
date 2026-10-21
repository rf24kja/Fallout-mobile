# Stage D Execution Plan — Modern Isometric Graphics & World Expansion

## Purpose

Translate design documents into **executable engineering tasks** for Stage D. Reframed from "copy Fallout 2 assets" → **build original product with Fallout 2-level systemic quality**.

---

## 1. Stage D Mission Statement

> **Deliver a playable vertical slice in one original location ("The Rustyard") demonstrating: cohesive gritty isometric art direction, complete weapon/armor/ammo system, tactical combat with called shots & DT/DR, branching quests with skill gates, and 60 FPS on mid-range mobile.**

**Success Criteria**: Internal playtest — "This feels like a real RPG, not a prototype."

---

## 2. Workstream Architecture (5 Parallel Tracks)

```
┌─────────────────────────────────────────────────────────────────────┐
│                        STAGE D PROGRAM                              │
├──────────┬──────────────┬────────────┬────────────┬────────────────┤
│ WS-1     │ WS-2         │ WS-3       │ WS-4       │ WS-5           │
│ ART      │ SYSTEMS      │ QUEST      │ ENGINE     │ QA/RELEASE     │
│ PIPELINE │ DEPTH        │ CONTENT    │ PERF       │ INFRA          │
└──────────┴──────────────┴────────────┴────────────┴────────────────┘
```

| Workstream | Lead | Duration | Key Deliverable |
|------------|------|----------|-----------------|
| **WS-1: Art Pipeline** | Art Dir | 5 weeks | Rustyard location, 24 weapons, 18 armors, character sprites, Pip-Boy UI |
| **WS-2: Systems Depth** | Sys Des | 4 weeks | Weapon/Armor/Ammo definitions, DT/DR combat, called shots, equipment |
| **WS-3: Quest Content** | Quest Des | 4 weeks | 3 branching quests in Rustyard, reputation, companion reactions |
| **WS-4: Engine Perf** | Tech Lead | 3 weeks | 60 FPS mobile, atlas streaming, shader optimization, save/load <1s |
| **WS-5: QA/Release** | QA Lead | Ongoing | Test automation, device lab, release AAB, crash reporting |

---

## 3. Detailed Task Breakdown

### WS-1: ART PIPELINE (5 Weeks)

#### Week 1: Foundation & Tile System
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Blender isometric camera rig + render layers | Art Tech | 2 | Renders produce Albedo/Normal/Roughness/Depth/Emissive |
| Tile atlas builder (Python) | Art Tech | 2 | 2048×2048 atlases + .tres metadata |
| Ground tiles: dirt, asphalt, sand, concrete, metal (8 variants × 4 states) | Env Artist | 3 | Seamless, in-engine, palette-swap working |
| Wall tiles: concrete, brick, metal, wood (8 variants × 3 damage states) | Env Artist | 3 | Correct pivot, occlusion, normal maps |
| Prop library: crates, barrels, debris, bodies, terminals (20+) | Prop Artist | 3 | Modular, physics colliders, LOD |

#### Week 2: Characters & Equipment
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Base character: male/female, 8-dir walk/idle/aim/shoot/melee/hit/death | Char Artist | 4 | 256×512/frame, 8 anims, clean loops |
| Paperdoll layer system (body, armor, helmet, weapon, accessory) | Char Artist + Eng | 3 | Runtime layer swap, correct z-order |
| Armor visual tiers (4 tiers × body/helmet) | Char Artist | 3 | Distinct silhouette per tier |
| Weapon sprites: 24 weapons × 8 rotations | Weapon Artist | 4 | Consistent scale, muzzle flash origin |

#### Week 3: Combat Visuals & UI
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Combat FX: bullet impact, energy splash, explosion, blood, crit flash | VFX Artist | 3 | <15ms GPU, pooled, configurable |
| Pip-Boy UI: stats, inventory, data, map, rad tabs | UI Artist | 3 | Diegetic, 9-slice, gamepad/touch |
| Combat UI: AP radial, target preview, log panel | UI Artist | 2 | Touch + gamepad, radial 8-slice |
| Dialogue UI: portrait, typewriter, skill tags, history | UI Artist | 2 | Scrollable, searchable, animated |

#### Week 4: Location Assembly — The Rustyard
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Exterior: scrap walls, gate, towers, trading plaza, water tank | Level Artist | 3 | Navmesh, cover nodes, encounter zones |
| Interior 1: Bar/Casino (trader hub) | Level Artist | 2 | NPCs, containers, lighting |
| Interior 2: Mechanic/Clinic (services) | Level Artist | 2 | Workbench, doctor, storage |
| Interior 3: Bunker Entrance (dungeon lead-in) | Level Artist | 2 | Locked, radiation, loot |
| Lighting: Day/night cycle, volumetric dust, weather | Tech Artist | 2 | 4 ToD states, smooth transitions |

#### Week 5: Polish & Integration
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Portrait paintings: 10 NPCs (leader, trader, doctor, raider, etc.) | 2D Artist | 3 | Painted style, expressions |
| Decal system: blood, bullet, scorch, rad, graffiti | Tech Artist | 2 | Fades, pools, directional |
| Performance pass: atlas optimization, draw call reduction | Tech Lead | 2 | <50 draw calls, 60 FPS target device |
| Integration testing: all systems in Rustyard | All | 2 | Playable start-to-finish |

---

### WS-2: SYSTEMS DEPTH (4 Weeks)

#### Week 1: Data Definitions & Item System
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| WeaponDefinition, ArmorDefinition, AmmoDefinition classes | Sys Eng | 2 | Inherit ItemDefinition, all fields |
| Data files: weapons.json, ammo.json, armor.json, healing.json, chems.json, utility.json | Sys Des | 2 | 24W, 21A, 18Ar, 6H, 6C, 9U items |
| Equipment system: slots, equip/unequip, stat application, weight recalc | Sys Eng | 3 | Paperdoll updates, combat stats refresh |
| Ammo consumption: magazine tracking, reload logic, caliber matching | Sys Eng | 2 | Partial reload, ammo switching |

#### Week 2: Combat Mechanics — DT/DR & Called Shots
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| DT/DR damage formula: Raw → DT → DR → Final | Sys Eng | 2 | Unit tested, matches matrix |
| Ammo modifiers: JHP/AP/Energy applied pre-DT | Sys Eng | 2 | Wrong ammo = tactical failure |
| Called shots: 6 body parts, effects, AP cost, accuracy penalty | Sys Eng | 3 | Radial UI integration |
| Cover system: % hit chance modifier, directional, destructible | Sys Eng | 2 | Visual indicator, AI uses |

#### Week 3: Combat Mechanics — Advanced
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Burst cone: 3-round, spread pattern, per-pellet DR | Sys Eng | 2 | Cone visual, accurate |
| Aimed shot: +accuracy, +crit, body part targeting | Sys Eng | 1 | Stacks with called shot |
| Status effects: crippled limbs, blindness, poison, radiation, fire | Sys Eng | 3 | Visual, gameplay, save/load |
| AI tactics: cover, flank, flee, suppressive fire, grenade | Sys Eng | 2 | Behavior tree, difficulty scaling |

#### Week 4: Integration & Balance
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Character System: rename SPECIAL → original names | Sys Des | 1 | Might, Awareness, Vitality, Presence, Intellect, Dexterity, Fortune |
| Skill integration: dialogue checks, world checks, crafting | Sys Eng | 2 | 18 skills all used |
| Perk tree: 30 perks, prereqs, mutual exclusions, UI | Sys Eng | 2 | Visual tree, respec option |
| Balance pass: weapon/armor/ammo curves, economy, XP | Sys Des | 2 | Playtest data, iteration |

---

### WS-3: QUEST CONTENT (4 Weeks)

#### Week 1: Quest Framework & The Waking Archive (Main)
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Quest data format: JSON with nodes, conditions, consequences, branches | Quest Eng | 2 | Loads, validates, hot-reload |
| Reputation system: faction + settlement, -100 to +100, decay | Quest Eng | 2 | Persistent, affects prices/dialogue |
| **Quest: The Waking Archive** — 4 paths (Science/Speech/Lockpick/Combat) | Quest Des | 3 | All paths testable, consequences persist |

#### Week 2: Faction Quests — Water War & Raider's Bargain
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| **Quest: Water War** — 3 paths (Barter/Repair/Combat) + reputation shifts | Quest Des | 3 | Militia/Trader/Raider rep changes |
| **Quest: Raider's Bargain** — 4 paths (Speech/Sneak/Traps/Combat) | Quest Des | 3 | Raider rep, companion reactions |
| Companion affinity system: 5 companions, opinion per choice | Quest Eng | 2 | Visible, affects dialogue/ending |

#### Week 3: Side Quests & World Reactivity
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| **Quest: The Last Harvest** — 3 paths (Doctor/Outdoorsman/Repair) | Quest Des | 2 | Farmstead saved/lost |
| **Quest: Silent Frequency** — 3 paths (Science/Lockpick/Sneak) | Quest Des | 2 | Radio tower outcome |
| World state persistence: NPC death, building damage, loot taken | Quest Eng | 3 | Save/load, visible changes |

#### Week 4: Polish & Capstone
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| **Quest: Feast or Famine** — Capstone, 5 paths, all skills | Quest Des | 3 | Ending slides vary by choices |
| Dialogue polish: 500+ nodes, skill tags, companion interjections | Quest Des | 3 | No placeholder text |
| Playtest: 3 external testers, feedback iteration | QA | 2 | Bugs fixed, fun confirmed |

---

### WS-4: ENGINE PERFORMANCE (3 Weeks)

#### Week 1: Rendering Optimization
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Atlas texture streaming (load visible + 1 ring) | Tech Lead | 3 | <100MB VRAM, no pop-in |
| Draw call batching: tilemap, characters, props, UI | Tech Lead | 2 | <50 draw calls typical |
| Shader optimization: single uber-shader, branch reduction | Tech Lead | 2 | <5ms GPU frame |
| Culling: Frustum + occlusion + distance LOD | Tech Lead | 2 | Off-screen = 0 cost |

#### Week 2: Mobile-Specific
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Touch controls: virtual stick, context radial, pinch zoom | Tech Lead | 2 | No overlap, haptic |
| Battery optimization: frame pacing, background pause | Tech Lead | 2 | <5% battery/hour |
| Thermal: Dynamic resolution, effect quality scaling | Tech Lead | 2 | Sustained 60 FPS 30min |
| Memory: Texture compression (ASTC), audio streaming | Tech Lead | 2 | <300MB RAM |

#### Week 3: Stability & Build
| Task | Owner | Days | Acceptance |
|------|-------|------|------------|
| Save/Load: <1s, background thread, version migration | Tech Lead | 2 | 100% compatible |
| Crash reporting: Native + script, auto-upload | Tech Lead | 2 | Dashboard visible |
| Release AAB: Signing, bundle config, Play Console upload | Tech Lead | 2 | Internal test track |
| Device lab: Test on 5 devices (low/mid/high, Android/iOS) | QA | 2 | All pass |

---

### WS-5: QA / RELEASE INFRASTRUCTURE (Ongoing)

| Task | Frequency | Acceptance |
|------|-----------|------------|
| Automated test suite: 28+ tests, headless, CI | Every commit | 100% pass |
| Device test matrix: 5 devices × 2 OS × 3 sessions/week | Weekly | Zero critical bugs |
| Performance profiling: Frame time, memory, battery | Weekly | Trends documented |
| Playtest sessions: 3 external, structured feedback | Bi-weekly | Actionable items |
| Release candidate: AAB + changelog + rollback plan | Per milestone | Store-ready |

---

## 4. Cross-Workstream Dependencies

| Dependency | From | To | Resolution |
|------------|------|----|------------|
| Item data → Art (weapon/armor sprites) | WS-2 | WS-1 | Week 1 data freeze, Week 2 art start |
| Equipment system → Paperdoll art | WS-2 | WS-1 | Week 1 API defined, Week 2 integration |
| Quest data → Location props/NPCs | WS-3 | WS-1 | Week 1 quest list, Week 3 placement |
| Combat FX → VFX art | WS-2 | WS-1 | Week 2 spec, Week 3 delivery |
| Performance budgets → Art asset limits | WS-4 | WS-1 | Week 1 budgets, continuous monitoring |

---

## 5. Risk Register & Mitigation

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Art pipeline throughput too slow | High | High | Simplify: fewer variants, reuse, procedural wear |
| DT/DR balance feels bad | Medium | High | Playtest early (Week 2), telemetry, rapid iteration |
| Mobile 60 FPS not achievable | Medium | Critical | Profile weekly, quality scalars, fallback to 30 FPS |
| Quest branching complexity explodes | Medium | Medium | Limit to 4 paths, shared nodes, reuse conditions |
| Save/load breaks with new systems | High | High | Versioned schema, migration tests in CI |
| Scope creep from "Fallout 2 quality" | High | High | Hard scope lock: only Rustyard + 3 quests + systems |

---

## 6. Milestones

| Milestone | Target Date | Criteria |
|-----------|-------------|----------|
| **M1: Data Complete** | Week 1 end | All JSON files validated, loaded in-game |
| **M2: Combat Systems Playable** | Week 2 end | DT/DR, called shots, ammo, equipment working |
| **M3: Rustyard Greybox** | Week 3 end | Navmesh, encounters, 3 interiors navigable |
| **M4: Visuals Integrated** | Week 4 end | All art in, lighting, UI, 60 FPS profiling |
| **M5: Quest Playable** | Week 4 end | 3 quests completable, consequences persist |
| **M6: Vertical Slice** | Week 5 end | Start-to-finish playable, external playtest pass |
| **M7: Release Candidate** | Week 6 end | AAB signed, device lab pass, crash-free 1hr |

---

## 7. Resource Requirements

| Role | Allocation | Notes |
|------|------------|-------|
| Systems Designer | 100% | WS-2 lead, balance owner |
| Quest Designer | 100% | WS-3 lead, writing + implementation |
| Technical Artist | 100% | WS-1 pipeline, shaders, optimization |
| Environment Artist | 100% | Tiles, location assembly |
| Character/Prop Artist | 100% | Sprites, equipment, portraits |
| VFX/UI Artist | 50% | Shared with WS-1/WS-2 |
| Systems Engineer | 100% | WS-2 implementation, WS-4 perf |
| Quest Engineer | 50% | WS-3 framework, WS-2 integration |
| Tech Lead | 50% | WS-4 lead, architecture, build |
| QA Lead | 50% | WS-5, automation, device lab |

---

## 8. Definition of Done (Stage D)

- [ ] Rustyard location: Exterior + 3 interiors, fully lit, navmeshed, populated
- [ ] 24 weapons, 21 ammo types, 18 armors — defined, sprited, balanced, equipped
- [ ] Combat: DT/DR, called shots, cover, burst, aimed, status effects, AI tactics
- [ ] 3 branching quests + capstone — all paths tested, consequences persist
- [ ] Pip-Boy UI complete: Stats, Inventory, Data, Map, Rad — diegetic, touch/gamepad
- [ ] 60 FPS sustained on Snapdragon 7 Gen 1 / A14, <300MB RAM, <5% battery/hr
- [ ] Save/Load <1s, versioned, crash reporting integrated
- [ ] Release AAB built, signed, uploaded to internal test track
- [ ] All 28+ automated tests pass in CI
- [ ] External playtest: "Feels like a real RPG" ≥ 4/5

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Author: Technical Director*  
*Status: APPROVED — Execution Authorized*