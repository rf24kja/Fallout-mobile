#!/usr/bin/env python3
"""Validate RADZONE static survivor pose frames and atlases; no Godot dependency."""
from pathlib import Path
import hashlib, json, struct, sys

ROOT = Path(__file__).resolve().parents[2]
PACK = ROOT / 'art/production/character_survivor_pose_v1'
RESOURCE = ROOT / 'assets/characters/radzone_survivor_pose_v1/survivor_pose_sprite_frames.tres'


def verify_png(path, expect_width, expect_height, expected_hash):
    data = path.read_bytes()
    assert data[:8] == b'\x89PNG\r\n\x1a\n', f'Not PNG: {path}'
    assert data[12:16] == b'IHDR', f'Missing IHDR: {path}'
    width, height = struct.unpack('>II', data[16:24])
    assert (width, height) == (expect_width, expect_height), (path, width, height)
    color_type = data[25]
    assert color_type in (4, 6), (path, color_type)  # gray+alpha or RGBA
    assert hashlib.sha256(data).hexdigest() == expected_hash, f'Hash mismatch: {path}'


def main():
    m = json.loads((PACK / 'manifest.json').read_text(encoding='utf-8'))
    assert len(m['frames']) == 32 and len(m['atlases']) == 4
    for item in m['frames']:
        verify_png(PACK / item['file'], 256, 256, item['sha256'])
    for item in m['atlases']:
        verify_png(PACK / item['file'], 1024, 512, item['sha256'])
    resource = RESOURCE.read_text(encoding='utf-8')
    for state in ('idle', 'ready', 'aim', 'fire'):
        for direction in ('S','SE','E','NE','N','NW','W','SW'):
            assert f'"name": &"{state}_{direction}"' in resource
            assert f'AtlasTexture_{state}_{direction}' in resource
    print('PASS: 32 RGBA frames, 4 RGBA atlases, 32 pose-resource entries')
    print('NOT TESTED: Godot import, animation playback, equipment/saves, Android')


if __name__ == '__main__':
    try:
        main()
    except (AssertionError, OSError, ValueError) as exc:
        print('FAIL:', exc, file=sys.stderr)
        raise SystemExit(1)
