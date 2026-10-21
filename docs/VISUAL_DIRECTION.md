# Visual Direction — Gritty Cinematic Isometric Post-Apocalypse

## Purpose

Define the **coherent art direction** for our original product. Every visual decision must serve: *decay, survival, scarcity, danger, believability*.

**Target**: Modern cinematic isometric RPG — not retro pixel art, not stylized mobile cartoon.

---

## 1. Art Direction Statement

### 1.1 Core Aesthetic
> **"The world ended, but the dust keeps settling. Everything is worn, repaired, repurposed. Nothing is clean. Nothing is new. Beauty exists only in survival."**

### 1.2 Keywords
| Primary | Secondary | Avoid |
|---------|-----------|-------|
| Gritty | Atmospheric | Cartoon |
| Cinematic | Textured | Toy-like |
| Decayed | Weathered | Saturated/Neon |
| Functional | Lived-in | Clean UI |
| Heavy | Grounded | Floating numbers |

### 1.3 Reference Touchstones (Mood, Not Copy)
- **Fallout 1/2** — Isometric framing, muted palette, world reactivity
- **Disco Elysium** — Painterly textures, mood lighting, UI as diegetic
- **Wasteland 3** — Tactical clarity, environmental storytelling
- **This War of Mine** — Desperation, scarcity, moral weight
- **Stalker (games)** — Anomaly, danger, Zone atmosphere
- **Mad Max: Fury Road** — Repurposed materials, sun-bleached, dust

---

## 2. Color Palette

### 2.1 World Palette (Environment)
| Role | Hex | Usage |
|------|-----|-------|
| **Dust Base** | #3D3630 | Ground, walls, dominant |
| **Rusted Iron** | #5D4E37 | Metal, structures, vehicles |
| **Dried Blood** | #4A2C2A | Accent, danger zones, stains |
| **Sun-Bleached Bone** | #C9C0B8 | Highlights, edges, UI text |
| **Sickly Green** | #4A5D3A | Radiation, mutants, anomalies |
| **Cold Steel** | #6B7B8D | Tech, vaults, pre-war |
| **Fire Ember** | #C46A2E | Light sources, energy weapons |
| **Night Sky** | #1A1A2E | Night, shadows, UI dark mode |
| **Warning Red** | #8B2635 | UI alerts, hostile, critical |
| **Terminal Green** | #3A7D44 | UI success, friendly, terminals |

### 2.2 UI Palette (Diegetic)
| Element | Hex | Notes |
|---------|-----|-------|
| **Pip-Background** | #1A1A1A | Near-black, paper texture |
| **Pip-Text** | #E8DCC8 | Warm off-white, readable |
| **Pip-Accent** | #C46A2E | Amber/orange — active, selected |
| **Pip-Dim** | #6B5B4A | Inactive, disabled |
| **Pip-Warning** | #8B2635 | Critical, low HP, rad |
| **Pip-Safe** | #3A7D44 | Healed, friendly, ok |

**Rule**: UI looks like a **physical device** — scratched screen, worn buttons, tape on edges.

---

## 3. Lighting & Atmosphere

### 3.1 Lighting Model
- **Global**: Directional sun (harsh, high contrast) + ambient sky (cool, fill)
- **Local**: Point lights (fires, lamps, energy) + emissive (screens, glowing tech)
- **Shadows**: Hard sun shadows, soft local shadows, contact shadows on ground
- **Volumetric**: Dust motes in sun shafts, fog in low areas, radiation haze

### 3.2 Time of Day
| Time | Sun Angle | Color Temp | Shadows | Gameplay |
|------|-----------|------------|---------|----------|
| **Dawn** | Low, long | Cool blue → warm | Very long | Stealth bonus, cold |
| **Day** | High | Neutral white | Short, harsh | Normal, max visibility |
| **Dusk** | Low, long | Warm orange → red | Very long | Stealth bonus, predators |
| **Night** | None | Cool blue (moon) | None (ambient) | Torch/night vision needed, dangerous |

