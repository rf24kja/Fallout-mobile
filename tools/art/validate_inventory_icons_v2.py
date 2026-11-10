#!/usr/bin/env python3
"""RADZONE: validate inventory icons Wave 2 without changing game state."""
import argparse
import hashlib
import json
from pathlib import Path
from PIL import Image


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument('--root', type=Path, default=Path(__file__).resolve().parents[2])
    args = parser.parse_args()
    root = args.root
    manifest_path = root / 'art/production/inventory_icons_v2/manifest.json'
    manifest = json.loads(manifest_path.read_text(encoding='utf-8'))
    dbs = {}
    for typ in ['weapons','armor','utility']:
        p = root / ('data/' + typ + '.json')
        dbs[typ] = {item['item_id']: item['icon_path'] for item in json.loads(p.read_text(encoding='utf-8'))[typ]}
    issues = []
    for item in manifest['icons']:
        name, category = item['item_id'], item['category']
        if name not in dbs[category]:
            issues.append(name + ' missing from canonical ' + category + ' database')
        elif dbs[category][name] != 'res://' + item['target_icon_path']:
            issues.append(name + ' icon path differs from registry')
        for entry in item['files']:
            path = root / entry['repo_path']
            if not path.is_file():
                issues.append(str(path) + ' missing')
                continue
            raw = path.read_bytes()
            if not raw.startswith(b'\x89PNG\r\n\x1a\n'):
                issues.append(str(path) + ' invalid PNG signature')
                continue
            if hashlib.sha256(raw).hexdigest() != entry['sha256']:
                issues.append(str(path) + ' SHA-256 differs from manifest')
            try:
                with Image.open(path) as im:
                    im.load()
                    if im.size != (entry['size'], entry['size']) or im.mode != 'RGBA':
                        issues.append(str(path) + ' size/mode mismatch')
                    alpha = im.getchannel('A')
                    if alpha.getextrema()[0] != 0 or alpha.getextrema()[1] < 128:
                        issues.append(str(path) + ' transparent background/art missing')
                    if not alpha.getbbox():
                        issues.append(str(path) + ' alpha bbox empty')
            except Exception as exc:
                issues.append(str(path) + ' PNG decode failed: ' + str(exc))
    print(json.dumps({'status':'PASS' if not issues else 'FAIL','icons':len(manifest['icons']),'errors':issues},ensure_ascii=False,indent=2))
    return 1 if issues else 0

if __name__ == '__main__':
    raise SystemExit(main())