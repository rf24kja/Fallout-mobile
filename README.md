# Fallout 2 Reborn Mobile

A faithful mobile adaptation of the classic **Fallout 2** RPG, built with **Godot 4.7.2** for Android.

## Project Objective

Create a modern mobile version of Fallout 2 that preserves **100% of the original gameplay mechanics** while adding:
- Modern graphical presentation
- Mobile-optimized touch controls
- Performance optimizations for mobile devices
- Additional content extending the original foundation

## Current Development Status

| System | Status |
|--------|--------|
| Core SPECIAL System | ✅ Verified Original Fidelity |
| Character Creation | ✅ Implemented |
| Combat Mechanics (AP, DT/DR, Criticals) | ✅ Verified Original Fidelity |
| Inventory & Equipment | ✅ Implemented |
| NPC Interaction & Dialogue | ✅ Implemented |
| Quest System | ✅ Partial |
| World Map & Locations | ✅ Partial |
| Save/Load System | ✅ Implemented |
| Android Build | ✅ Working (Debug) |
| Touch Controls | ✅ Implemented |

**Latest Verified Android Build**: `builds/android/Fallout2_Reborn_Mobile_Debug.apk` (Commit `16a893b`)

## Quick Start

### Prerequisites
- **Godot 4.7.2** (standard or .NET version)
- **Android SDK** (API 31+)
- **Java 17+** (for Android export)
- **Original Fallout 2 installation** (for reference data only - not included)

### Opening the Project
1. Clone this repository
2. Open `Fallout2_Reborn_Mobile` in Godot 4.7.2
3. The project should load automatically

### Android Build
```bash
# From Godot Editor: Project → Export → Android → Export Project
# Or via command line (requires export templates):
godot --headless --export-release "Android" builds/android/Fallout2_Reborn_Mobile.apk
```

### Required Original Game Data
The original Fallout 2 installation is **NOT included** in this repository (copyright).
You need a legitimate copy of Fallout 2 for reference data:
- Location: `C:\Code\REA_FALLOUT\Fallout2` (configured in project settings)
- Used for: Reverse engineering reference, asset comparison, mechanics verification

## Development Tools

| Tool | Purpose |
|------|---------|
| **Godot 4.7.2** | Game engine |
| **REA (Reverse Engineering Assistant)** | Binary analysis of original Fallout 2 |
| **Ghidra** | Decompilation and reverse engineering |
| **ADB** | Android debugging and deployment |

## Project Structure

```
Fallout2_Reborn_Mobile/
├── project.godot              # Godot project configuration
├── export_presets.cfg         # Export settings (debug keystore included)
├── scenes/                    # Godot scenes (.tscn)
│   ├── ui/                   # UI scenes (main_menu, combat_hud, inventory, dialogue)
│   └── world/                # World scenes (test_map, locations)
├── scripts/                  # GDScript source code
│   ├── entities/             # Player, NPC, character entities
│   ├── systems/              # Combat, interaction, inventory, SPECIAL
│   └── ui/                   # UI controllers
├── assets/                   # Game assets
│   ├── characters/           # Character sprites, animations
│   └── ...
├── builds/                   # Build outputs (gitignored mostly)
├── docs/                     # Documentation
│   ├── PROJECT_MANDATE.md
│   ├── FALLOUT2_FIDELITY_MATRIX.md
│   ├── DEVELOPMENT_HISTORY.md
│   ├── RECOVERY_GUIDE.md
│   ├── PROJECT_STATE.md
│   └── NEXT_ACTIONS.md
├── AGENTS.md                 # Instructions for AI agents
└── .gitignore
```

## Key Documentation

| Document | Purpose |
|----------|---------|
| `AGENTS.md` | Permanent instructions for AI agents |
| `PROJECT_MANDATE.md` | Non-negotiable product requirements |
| `FALLOUT2_FIDELITY_MATRIX.md` | Mechanics verification matrix |
| `DEVELOPMENT_HISTORY.md` | Major milestones and decisions |
| `RECOVERY_GUIDE.md` | Project recovery from GitHub |
| `PROJECT_STATE.md` | Current verified status |
| `NEXT_ACTIONS.md` | Prioritized development queue |

## GitHub Repository

- **URL**: https://github.com/rf24kja/Fallout-mobile
- **Default Branch**: `main` (currently `master` locally)
- **Owner**: rf24kja

## Development Workflow

1. **Inspect** → Check current state, verify tests pass
2. **Implement** → Focused changes with fidelity verification
3. **Test** → Run unit tests, verify on Android device
4. **Commit** → Meaningful commit messages
5. **Push** → Sync to GitHub
6. **Verify** → Confirm remote state

## Fidelity Requirements

**NEVER** simplify or approximate original Fallout 2 mechanics if exact behavior can be verified via:
- REA binary analysis
- Ghidra decompilation
- Original game testing
- Existing verified implementations

Allowed improvements:
- Graphics, animations, visual effects
- Mobile UI/UX
- Performance optimizations
- New content (weapons, quests, locations) extending original foundation

## License

This project is for educational and preservation purposes. Original Fallout 2 assets and IP belong to their respective owners (Bethesda/Interplay). This repository contains only original code and assets created for this adaptation.

## Recovery

See `docs/RECOVERY_GUIDE.md` for complete project recovery instructions.