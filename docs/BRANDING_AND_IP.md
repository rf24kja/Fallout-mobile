# Branding and Intellectual Property

## Current Status

This project is a **personal learning/experimentation project** reverse-engineering Fallout 2 mechanics for mobile platforms using Godot 4.7.2. It is **not affiliated with, endorsed by, or licensed from** Bethesda Softworks, Microsoft, or any rights holders of the Fallout franchise.

## Development Identity

- **Package ID**: `asia.go24.wastelandprototype` (temporary, internal use only)
- **App Label**: "Wasteland RPG Prototype" (neutral working title)
- **Project Name**: "Wasteland_RPG_Prototype"

## Original Game References

The following are used **internally only** for research and reverse-engineering reference:
- Fallout 2 game files (`C:\Code\REA_FALLOUT\Fallout2\`) - READ-ONLY
- Game mechanics, formulas, stats, items, dialogue, maps
- No original assets (art, audio, text) are copied into this project

## Distributable Builds

**No distributable builds currently exist.**

Before any public distribution:
1. All Fallout-specific branding must be removed
2. Original mechanics must be reimplemented as original systems (not direct copies)
3. Original art/audio/text must be replaced with original or licensed content
4. Legal review required for any public release

## Remaining Issues

| Item | Status | Notes |
|------|--------|-------|
| Package ID | Temporary | `asia.go24.wastelandprototype` - internal only |
| App Label | Neutral | "Wasteland RPG Prototype" - no Fallout branding |
| Game Title | Neutral | "Wasteland RPG Prototype" in project.godot |
| Mechanics | Reimplemented | Core systems (SPECIAL, combat, dialogue) reimplemented from reverse-engineered formulas |
| Assets | Placeholder | 1x1 PNG icons, no original Fallout art |
| Text Content | Original | Dialogue, item names, descriptions are original |

## Migration Notes

Changing the package ID from `com.fallout2.reborn.mobile` to `asia.go24.wastelandprototype`:
- **Breaks save data continuity** - Android treats different package IDs as different apps
- Existing installs with old package ID will not receive updates
- Users would need to manually backup/restore saves if migrating
- No automatic migration path exists

This is acceptable for a prototype/pre-alpha project with no public users.

## Recommendation

Keep current neutral identity until:
- Core gameplay loop is stable and fun
- Original art/assets are created or licensed
- Legal clearance obtained for any public distribution
- Project scope and direction are finalized

Then consider a permanent, unique brand identity.