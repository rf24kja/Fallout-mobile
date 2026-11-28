# Campaign Engine Status

Status: implemented, headless-tested with synthetic fixtures; **not a complete
Fallout 2 campaign on its own**. This document describes what the new layer
does, the JSON contract it consumes, and what still requires the original
licensed data.

## What the engine does

The campaign engine is an adapter layer that lets the existing Godot project
consume data produced by the separate Fallout 2 importer
(`tools/fallout2_import/`, GITIGNORED output). It integrates with the existing
autoloads and does NOT replace them:

- `scripts/campaign/campaign_loader.gd` (`CampaignLoader`, RefCounted) — reads
  the 7 importer JSON files from `res://.local/generated/`,
  `user://fallout2_data/` or an explicit path. Accepts top-level arrays or
  `{records:[...]}` / `{data:[...]}` wrappers, normalizes field-name variants
  (`id`/`pid`/`proto_id`, `name`/`title`, `description`/`desc`/`text`/`message`,
  `map`/`map_file`/`source`, `exits`/`connections`, `npcs`/`critters`). Missing
  or malformed files are skipped without error spam. Exposes `load_all()`,
  `has_original_data()`, `get_summary()` and static `normalize_record()`.
- `scripts/campaign/world_map.gd` (`WorldMap`, Node) — builds an undirected
  travel graph of locations, exposes `get_location`/`get_all_locations`/
  `get_exits`/`can_travel`/`travel_to`. Travel sets `GameManager.current_map`,
  emits `location_reached` on EventBus (registered as a user signal because
  the current `scripts/core/event_bus.gd` does not declare it), advances time,
  updates `world_state`, and persists via `get_save_data`/`load_save_data`.
- `scripts/campaign/location_scene.gd` (`LocationScene`, Node2D) — builds a
  playable 2D scene from flexible map data: ground ColorRect, collision
  boundary, player spawn, marker nodes for tiles/scenery/critters/items, and
  interactive exit areas that call `WorldMap.travel_to`. Headless-safe; no
  textures or renderer dependency.
- `scripts/campaign/campaign_quests.gd` (`CampaignQuests`, RefCounted) —
  converts imported quest records into `QuestManager._quests` definitions with
  real `ObjectiveType` objectives, hidden stages, branching choices, rewards
  and failure conditions. Registers nothing when no data is supplied.
- `scripts/campaign/campaign_dialogues.gd` (`CampaignDialogues`, RefCounted) —
  builds `DialogueNode`/`DialogueOption`/`DialogueCondition`/
  `DialogueConsequence` chains from imported msg lines and inserts them into
  `DialogueManager._dialogues`. Registers nothing when no data is supplied.
- `scripts/campaign/campaign_root.gd` + `scenes/campaign/campaign_root.tscn` —
  composition root that wires the layer together and SOFT-loads
  `res://scenes/ui/mobile_controls.tscn` only if it exists (avoids a hard
  dependency while that scene is authored in parallel).
- `scripts/tests/test_campaign_engine.gd` — headless SceneTree test using
  synthetic fixtures only, with cleanup.

## JSON schema contract

All files are optional; an empty directory yields `available=false` with empty
arrays and no errors.

| File | Shape |
|------|-------|
| `items.json` | array or `{records:[...]}` of `{id, name, type, ...}` |
| `critters.json` | array of `{id, name, ...}` |
| `quests.json` | array or `{data:[...]}` of `{id, title, description, stages:[{id,type,target,text,count,hidden}], choices:[...], rewards:{xp,money,items,reputation}, failure_conditions:[...]}` |
| `locations.json` | array of `{id, name, region, map/map_file/source, exits:[id], npcs/critters:[id], items:[id], enemies:[id], requires/gates, travel_hours, is_interior}` |
| `maps_index.json` | array of `{id, width, height, tiles, critters, items, scenery, exits}` |
| `dialog_index.json` | array of `{id, lines/nodes:[{id, speaker, text/message, conditions:[...], options:[{text, next, consequences:[...]}]}]}` |
| `manifest.json` | object with source/version metadata |

Field-name aliases are normalized defensively; unknown keys are preserved.
Synthetic test fixtures use obviously fake names ("TEST LOCATION A/B/C",
"TEST QUEST ...") and are deleted after the test.

## What still requires the original licensed data

The engine is a *consumer*. It cannot invent a campaign, and it deliberately
contains **no original Fallout 2 text**:

- Original dialogue text and branching come from compiled `.int` dialogue
  scripts. Those must be decoded by the importer into `dialog_index.json`
  before any real dialogue appears in-game. Original voice/audio is not
  handled here.
- Full `.pro` prototype stat blocks (weapons, armor, critters, items) are
  needed for authentic balance. The adapter only maps ids and fields; it does
  not reconstruct stats.
- Quest stage text, givers, and reputation consequences must come from the
  original `quests.msg`/`scripts` extracted by the importer.
- Map binary (`.map`) geometry, tile art indexes, and placed critters/items
  require the importer's binary parsing to populate `maps_index.json` and any
  dedicated map JSON. Only then do `LocationScene` markers reflect real maps.

## Honest limitation

**This engine alone does not make a complete Fallout 2 campaign.** It provides
the data plumbing (loading, travel graph, scene assembly, quest/dialogue
registration) but depends entirely on the importer for original content and on
the pre-existing systems for combat, inventory, skills, and UI. Until the
licensed data is imported and validated against the original game, the engine
runs with synthetic or empty data and the result is a framework, not a
playable original campaign.