### 3.3 Weather
- **Clear** — Standard
- **Dust Storm** — Reduced visibility, sand accumulation, radiation spike
- **Acid Rain** — Damages exposed, corrodes gear, rare
- **Rad Fog** — Green tint, constant rad gain, mutants active

---

## 4. Environment Art

### 4.1 Tile System (Isometric)
**Grid**: 2:1 isometric (64×32px base tile at 1x, rendered at 2x for retina = 128×64)

| Tile Category | Variants | Details |
|---------------|----------|---------|
| **Ground** | Dirt, cracked asphalt, sand, concrete, metal grating, radiation | 8+ variants each, seamless |
| **Walls** | Concrete, brick, metal sheet, wood, chainlink, vault door | 16+ variants, damage states |
| **Floors** | Tile, wood, metal, grating, dirt, blood-stained | Interior variants |
| **Props** | Debris piles, crates, barrels, bodies, wreckage, terminals | Modular, physics-enabled |
| **Foliage** | Dead shrubs, tumbleweeds, mutated cactus, dry grass | Wind animation |

### 4.2 Material Definition (PBR-lite)
| Material | Albedo | Roughness | Metalness | Normal | Emissive |
|----------|--------|-----------|-----------|--------|----------|
| **Rusted Metal** | Dark orange-brown | 0.9 | 0.7 | Pitted, flaking | None |
| **Clean Metal** | Gray | 0.3 | 1.0 | Smooth, scratches | Screen/light |
| **Concrete** | Gray-beige | 0.95 | 0.0 | Cracks, aggregate | None |
| **Painted Concrete** | Faded color | 0.85 | 0.0 | Peeling paint | None |
| **Wood** | Gray-brown | 0.8 | 0.0 | Grain, splinters | None |
| **Fabric/Leather** | Muted tones | 0.9 | 0.0 | Weave, stitching | None |
| **Plastic/Rubber** | Black/dark | 0.7 | 0.0 | Mold seams | None |
| **Glass** | Transparent | 0.1 | 0.0 | Cracks, dirt | None |
| **Energy** | N/A | N/A | N/A | N/A | Cyan/amber pulse |

### 4.3 Decal System
- **Blood splatter** — Combat aftermath, fades over time
- **Bullet holes** — Wall/floor, directional
- **Scorch marks** — Energy weapons, explosions
- **Radiation stain** — Green glow, pulsing
- **Graffiti** — Faction marks, warnings, names
- **Oil/fuel stains** — Ground, reflective

---

## 5. Character & Creature Art

### 5.1 Human Proportions
- **Style**: Semi-realistic, 7.5 heads tall
- **Silhouette**: Recognizable at 64px height
- **Gear**: Layered — base body + armor pieces + weapon + accessories
- **Animation**: 8-directional isometric (idle, walk, run, aim, shoot, melee, hit, death, interact)

### 5.2 Armor Visual Tiers
| Tier | Visual Language | Materials |
|------|-----------------|-----------|
| **1 — Scavenger** | Layered rags, duct tape, found objects | Cloth, leather, scrap metal |
| **2 — Settler** | Purpose-made leather, metal plates on vital areas | Hardened leather, steel |
| **3 — Professional** | Unified design, ceramic-polymer, sealed joints | Combat polymer, ceramic |
| **4 — Power Armor** | Exoskeleton frame, servos, sealed environment | Titanium, composite, fusion core glow |

### 5.3 Weapon Visual Identity
| Class | Silhouette | Key Details |
|-------|------------|-------------|
| **Sidearm** | Compact, one-hand grip | Slide, hammer, magazine visible |
| **SMG** | Boxy, vertical grip, suppressor mount | Folding stock, selector switch |
| **Shotgun** | Tubular, pump/break action | Shell ejection, choke |
| **Rifle** | Long barrel, bipod mount | Scope rail, bolt/charging handle |
| **Heavy** | Bulky, belt feed, bipod | Heat shroud, ammo box |
| **Energy** | Angular, glowing chamber | Capacitor coils, vent ports |
| **Melee** | Distinct profile | Edge wear, grip tape, balance |

