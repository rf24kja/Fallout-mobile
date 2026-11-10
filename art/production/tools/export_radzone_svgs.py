#!/usr/bin/env python3
"""RADZONE: deterministic art-only SVG -> transparent RGBA PNG exporter.

This script does not change Godot scenes, core scripts, game data, saves or APKs.
Dependencies: pip install cairosvg Pillow
Usage:
    python art/production/tools/export_radzone_svgs.py --group all
    python art/production/tools/export_radzone_svgs.py --group items --sizes 64 128 256
    python art/production/tools/export_radzone_svgs.py --group world --dry-run
"""
from __future__ import annotations
import argparse
import hashlib
import json
import sys
from pathlib import Path

GROUPS = {
    "world": "art/production/world/props/source",
    "items": "art/production/items/icons/source",
    "ui": "art/production/ui/source",
}
DEFAULT_SIZES = {
    "world": (512, 1024),
    "items": (64, 128, 256),
    "ui": (256, 512),
}
def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--group", choices=["all", *GROUPS], default="all")
    ap.add_argument("--sizes", nargs="+", type=int,
                    help="Override raster output dimensions; items/world are square")
    ap.add_argument("--project-root", type=Path,
                    default=Path(__file__).resolve().parents[3])
    ap.add_argument("--dry-run", action="store_true")
    ap.add_argument("--overwrite", action="store_true")
    args = ap.parse_args()
    if args.sizes and any(s < 32 or s > 4096 for s in args.sizes):
        ap.error("Output sizes must be between 32 and 4096 pixels.")
    if not args.dry_run:
        try:
            import cairosvg
            from PIL import Image
        except ImportError as exc:
            print("Install dependencies with: python -m pip install cairosvg Pillow", file=sys.stderr)
            print(f"Missing: {exc}", file=sys.stderr)
            return 2
    root = args.project_root.resolve()
    export_log = []
    selected = GROUPS if args.group == "all" else {args.group: GROUPS[args.group]}
    for group, rel in selected.items():
        src_dir = root / rel
        if not src_dir.is_dir():
            print(f"Missing source directory: {src_dir}", file=sys.stderr)
            return 3
        dest = src_dir.parent / "exports"
        sizes = tuple(args.sizes) if args.sizes else DEFAULT_SIZES[group]
        for src in sorted(src_dir.glob("*.svg")):
            for size in sizes:
                filename = f"{src.stem}_{size}.png"
                output = dest / filename
                if args.dry_run:
                    print(f"DRY RUN [{group}]: {src.name} -> {output}")
                    continue
                if output.exists() and not args.overwrite:
                    print(f"SKIP existing: {output} (use --overwrite)")
                    continue
                dest.mkdir(parents=True, exist_ok=True)
                # Preserve UI source's intrinsic aspect ratio, unlike square item/prop art.
                if group == "ui":
                    raster = cairosvg.svg2png(url=str(src), output_width=size)
                else:
                    raster = cairosvg.svg2png(url=str(src), output_width=size,
                                              output_height=size)
                import io
                im = Image.open(io.BytesIO(raster)).convert("RGBA")
                bbox = im.getchannel("A").getbbox()
                if bbox is None:
                    raise RuntimeError(f"Empty alpha art: {src}")
                if im.getchannel("A").getextrema()[0] == 255:
                    print(f"WARN: no transparent pixels in {src.name}", file=sys.stderr)
                im.save(output, optimize=True)
                export_log.append({
                    "source":str(src.relative_to(root)),
                    "output":str(output.relative_to(root)),
                    "dimensions_px":list(im.size),
                    "alpha_bbox":list(bbox),
                    "sha256":hashlib.sha256(output.read_bytes()).hexdigest(),
                    "bytes":output.stat().st_size
                })
                print(f"OK [{group}]: {output.relative_to(root)}")
    if not args.dry_run:
        report = root / "art/production/RADZONE_EXPORT_REPORT.json"
        report.write_text(json.dumps({
            "exporter":"export_radzone_svgs.py",
            "assets":export_log,
            "warning":"Exported images are not automatically approved as final game assets."
        }, indent=2, ensure_ascii=False)+"\n",encoding="utf-8")
        print(f"Wrote manifest: {report}")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
