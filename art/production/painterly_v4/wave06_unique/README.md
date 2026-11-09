# RADZONE Wave 06 — unique-only art source candidates

**Three non-repeating subjects selected from 12 draft PNGs** to avoid duplicates in the project art catalog.

| File | Purpose |
|---|---|
| `sprites/field_binoculars.png` | Inventory hero illustration; binoculars |
| `sprites/mechanical_safe.png` | Single lootable world-object candidate |
| `sprites/field_cot.png` | Single field cot / bed world-object candidate |

All assets are **true RGBA PNG**, preserve source resolution and have SHA-256 and Git blob hashes in [manifest.json](./manifest.json). The source image sheet was not added because it contains nine already-represented subject types; a full list of exclusions is in the manifest.

**Art direction:** user-approved screenshots #2/#3, not rejected screenshot #1; no Runway/Railway. The black preview area is not a black image background: all three PNGs have transparent alpha.

**Status:** `SOURCE_DRAFT / HUMAN ART QA REQUIRED`. Crops are not proven Godot sprites. OpenCode should check alpha holes, pivots, collisions and game item ID mapping before using them in a scene. Do not replace working game textures automatically.

Source package retained in the conversation: `RADZONE_WAVE06_12_RGBA_APPROVED_STYLE_DRAFT.zip`. All nine duplicates have been excluded from publication in this wave.