### 5.4 Creature Design
- **Mutated Fauna** — Recognizable base animal + radiation distortion (extra limbs, chitin, glow)
- **Robots** — Industrial → Military → Experimental progression
- **Abominations** — Horrific, asymmetrical, wrong — used sparingly for horror beats

---

## 6. UI/UX Visual Design

### 6.1 Diegetic UI Philosophy
**The interface IS a device in the world.** Pip-Boy, terminal, holotape, map — all physical objects.

### 6.2 Screen Layouts

#### 6.2.1 Pip-Boy (Main Menu)
```
┌─────────────────────────────────────┐
│  ████████  VAULT-TEC  ████████       │  ← Scratched bezel
│  ┌─────────────────────────────┐    │
│  │  STATS  INV  DATA  MAP  RAD  │    ← Physical buttons
│  ├─────────────────────────────┤    │
│  │                             │    │
│  │      [CONTENT AREA]         │    │  ← Green phosphor CRT
│  │                             │    │     scanlines, curvature
│  ├─────────────────────────────┤    │
│  │  HP: ████████░░  RAD: ██░░░░░ │    │  ← Bar meters
│  │  AP: ██████████  LVL: 12     │    │
│  └─────────────────────────────┘    │
└─────────────────────────────────────┘
```

#### 6.2.2 Combat UI
- **AP Meter**: Circular, center-bottom — segments = AP, highlighted = available
- **Action Radial**: Long-press on target → 8-slice pie (Aim Head/Torso/Arms/Legs, Burst, Reload, Move, Item)
- **Combat Log**: Slide-up panel, filterable (Damage/Effects/All), timestamped
- **Target Preview**: Hover enemy → shows hit%, damage range, body part modifiers

#### 6.2.3 Inventory
- **Paperdoll**: Center, 3D model or high-res 2D render
- **Grid**: Right side, weight bar at bottom
- **Item Cards**: Physical card metaphor — worn corners, type icon, weight/value
- **Drag-Drop**: Tactile, snap-to-slot, haptic feedback

#### 6.2.4 Dialogue
- **Portrait**: Left, animated (breathing, blink, expression)
- **Text**: Typewriter effect, readable font, high contrast
- **Options**: Vertical list, skill tags in accent color, hovered = highlight
- **History**: Scroll-up button, searchable

### 6.3 Typography
| Use | Font | Style |
|-----|------|-------|
| **UI Headers** | Monospace (VT323 / Custom) | All caps, tracking +50 |
| **Body Text** | Sans (Inter / Roboto Mono) | 14-16pt, line-height 1.5 |
| **Numbers/Stats** | Monospace (JetBrains Mono) | Tabular figures |
| **Diegetic Labels** | Stencil / Military | Weathered, painted look |

---

## 7. Visual Effects

### 7.1 Combat FX
| Effect | Style | Performance |
|--------|-------|-------------|
| **Bullet Impact** | Spark + dust puff + decal | Particle, <5ms |
| **Energy Impact** | Plasma splash + screen shake + EMP pulse | Shader, <8ms |
| **Explosion** | Fireball + shockwave ring + debris | Particle + mesh, <15ms |
| **Blood** | Directional spray + pool decal | Particle + decal |
| **Crit Flash** | Time slow (0.1s) + chromatic aberration | Post-process |

### 7.2 Environmental FX
- **Dust motes** — Sun shafts, density by weather
- **Heat shimmer** — Near fires, engines, day
- **Rad glow** — Green pulse, screen vignette when high
- **Screen damage** — Crack overlay when low HP (optional)

---

## 8. Technical Art Pipeline

