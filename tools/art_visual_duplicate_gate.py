#!/usr/bin/env python3
"""Detect visually near-identical RADZONE art PNGs, independently of their file names.

Usage: python tools/art_visual_duplicate_gate.py candidate-manifest.json
Exit 2 for probable image duplicates, 0 for no matches. Pillow is required.

This supplements, NOT replaces, tools/art_check_duplicates.py (semantic ID matching).
Only near-identical copies/resizes are rejected automatically; visually similar
but distinct subjects require manual approval and a per-item identity check.
"""
import argparse
import json
import sys
from pathlib import Path
from PIL import Image

ROOT = Path(__file__).resolve().parents[1]
MANIFESTS = (
    'art/production/painterly_v3/RADZONE_GITHUB_MANIFEST.json',
    'art/production/painterly_v4/wave01/manifest.json',
    'art/production/painterly_v4/wave03_unique/manifest.json',
    'art/production/painterly_v4/wave04/manifest.json',
    'art/production/painterly_v4/wave06_unique/manifest.json',
    'art/production/painterly_v4/wave07/manifest.json',
    'art/production/painterly_v4/wave08/manifest.json',
    'art/production/painterly_v4/wave09_unique/manifest.json',
)


def resolve_png(item, manifest_path):
    raw = item.get('path') or item.get('source_path')
    if not raw or not str(raw).lower().endswith('.png'):
        return None
    path = Path(str(raw))
    if path.is_absolute():
        return path if path.is_file() else None
    # v3 references are relative to painterly_v3, later manifests often contain repo paths.
    for candidate in (ROOT / path, manifest_path.parent / path):
        if candidate.is_file():
            return candidate
    return None


def manifest_images(manifest):
    data = json.loads(manifest.read_text(encoding='utf-8'))
    for item in data.get('assets', data.get('published_files', [])):
        if isinstance(item, dict):
            path = resolve_png(item, manifest)
            if path is not None:
                yield path


def signatures(path):
    with Image.open(path) as image:
        rgba = image.convert('RGBA')
        alpha = rgba.getchannel('A')
        bbox = alpha.point(lambda p: 255 if p > 16 else 0).getbbox()
        if bbox is None:
            raise ValueError('Empty alpha silhouette: ' + str(path))
        rgba = rgba.crop(bbox)
        # Fully composited mid-grey removes misleading differences from unpremultiplied RGB
        # in transparent pixels. Cropping excludes edge padding variation.
        ground = Image.new('RGBA', rgba.size, (128, 128, 128, 255))
        ground.alpha_composite(rgba)
        gray = ground.convert('RGB').convert('L')
        dh = gray.resize((9, 8), Image.Resampling.LANCZOS)
        dp = list(dh.getdata())
        d_bits = sum((1 << (y * 8 + x)) for y in range(8) for x in range(8)
                     if dp[y * 9 + x] > dp[y * 9 + x + 1])
        ah = gray.resize((8, 8), Image.Resampling.LANCZOS)
        ap = list(ah.getdata())
        avg = sum(ap) / 64
        a_bits = sum((1 << i) for i, value in enumerate(ap) if value > avg)
        return d_bits, a_bits


def near_duplicate(a, b, cutoff=5):
    return (a[0] ^ b[0]).bit_count() <= cutoff and (a[1] ^ b[1]).bit_count() <= cutoff


def main(argv=None):
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('manifest', type=Path)
    p.add_argument('--cutoff', type=int, default=5, help='Max bit differences per 64-bit signature (default 5)')
    args = p.parse_args(argv)
    if not 0 <= args.cutoff <= 12:
        p.error('cutoff must be 0..12; do not use overly broad thresholds')
    candidates = list(manifest_images(args.manifest.resolve()))
    if not candidates:
        p.error('Candidate manifest contains no locally readable PNG assets')
    known = []
    for relative in MANIFESTS:
        source = ROOT / relative
        if not source.is_file():
            continue
        for path in manifest_images(source):
            known.append((path, signatures(path)))
    checks = known[:]
    hits = []
    for path in candidates:
        sig = signatures(path)
        for other, other_sig in checks:
            if path.resolve() == other.resolve():
                continue
            if near_duplicate(sig, other_sig, args.cutoff):
                hits.append((path, other))
        checks.append((path, sig))
    for candidate, match in hits:
        print(f'NEAR-DUPLICATE: {candidate} matches {match}', file=sys.stderr)
    if hits:
        print(f'REJECTED: {len(hits)} probable pixel-level duplicates', file=sys.stderr)
        return 2
    print(f'PASS: {len(candidates)} candidate PNGs checked vs {len(known)} existing PNGs')
    print('Manual subject/style/perspective QA is still required: perceptual hashes are not semantic matching.')
    return 0


if __name__ == '__main__':
    sys.exit(main())