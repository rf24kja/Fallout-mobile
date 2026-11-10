#!/usr/bin/env python3
"""RADZONE Wave 12 PNG audit. Run at the root of the repository. Pillow required."""
from pathlib import Path
from PIL import Image
import hashlib, json, sys
ROOT=Path(__file__).resolve().parents[2]
manifest_path=ROOT/'art/production/painterly_v4/wave12/manifest.json'
report=json.loads(manifest_path.read_text(encoding='utf-8'))
assert report['counts']['png_exports']==len(report['assets'])
checks=[];bad=[]
for item in report['assets']:
    path=ROOT/item['repo_path']
    try:
        data=path.read_bytes()
        assert data[:8]==b'\x89PNG\r\n\x1a\n','bad PNG signature'
        assert hashlib.sha256(data).hexdigest()==item['sha256'],'wrong SHA256'
        with Image.open(path) as im:
            im.load()
            assert im.mode=='RGBA','not RGBA'
            assert im.size==(item['size'],item['size']),'wrong dimensions'
            al=im.getchannel('A')
            assert al.getextrema()[0]==0 and al.getextrema()[1]>0,'no alpha variation'
            assert al.getbbox()==tuple(item['alpha_bbox']),'bbox mismatch'
        checks.append(item['repo_path'])
    except (OSError,ValueError,AssertionError) as e:
        bad.append({'path':str(path),'error':str(e)})
print(json.dumps({'checked':len(checks),'failed':bad,'total_expected':len(report['assets'])},ensure_ascii=False,indent=2))
sys.exit(1 if bad else 0)