### 8.1 Asset Specifications
| Asset Type | Format | Resolution | Poly/Texture Budget |
|------------|--------|------------|---------------------|
| **Tile Textures** | PNG (atlas) | 256×256 base | 64 tiles/atlas |
| **Character Sprites** | PNG (atlas) | 256×512 per frame | 8 dirs × 8 anims × 8 frames |
| **Weapon Sprites** | PNG (atlas) | 128×128 | 8 rotations |
| **UI Panels** | PNG (9-slice) | 512×512 | Vector preferred |
| **Portraits** | PNG | 512×512 | Painted style |
| **VFX Textures** | PNG (atlas) | 128×128 | Flipbook 16-32 frames |

### 8.2 Blender → Godot Pipeline
```
Blender Scene
  ├── Isometric Camera (35.264° elevation, 45° azimuth)
  ├── Render Layers: Albedo, Normal, Roughness, Depth, Emissive
  ├── Animation: Action Editor (named actions)
  └── Export: PNG sequences via Python script
        ↓
TexturePacker / Custom Atlas Builder
  ├── Pack into atlases (2048×2048 max)
  ├── Generate .atlas metadata (frame rects, pivot points)
  └── Output: .png + .tres (Godot AtlasTexture)
        ↓
Godot Import
  ├── AnimatedSprite3D / AnimatedSprite2D
  ├── ShaderMaterial for PBR-lite
  └── VisualShader for palette swap (faction colors)
```

### 8.3 Shader Strategy
- **Single Uber-Shader** for world: Albedo + Normal + Roughness + Emissive + Palette Swap
- **Palette Swap**: 4-color ramp texture → faction/weather variants at runtime
- **Outline/Selection**: Sobel on depth + normal, colored by team
- **Day/Night**: Global uniform → lerp between day/night color grades

---

## 9. Production Roadmap

### Phase 1: Foundation (Week 1-2)
- [ ] Tile set: Ground (8), Walls (8), Props (20) — textured, atlased
- [ ] Character base: Male/Female, 8-dir walk/idle, paperdoll layers
- [ ] Pip-Boy UI: Framework, stats screen, inventory grid
- [ ] Shader: Uber-shader + palette swap working

### Phase 2: Combat Visuals (Week 2-3)
- [ ] Weapon sprites: 6 classes × 4 tiers = 24 weapons
- [ ] Combat FX: Impacts, muzzle flashes, energy effects
- [ ] Combat UI: AP radial, target preview, log
- [ ] Armor on paperdoll: 4 tiers visible

### Phase 3: Polish & Atmosphere (Week 3-4)
- [ ] Lighting: Time of day, volumetric dust, weather
- [ ] Decals: Blood, bullets, scorch, rad
- [ ] Portraits: 10 NPCs, painted style
- [ ] Sound sync: Footsteps, weapon Foley, UI clicks

### Phase 4: Vertical Slice Location (Week 4-5)
- [ ] **The Rustyard** — Scrap settlement, 3 interiors, 2 combat zones
- [ ] Navmesh, encounter zones, loot placement
- [ ] Quest integration: 3 quests playable in location
- [ ] Performance: 60 FPS on Snapdragon 7 Gen 1 / A14

---

## 10. Art Bible — Quick Reference

| DO | DON'T |
|----|-------|
| ✅ Weathered, scratched, dirty textures | ❌ Clean, pristine, plastic look |
| ✅ Muted earth tones + selective accent | ❌ Rainbow, neon, high saturation |
| ✅ Hard shadows, strong contrast | ❌ Flat lighting, no shadows |
| ✅ Physical UI (buttons, screens, wear) | ❌ Flat HUD, floating icons |
| ✅ Recognizable silhouettes at small size | ❌ Detail noise at 64px |
| ✅ Diegetic reasoning for every UI element | ❌ "Gamey" abstractions |
| ✅ Weight, mass, material honesty | ❌ Floaty, weightless movement |
| ✅ Cohesive palette across all assets | ❌ Asset-by-asset color decisions |

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Author: Art Director*  
*Status: DESIGN COMPLETE — Pipeline Setup Next*