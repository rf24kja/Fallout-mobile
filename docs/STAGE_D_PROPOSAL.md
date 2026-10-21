# Stage D: Modern Isometric Graphics & World Expansion

## Overview

Transform the verified gameplay vertical slice into a visually compelling, modern isometric RPG with original world content. Build on the stable Stage C.5 foundation (28/28 tests passing, Android API 36 compliant).

## Technical Architecture

### 1. Isometric Rendering Pipeline

```
World Coordinates (X, Y, Z) → Isometric Projection → Screen Coordinates
                              ↓
                    Tile-based Rendering (Z-ordered)
                              ↓
                    Lighting Pass (normal maps + ambient)
                              ↓
                    Post-processing (bloom, color grading)
```

**Key Decisions:**
- **Projection**: 2:1 dimetric (classic Fallout angle) — `screen_x = (world_x - world_y) * tile_width/2`, `screen_y = (world_x + world_y) * tile_height/2 - world_z * tile_height`
- **Tile Size**: 128×64 px base (scales to 256×128 @ 2x, 512×256 @ 4x for high-DPI)
- **Layers**: Ground → Objects → Characters → Effects → UI (each with Z-sorting)
- **Culling**: Frustum culling + chunk-based loading (32×32 tile chunks)

### 2. Tile System

```
TileSet (Resource)
├── Terrain Tiles (grass, sand, concrete, metal, radiation)
├── Transition Tiles (blends between terrain types, 16 variants)
├── Object Tiles (walls, furniture, debris, props)
├── Decal Tiles (cracks, stains, blood, scorch marks)
└── Animated Tiles (water, fire, radiation glow, vents)
```

**Format**: `.tres` TileSet with AtlasTexture regions from packed texture atlases (2048×2048 max).
**Variants**: Weighted random selection for organic variation.
**Collision**: Separate collision layer per tile (navigation polygon baked at runtime).

### 3. Character Visual Pipeline

```
Base Mesh (modular: torso, legs, arms, head)
    ↓
Equipment Slots (weapon, armor, helmet, backpack)
    ↓
Material Overrides (faction colors, wear states)
    ↓
Animation Controller (state machine: idle, walk, run, attack, hit, death, interact)
    ↓
Sprite Sheet Export (8 directions × N frames) → Texture Atlas
```

**Specifications:**
- **Base Resolution**: 128×256 px per frame (scales to 256×512 @ 2x)
- **Directions**: 8-way (N, NE, E, SE, S, SW, W, NW) for smooth rotation
- **Frame Counts**: Idle 8, Walk 8, Run 6, Attack 6, Hit 3, Death 8, Interact 6
- **Total Frames/Character**: ~47 frames × 8 dirs = 376 sprites → packed in 2048×2048 atlas
- **Modular Parts**: 5 slots (head, torso, legs, weapon, accessory) with color masks

### 4. Lighting System

```
Static Lightmaps (baked offline) → Runtime Ambient + Dynamic Lights
                                        ↓
                              Normal Maps on Tiles/Characters
                                        ↓
                              Screen-space Ambient Occlusion (optional)
                                        ↓
                              Tone Mapping + Color Grading
```

**Implementation:**
- **Static**: Baked lightmaps for interiors/large structures (Godot LightmapGI)
- **Dynamic**: Point lights for fires, lamps, muzzle flashes (max 16 simultaneous)
- **Ambient**: Time-of-day gradient + weather modulation
- **Normal Maps**: Generated from height maps (sprite normal mapping)

### 5. World Structure

```
World (Resource)
├── Regions (large areas: Arroyo, Den, Modoc, Vault City, etc.)
│   ├── Maps (individual scenes: town, exterior, dungeon)
│   │   ├── TileMap (ground layer)
│   │   ├── TileMap (object layer)
│   │   ├── NavigationMesh (baked)
│   │   ├── Spawn Points (NPCs, loot, encounters)
│   │   └── Triggers (zone transitions, quests)
│   └── World State (flags, reputation, dynamic events)
└── Global Systems (time, weather, random encounters)
```

**Original Locations (Priority Order):**
1. **Starting Vault** — Tutorial + character creation
2. **Arroyo** — Tribal village (quest hub)
3. **Wasteland** — Overworld map with random encounters
4. **The Den** — Trading post (combat arena, quests)
5. **Modoc** — Farming town (branching questlines)
6. **Vault City** — High-tech faction (endgame area)

### 6. Animation System

```
AnimationPlayer (per character) → AnimationTree (blend tree)
    ↓
State Machine (parameters: speed, direction, action, health)
    ↓
Blending: Idle↔Walk↔Run (1D blend), Attack overlay, Hit reaction
    ↓
Directional Blending (8-way sprite selection via shader)
```

**Shader-based Directional Sprites:**
```glsl
// Fragment shader selects correct sprite from atlas based on view angle
vec2 atlas_uv = calculate_atlas_uv(frame_index, direction_index);
color = texture(sprite_atlas, atlas_uv);
```

### 7. Texture Atlas Strategy

