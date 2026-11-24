#!/usr/bin/env python3
"""Import locally available Fallout 2 data into the project's neutral JSON.

All output goes to <project>/.local/generated/ — GITIGNORED. This script
NEVER writes licensed content into tracked files and never touches the game
source. The Godot campaign engine reads these files at runtime only when the
user has locally attached their own Fallout 2 installation.

Usage:
  python tools/fallout2_import/import_all.py --source <fallout2_dir> [--verify]
  python tools/fallout2_import/import_all.py --verify   # verify existing output
"""
import argparse
import gzip
import hashlib
import json
import re
import sys
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from msg_parser import parse as parse_msg            # noqa: E402
from pro_parser import parse_dir as parse_pro_dir    # noqa: E402
from map_parser import parse as parse_map            # noqa: E402

MASTER_LOCAL = Path(".local/fallout2_master")
CRITTER_LOCAL = Path(".local/fallout2_critter")
PATCH_LOCAL = Path(".local/fallout2_patch000")


def sha256(p):
    h = hashlib.sha256()
    with open(p, "rb") as f:
        for chunk in iter(lambda: f.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest()


def write_json(path, obj):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(obj, indent=1, ensure_ascii=False), encoding="utf-8")


def section_of(line, current):
    """Track '# <Region> Quests' section headers in quests.msg."""
    m = re.match(r"#\s*(.+?)\s+Quests", line, re.I)
    return m.group(1).strip() if m else current


def import_items(master, out):
    p = master / "text/english/game/pro_item.msg"
    msgs = parse_msg(p) if p.exists() else {}
    # Convention: even id = name, odd id = description of the preceding item.
    items = []
    for mid in sorted(msgs):
        if mid % 2 == 0 and (mid + 1) in msgs:
            items.append({
                "id": "item_msg_%d" % mid,
                "msg_id": mid,
                "name": msgs[mid],
                "description": msgs[mid + 1],
                "pid": None,
                "stats": {},
            })
    pro_files = []
    for base in (PATCH_LOCAL / "Proto/Items", master / "proto/Items"):
        if base.exists():
            pro_files += parse_pro_dir(base, "*.pro") + parse_pro_dir(base, "*.PRO")
    # Cross-reference prototypes by numeric PID when msg ids align.
    by_pid = {p["pid"]: p for p in pro_files if p["pid"] is not None}
    for item in items:
        pid = item["msg_id"] // 100
        if pid in by_pid:
            item["pid"] = pid
            item["proto"] = by_pid[pid]
    return items


def import_critters(master, out):
    p = master / "text/english/game/pro_crit.msg"
    msgs = parse_msg(p) if p.exists() else {}
    critters = []
    for mid in sorted(msgs):
        if mid % 2 == 0 and msgs[mid]:
            critters.append({
                "id": "critter_msg_%d" % mid,
                "msg_id": mid,
                "name": msgs[mid],
                "description": msgs.get(mid + 1, ""),
                "proto": None,
            })
    pro_files = []
    for base in (PATCH_LOCAL / "Proto/Critters", master / "proto/Critters"):
        if base.exists():
            pro_files += parse_pro_dir(base, "*.pro")
    by_pid = {p["pid"]: p for p in pro_files if p["pid"] is not None}
    for c in critters:
        pid = c["msg_id"] // 100
        if pid in by_pid:
            c["proto"] = by_pid[pid]
    return critters


def import_quests(master, out):
    p = master / "text/english/game/quests.msg"
    if not p.exists():
        return []
    text = p.read_bytes().decode("latin1")
    region = "Unknown"
    quests = []
    for line in text.splitlines():
        s = line.strip()
        if s.startswith("#") and not s.startswith("##"):
            region = section_of(s, region)
        m = re.match(r"\{(\d+)\}\{\}\{(.+)\}", s)
        if m:
            desc = m.group(2).strip()
            quests.append({
                "id": "quest_msg_%s" % m.group(1),
                "msg_id": int(m.group(1)),
                "region": region,
                "title": desc[:60].rstrip("., ") or desc[:60],
                "description": desc,
                "objectives": [],
                "rewards": {},
            })
    return quests


def import_maps(source, master, out):
    maps = []
    # patch000 .map files
    pdir = PATCH_LOCAL / "Maps"
    if pdir.exists():
        for p in sorted(pdir.glob("*.map")):
            maps.append(parse_map(p))
    # data/MAPS/*.SAV are gzip-compressed MAP files.
    mdir = source / "data/MAPS"
    if mdir.exists():
        for p in sorted(mdir.glob("*.SAV")) + sorted(mdir.glob("*.sav")):
            try:
                raw = gzip.decompress(p.read_bytes())
                name = p.stem
                maps.append({
                    "map_id": name.lower(),
                    "name": name,
                    "size": len(raw),
                    "source_file": p.name,
                    "compressed": True,
                })
            except Exception:
                continue
    return maps


