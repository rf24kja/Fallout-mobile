# Fallout 2 local data importer

Reads a **user-local, licensed** Fallout 2 installation and emits neutral JSON
that the Godot campaign engine may load at runtime. This is a *candidate*
import, not a verified conversion of the original game.

## License / safety (MANDATORY)

- The original Fallout 2 files are licensed user resources. **Never commit**
  extracted archives, `.msg`/`.pro`/`.map` contents, or generated JSON with
  game text into public GitHub.
- All extraction/output lands in `<project>/.local/`, which is in `.gitignore`.
- Only the Python source in this folder is tracked. The generated JSON stays
  on the user's machine and is attached locally at build/run time.
- No original file is modified. Source archives are read-only.

## What is decoded

| Module | Input | Output | Fidelity |
|---|---|---|---|
| `dat_reader.py` | `master.dat`, `critter.dat`, `patch000.dat` | extracted files | lossless (zlib/raw) |
| `msg_parser.py` | `*.msg` | `{id: text}` | lossless text |
| `pro_parser.py` | `*.pro` | pid, size, header words, raw prefix | partial (header only) |
| `map_parser.py` | `*.map`, `*.SAV` | map id/name, header words | partial (index only) |
| `import_all.py` | all above | 6 JSON + `manifest.json` | candidate |

Item/critter names and descriptions come from `pro_item.msg`/`pro_crit.msg`
(original numeric IDs preserved as `msg_id`). Quest titles/descriptions come
from `quests.msg` with the original region headers. Locations/maps are indexed
from the original `.map`/`.SAV` names. Dialog `.msg` files are indexed.

**Not decoded:** full `.pro` stat blocks, `.int`/`.ssl` script logic, `.map`
tile/object instances, FRM animation frames. Those require the complete FO2
binary specs and are tracked as limitations, not silently invented.

## Usage

```bash
# 1. Extract DAT archives (one-time, writes into gitignored .local/)
python tools/fallout2_import/dat_reader.py "/path/to/Fallout2/master.dat" .local/fallout2_master
python tools/fallout2_import/dat_reader.py "/path/to/Fallout2/critter.dat" .local/fallout2_critter
python tools/fallout2_import/dat_reader.py "/path/to/Fallout2/backup/rpu/patch000.dat" .local/fallout2_patch000

# 2. Import to neutral JSON (gitignored)
python tools/fallout2_import/import_all.py --source "/path/to/Fallout2" --verify
```

Output: `.local/generated/{items,critters,quests,locations,maps_index,dialog_index,manifest}.json`

`--verify` cross-checks recorded counts against the written JSON and confirms
the source archive SHA-256 hashes in `manifest.json`.

## Runtime attachment

The Godot campaign engine reads `.local/generated` **only when the user has
attached their own installation**. Without it, the engine degrades gracefully
to its built-in candidate dataset. No licensed text is embedded in tracked
GDScript/scene files.
