#!/usr/bin/env python3
"""Strict local PNG/alpha/hash and Godot path validation for RADZONE Wave14.
Run at repository root: python tools/art/validate_wave14.py
"""
import hashlib
import json
from pathlib import Path
from PIL import Image

ROOT = Path(__file__).resolve().parents[2]
DIR = ROOT / 'art/production/painterly_v4/wave14'
SCENE = ROOT / 'scenes/art_preview/wave14_art_preview.tscn'

def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def main():
    data = json.loads((DIR / 'manifest.json').read_text(encoding='utf-8'))
    assert data['status'] == 'CANDIDATE_NOT_IN_GAME_VERIFIED'
    assert len(data['assets']) == 3
    expected = {'reinforced_knee_guards','plasma_rifle','water_purification_tablets'}
    assert {a['asset_id'] for a in data['assets']} == expected
    files = 0
    for item in data['assets']:
        folder = DIR / item['asset_id']
        source = ROOT / item['source_archive_repo_path']
        assert source.is_file() and digest(source)==item['source_archive_sha256']
        with Image.open(source) as im:
            im.load()
            assert im.size == (1254,1254)
            assert im.convert('RGBA').getchannel('A').getextrema() == (0,255)
        for e in item['exports']:
            p = ROOT / e['repo_path']
            raw = p.read_bytes()
            assert raw.startswith(b'\x89PNG\r\n\x1a\n'), p
            assert digest(p) == e['sha256'], p
            with Image.open(p) as im:
                im.load()
                assert im.mode=='RGBA' and list(im.size)==e['size'], p
                alpha=im.getchannel('A')
                assert alpha.getextrema()==(0,255),p
                x0,y0,x1,y1=alpha.point(lambda x: 255 if x>48 else 0).getbbox()
                assert 0<=x0<x1<=im.width and 0<=y0<y1<=im.height
                # Item icon must not touch screen border, and no clipped silhouettes.
                assert min(x0,y0)>=1 and max(x1,y1) < im.width, p
            files+=1
    assert files==12,files
    assert (DIR / 'qa_review.webp').is_file() and digest(DIR/'qa_review.webp')==data['review']['sha256']
    text = SCENE.read_text(encoding='utf-8')
    assert text.count('[ext_resource ') == 6
    assert 'load_steps=7' in text
    for item in data['assets']:
        assert f'{item["asset_id"]}/icon_64.png' in text
        assert f'{item["asset_id"]}/sprite_256.png' in text
    print('PASS: 12/12 RGBA PNG, 3/3 preserved-alpha WebP archives, 1 QA preview, 6 Godot resource paths')
    print('NOT TESTED: running Godot, Android, duplicate scan of remote binary images, commercial readiness')

if __name__ == '__main__':
    main()