def import_locations(maps, quests):
    """Derive candidate locations from map names (original IDs preserved)."""
    locs = {}
    for m in maps:
        mid = m.get("map_id", "")
        if not mid:
            continue
        base = re.sub(r"\d+$", "", mid)
        region = re.match(r"([a-z]+)", base)
        region = region.group(1) if region else base
        if base not in locs:
            locs[base] = {
                "id": base, "name": base.upper(), "region": region,
                "maps": [], "exits": [], "is_interior": False,
            }
        locs[base]["maps"].append(mid)
    for q in quests:
        reg = q.get("region", "").lower().replace(" ", "_")
        if reg and reg not in ("unknown",):
            locs.setdefault(reg, {
                "id": reg, "name": reg.upper(), "region": reg,
                "maps": [], "exits": [], "is_interior": False,
            })
    # Build a simple linear travel graph over discovered locations.
    order = sorted(locs)
    for i, key in enumerate(order):
        exits = []
        if i > 0:
            exits.append(order[i - 1])
        if i + 1 < len(order):
            exits.append(order[i + 1])
        locs[key]["exits"] = exits
    return list(locs.values())


def import_dialogs(master, out):
    ddir = master / "text/english/dialog"
    idx = []
    if ddir.exists():
        for p in sorted(ddir.glob("*.msg")):
            try:
                msgs = parse_msg(p)
                idx.append({
                    "id": p.stem,
                    "source_file": p.name,
                    "message_count": len(msgs),
                    "sample_ids": sorted(msgs)[:8],
                })
            except Exception:
                continue
    return idx


def verify(out):
    manifest_path = out / "manifest.json"
    if not manifest_path.exists():
        print("VERIFY: manifest missing", file=sys.stderr)
        return 1
    manifest = json.loads(manifest_path.read_text(encoding="utf-8"))
    errors = []
    for name, expected in manifest.get("counts", {}).items():
        p = out / (name if name.endswith(".json") else name + ".json")
        if not p.exists():
            errors.append("missing " + str(p))
            continue
        try:
            data = json.loads(p.read_text(encoding="utf-8"))
        except Exception as e:
            errors.append("invalid %s: %s" % (p, e))
            continue
        actual = len(data) if isinstance(data, list) else len(data.get("records", []))
        if actual != expected:
            errors.append("count mismatch %s: %s != %s" % (name, actual, expected))
    if errors:
        for e in errors:
            print("VERIFY FAIL:", e, file=sys.stderr)
        return 1
    print("VERIFY OK:", manifest.get("counts"))
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--source", help="Fallout 2 installation directory")
    ap.add_argument("--out", default=".local/generated")
    ap.add_argument("--verify", action="store_true")
    args = ap.parse_args()
    out = Path(args.out)
    if args.verify:
        return verify(out)
    if not args.source:
        ap.error("--source is required unless --verify is used")
    source = Path(args.source)
    if not (source / "master.dat").exists():
        ap.error("master.dat not found in " + str(source))
    master = MASTER_LOCAL
    if not (master / "text/english/game/pro_item.msg").exists():
        ap.error("extracted master data missing at " + str(master) +
                 " (run dat_reader.py on master.dat first)")

    items = import_items(master, out)
    critters = import_critters(master, out)
    quests = import_quests(master, out)
    maps = import_maps(source, master, out)
    locations = import_locations(maps, quests)
    dialogs = import_dialogs(master, out)

    counts = {
        "items.json": len(items), "critters.json": len(critters),
        "quests.json": len(quests), "locations.json": len(locations),
        "maps_index.json": len(maps), "dialog_index.json": len(dialogs),
    }
    src_hashes = {}
    for p in (source / "master.dat", source / "critter.dat",
              source / "backup/rpu/patch000.dat"):
        if p.exists():
            src_hashes[p.name] = {"bytes": p.stat().st_size, "sha256": sha256(p)}

    write_json(out / "items.json", items)
    write_json(out / "critters.json", critters)
    write_json(out / "quests.json", quests)
    write_json(out / "locations.json", locations)
    write_json(out / "maps_index.json", maps)
    write_json(out / "dialog_index.json", dialogs)
    write_json(out / "manifest.json", {
        "generator": "tools/fallout2_import/import_all.py",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "source": str(source),
        "source_hashes": src_hashes,
        "counts": counts,
        "license_notice": "Derived from user-local licensed Fallout 2 data. "
                          "Output is gitignored; never publish to GitHub.",
        "completeness": {
            "items_with_stats": sum(1 for i in items if i.get("stats")),
            "quests_with_objectives": sum(1 for q in quests if q.get("objectives")),
            "maps_decoded": sum(1 for m in maps if m.get("size")),
            "note": "PRO stat decoding and .int dialogue scripts are best-effort "
                    "only; this is a candidate import, not a verified conversion.",
        },
    })
    print("IMPORT OK:", counts)
    return verify(out)


if __name__ == "__main__":
    raise SystemExit(main())
