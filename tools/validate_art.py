#!/usr/bin/env python3
"""Read-only PNG asset validation, with optional JSON report. Pillow required."""
import argparse
import hashlib
import json
import sys
from pathlib import Path

from PIL import Image

PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"


def check(path: Path) -> dict:
    raw = path.read_bytes()
    result = {
        "file": str(path),
        "bytes": len(raw),
        "sha256": hashlib.sha256(raw).hexdigest(),
        "png_signature_valid": raw[:8] == PNG_SIGNATURE,
    }
    if not result["png_signature_valid"]:
        raise ValueError("Invalid PNG signature")
    with Image.open(path) as image:
        image.verify()
    with Image.open(path) as image:
        result.update(width=image.width, height=image.height, mode=image.mode, format=image.format)
        if "A" in image.getbands() or "transparency" in image.info:
            # Paletted PNGs may store transparency in tRNS rather than an A band.
            lo, hi = image.convert("RGBA").getchannel("A").getextrema()
            result.update(alpha_channel_present=True, has_transparent_pixels=lo < 255,
                          fully_transparent=hi == 0)
        else:
            result.update(alpha_channel_present=False, has_transparent_pixels=False,
                          fully_transparent=False)
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("files", nargs="+", type=Path)
    parser.add_argument("--require-alpha", action="store_true")
    parser.add_argument("--out", type=Path)
    args = parser.parse_args()
    failed = False
    records = []
    for path in args.files:
        try:
            entry = check(path)
            if args.require_alpha and not entry["has_transparent_pixels"]:
                entry["error"] = "Gameplay sprite requires transparent pixels"
                failed = True
        except (OSError, ValueError) as error:
            entry = {"file": str(path), "error": str(error)}
            failed = True
        records.append(entry)
    report = {"status": "FAIL" if failed else "PASS", "items": records}
    print(json.dumps(report, ensure_ascii=False, indent=2))
    if args.out:
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    return int(failed)


if __name__ == "__main__":
    sys.exit(main())