| Atlas | Contents | Size | Format |
|-------|----------|------|--------|
| `tiles_terrain` | Ground tiles + transitions | 2048×2048 | ETC2_RGBA |
| `tiles_objects` | Props, walls, furniture | 2048×2048 | ETC2_RGBA |
| `tiles_decals` | Overlays, effects | 1024×1024 | ETC2_RGBA |
| `chars_base` | Base character sprites | 2048×2048 | ETC2_RGBA |
| `chars_equip` | Armor/weapon overlays | 2048×2048 | ETC2_RGBA |
| `effects` | Particles, impacts, spells | 1024×1024 | ETC2_RGBA |
| `ui` | Icons, buttons, panels | 1024×1024 | ETC2_RGBA |

**Total VRAM**: ~48 MB (compressed) — well within mobile budgets.

### 8. Weather & Environmental Effects

| Effect | Technique | Performance |
|--------|-----------|-------------|
| **Rain** | GPU particle system (1000 particles) | Low |
| **Radiation Storm** | Screen shader + particle dust | Medium |
| **Fog** | Exponential height fog (shader) | Low |
| **Heat Haze** | Distortion shader (distance-based) | Medium |
| **Day/Night** | Time-of-day color grading LUT | None |

### 9. Graphics Quality Settings

| Setting | Low | Medium | High | Ultra |
|---------|-----|--------|------|-------|
| Texture Resolution | 0.5x | 1x | 1x | 2x |
| Shadow Quality | Off | PCF 16 | PCF 32 | VSM |
| Particle Count | 25% | 50% | 100% | 200% |
| Post-processing | Off | Bloom | Bloom+AO | Full |
| Animation FPS | 15 | 30 | 30 | 60 |
| View Distance | 8 chunks | 12 chunks | 16 chunks | 24 chunks |

### 10. Art Direction Guidelines

- **Color Palette**: Muted earth tones (ochre, rust, olive, slate) + accent colors per faction
- **Style**: Semi-realistic with stylized proportions (readable at small screen sizes)
- **Lighting**: Harsh wasteland sun → deep shadows, high contrast; interior = warm artificial
- **Detail Level**: Readable silhouettes at 64px height; facial features only on portraits
- **Consistency**: Shared material library; modular kitbashing for rapid iteration

## Implementation Phases

### Phase D1: Core Rendering (Week 1-2)
- [ ] Isometric camera + projection math
- [ ] TileMap-based rendering with Z-sorting
- [ ] Texture atlas pipeline (import → pack → export)
- [ ] Basic tile set (terrain + 2 transitions)

### Phase D2: Character Visuals (Week 2-3)
- [ ] Modular character base mesh + export pipeline
- [ ] 8-direction sprite sheet generation (Blender → Godot)
- [ ] Animation state machine + blending
- [ ] Equipment overlay system

### Phase D3: Lighting & Atmosphere (Week 3-4)
- [ ] LightmapGI setup for interiors
- [ ] Dynamic light system (pooled)
- [ ] Time-of-day + weather controller
- [ ] Normal map generation pipeline

### Phase D4: World Content (Week 4-6)
- [ ] Starting Vault (tutorial map)
- [ ] Arroyo (quest hub)
- [ ] Wasteland overworld + random encounters
- [ ] The Den (combat arena)
- [ ] Modoc (branching quests)

### Phase D5: Polish & Optimization (Week 6-7)
- [ ] Texture atlas optimization
- [ ] Quality settings implementation
- [ ] Mobile GPU profiling (Adreno, Mali, Apple GPU)
- [ ] Memory budget enforcement

## Risks & Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Tile Z-sorting artifacts | High | Visual glitches | Y-sort + layer offsets; test edge cases |
| Atlas packing failures | Medium | Build breaks | Automated validation in CI |
| Mobile GPU VRAM exceeded | Medium | Crashes | Quality settings + texture streaming |
| Animation blending pops | High | Visual quality | Crossfade curves; foot IK |
| Content scope creep | High | Schedule slip | Fixed location list; MVP first |

## Dependencies

- **Godot 4.7.2** (current) — TileMap, LightmapGI, AnimationTree, RenderingServer
- **Blender 4.0+** — Character rigging, isometric rendering, sprite sheet baking
- **TexturePacker / Godot Atlas** — Atlas generation
- **ASEprite / Krita** — Pixel art touch-ups

## Success Criteria

1. **Visual Parity**: Screenshots indistinguishable from modern isometric RPGs (Disco Elysium, Baldur's Gate 3 top-down)
2. **Performance**: 60 FPS on Snapdragon 7 Gen 1 / Dimensity 8100 equivalent
3. **Memory**: < 400 MB VRAM + RAM on High settings
4. **Content**: 5 original locations playable with quests
5. **Art Consistency**: Single art director approval on all assets

## Next Immediate Actions

1. **Week 1**: Set up Blender isometric camera rig + test render pipeline
2. **Week 1**: Create first terrain tile set (grass, dirt, concrete) + transitions
3. **Week 1**: Implement isometric camera controller in Godot (touch drag, pinch zoom)
4. **Week 2**: Modular character base → sprite sheet export test
5. **Week 2**: Integrate first animated character into test map

---
*Proposal Version: 1.0*  
*Date: 2026-10-21*  
*Based on: Stage C.5 verified build (28/28 tests, API 36, arm64)*