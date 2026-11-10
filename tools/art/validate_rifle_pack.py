#!/usr/bin/env python3
"""Verify a directional static-pose sprite atlas and its manifest. Read-only.

Run from repository root after checking out the art staging branch:
python tools/art/validate_rifle_pack.py
"""
from pathlib import Path
import hashlib
import json
import sys
from PIL import Image, ImageChops

ROOT = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else (Path(__file__).resolve().parents[2] / 'art' / 'production' / 'character_survivor_rifle_pose_v1')
DIRECTIONS = ('S', 'SE', 'E', 'NE', 'N', 'NW', 'W', 'SW')
STATES = ('rifle_ready', 'rifle_fire')


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check() -> list[str]:
    failures: list[str] = []
    manifest = json.loads((ROOT / 'manifest.json').read_text('utf-8'))
    if tuple(manifest['directions']) != DIRECTIONS:
        failures.append('direction order mismatch')
    for state in STATES:
        info = manifest['states'][state]
        atlas_path = ROOT / info['atlas']['file']
        if sha256(atlas_path) != info['atlas']['sha256']:
            failures.append(f'{state} atlas hash mismatch')
        with Image.open(atlas_path) as atlas_file:
            atlas = atlas_file.convert('RGBA')
        if atlas.size != (1024, 512):
            failures.append(f'{state}: invalid atlas size {atlas.size}')
        if len(info['frames']) != len(DIRECTIONS):
            failures.append(f'{state}: expected 8 frames')
            continue
        for index, item in enumerate(info['frames']):
            name = item['direction']
            if name != DIRECTIONS[index]:
                failures.append(f'{state}: unexpected direction {name}')
            frame_path = ROOT / item['file']
            if frame_path.read_bytes()[:8] != b'\x89PNG\r\n\x1a\n':
                failures.append(f'{state}/{name}: invalid PNG signature')
                continue
            if sha256(frame_path) != item['sha256']:
                failures.append(f'{state}/{name}: hash mismatch')
            with Image.open(frame_path) as frame_file:
                frame = frame_file.convert('RGBA')
            if frame.size != (256, 256):
                failures.append(f'{state}/{name}: invalid frame size')
            if frame.getchannel('A').getextrema()[0] != 0:
                failures.append(f'{state}/{name}: not transparent')
            bbox = frame.getchannel('A').point(lambda v: 255 if v > 35 else 0).getbbox()
            if bbox is None or bbox[3] != 248:
                failures.append(f'{state}/{name}: invalid foot alignment {bbox}')
            x, y = index % 4 * 256, index // 4 * 256
            tile = atlas.crop((x, y, x+256, y+256))
            if ImageChops.difference(tile, frame).getbbox() is not None:
                failures.append(f'{state}/{name}: atlas tile does not match frame')
    return failures


if __name__ == '__main__':
    problems = check()
    if problems:
        print('FAIL:', '\n'.join(problems))
        sys.exit(1)
    print('PASS: 16 transparent PNGs, 2 atlases, 8 directions, SHA-256, anchors, pixel-identical tiles')