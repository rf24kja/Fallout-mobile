#!/usr/bin/env python3
"""Validate Wave 13 published assets inside an existing RADZONE checkout (no downloads)."""
import hashlib, json, re, sys
from pathlib import Path
from PIL import Image
ROOT=Path(__file__).resolve().parents[2]
PREFIX='art/production/painterly_v4/wave13'
M=ROOT/PREFIX/'manifest.json'
def main():
    manifest=json.loads(M.read_text(encoding='utf8'))
    assert len(manifest['assets'])==10
    assets=[]
    for item in manifest['assets']:
        assert len(item['outputs'])==2
        for image in item['outputs']:
            p=ROOT/image['path']
            assert p.read_bytes().startswith(b'\x89PNG\r\n\x1a\n'), p
            with Image.open(p) as im:
                im.load()
                assert im.mode=='RGBA',p
                assert list(im.size)==image['size'],p
                lo,hi=im.getchannel('A').getextrema()
                assert lo==0 and hi>0,(p,(lo,hi))
                bounds=im.getchannel('A').point(lambda a:0 if a<16 else 255).getbbox()
                assert list(bounds)==image['alpha_bbox'],p
            assert hashlib.sha256(p.read_bytes()).hexdigest()==image['sha256'],p
            assets.append(str(p))
        scene=ROOT/'scenes/world/props/wave13'/f"{item['id']}.tscn"
        t=scene.read_text(encoding='utf-8')
        assert f'res://{item["outputs"][1]["path"]}' in t,scene
        assert '[node name="Art" type="Sprite2D" parent="."]' in t,scene
    assert len(assets)==20
    preview=ROOT/'scenes/art_preview/wave13_worldprops_review.tscn'
    scene_text=preview.read_text(encoding='utf-8')
    assert len(re.findall(r'^\[ext_resource',scene_text,flags=re.M))==10
    assert 'load_steps=11' in scene_text
    print('PASS: 20 transparent RGBA PNG, 10 scene references, review scene, manifest SHA-256')
if __name__=='__main__':
    try: main()
    except Exception as e:print('FAIL:',repr(e));sys.exit(1)