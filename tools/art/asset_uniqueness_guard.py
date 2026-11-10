#!/usr/bin/env python3
"""RADZONE staged-asset uniqueness audit. Read-only, stdlib + optional Pillow.

Does not delete/replace files, alter item IDs, invoke APIs, or generate new art.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter, defaultdict
from pathlib import Path


def slug(s: str) -> str:
    s = str(s).lower().replace('\\', '/')
    s = s.rsplit('/', 1)[-1]
    s = re.sub(r'\.(png|webp|jpg|jpeg)$', '', s)
    s = re.sub(r'(?<!\w)(?:128|256|384|64)(?!\w)$', '', s)
    s = re.sub(r'_(?:64|128|256|384)$', '', s)
    return re.sub(r'[^a-z0-9]+', '_', s).strip('_')


def load_catalog(path: Path) -> dict:
    obj = json.loads(path.read_text(encoding='utf-8'))
    if not isinstance(obj.get('objects'), list) or not isinstance(obj.get('families'), list):
        raise ValueError('Invalid catalog: expected objects and families lists')
    seen = set()
    for entry in obj['objects']:
        for field in ('id', 'wave', 'ref', 'variants'):
            if field not in entry:
                raise ValueError(f'Missing {field} in catalog entry {entry!r}')
        identity = (entry['wave'], entry['id'], entry['ref'])
        if identity in seen:
            raise ValueError(f'Duplicate catalog identity: {identity}')
        seen.add(identity)
        if not entry['variants']:
            raise ValueError(f'No file variant for {identity}')
    return obj


def family_index(catalog: dict) -> dict[str, str]:
    index = {}
    for family in catalog['families']:
        name = family['key']
        for alias in family['aliases']:
            key = slug(alias)
            if key in index and index[key] != name:
                raise ValueError(f'Overlapping alias {key!r}: {index[key]} vs {name}')
            index[key] = name
    return index


def file_digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()


def _image_hashes(path: Path) -> tuple[int, int]:
    """Return 64-bit difference hash and 64-bit average hash, normalized around alpha bounds."""
    try:
        from PIL import Image
    except ImportError as exc:
        raise RuntimeError('Pillow required for visual similarity; pip install Pillow') from exc
    with Image.open(path) as img:
        img.load()
        rgba = img.convert('RGBA')
        alpha = rgba.getchannel('A')
        bbox = alpha.getbbox()
        if bbox:
            rgba = rgba.crop(bbox)
        side = max(rgba.size)
        if side == 0:
            raise ValueError('Empty image')
        layer = Image.new('RGBA', (side, side), (0, 0, 0, 0))
        layer.alpha_composite(rgba, ((side-rgba.width)//2, (side-rgba.height)//2))
        neutral = Image.new('RGBA', layer.size, (92, 92, 92, 255))
        neutral.alpha_composite(layer)
        rgb = neutral.convert('L')
        d = list(rgb.resize((9, 8), Image.Resampling.LANCZOS).tobytes())
        a = list(rgb.resize((8, 8), Image.Resampling.LANCZOS).tobytes())
        dh = 0
        for y in range(8):
            for x in range(8):
                dh = (dh << 1) | int(d[y*9+x] > d[y*9+x+1])
        avg = sum(a)/len(a)
        ah = 0
        for pixel in a:
            ah = (ah << 1) | int(pixel > avg)
        return dh, ah


def evaluate(catalog: dict, candidate_id: str, candidate_path: Path | None,
             root: Path, refs: dict[str, Path] | None = None) -> dict:
    key = slug(candidate_id)
    families = family_index(catalog)
    result = {'candidate_id': candidate_id, 'normalized_id': key, 'status': 'NEW_SUBJECT_CANDIDATE',
              'exact_id_matches': [], 'semantic_family_matches': [],
              'exact_sha256_matches': [], 'visual_similarity_review': [],
              'visual_files_compared': 0, 'visual_files_unavailable': 0,
              'notes': []}
    refs = refs or {}
    candidate_sha = file_digest(candidate_path) if candidate_path else None
    candidate_hash = _image_hashes(candidate_path) if candidate_path else None
    for entry in catalog['objects']:
        entry_key = slug(entry['id'])
        summary = {'id': entry['id'], 'wave': entry['wave'], 'ref': entry['ref'],
                   'source_manifest': entry.get('manifest', '')}
        if key == entry_key:
            result['exact_id_matches'].append(summary)
        elif families.get(key) and families.get(key) == families.get(entry_key):
            result['semantic_family_matches'].append({**summary, 'family': families[key]})
        for variant in entry['variants']:
            if candidate_sha and variant.get('sha256') == candidate_sha:
                result['exact_sha256_matches'].append({**summary, 'path': variant['path']})
            if not candidate_hash:
                continue
            ref_root = refs.get(entry['ref'], root)
            local = ref_root / variant['path']
            if not local.is_file():
                result['visual_files_unavailable'] += 1
                continue
            try:
                current_hash = _image_hashes(local)
            except (OSError, ValueError):
                result['visual_files_unavailable'] += 1
                continue
            result['visual_files_compared'] += 1
            d_dist = (candidate_hash[0] ^ current_hash[0]).bit_count()
            a_dist = (candidate_hash[1] ^ current_hash[1]).bit_count()
            if d_dist <= 10 and a_dist <= 12:
                result['visual_similarity_review'].append({**summary, 'path': variant['path'],
                    'dhash_distance': d_dist, 'ahash_distance': a_dist})
    if result['exact_id_matches'] or result['exact_sha256_matches']:
        result['status'] = 'REJECT_DUPLICATE_ID_OR_CONTENT'
    elif result['semantic_family_matches'] or result['visual_similarity_review']:
        result['status'] = 'REVIEW_EXISTING_VARIANT_BEFORE_NEW_OBJECT'
    elif candidate_path and result['visual_files_unavailable']:
        result['status'] = 'INCOMPLETE_VISUAL_AUDIT'
        result['notes'].append('Unavailable reference images; never claim a full visual scan.')
    elif not candidate_path:
        result['status'] = 'NAME_ONLY_PROVISIONAL'
        result['notes'].append('No candidate image: perceptual image comparison has not run.')
    else:
        result['notes'].append('No match detected among accessible files; human visual review still required.')
    return result


def audit_catalog(catalog: dict) -> dict:
    family_map = family_index(catalog)
    ids = defaultdict(list)
    hashes = defaultdict(list)
    per_wave = Counter()
    for o in catalog['objects']:
        per_wave[o['wave']] += 1
        ids[slug(o['id'])].append(o)
        for v in o['variants']:
            if v.get('sha256'):
                hashes[v['sha256']].append({'id': o['id'], 'wave': o['wave'], 'path': v['path']})
    overlaps = defaultdict(list)
    for o in catalog['objects']:
        key = family_map.get(slug(o['id']))
        if key:
            overlaps[key].append({'id': o['id'], 'wave': o['wave'], 'ref': o['ref']})
    return {
        'catalogued_logical_entries': len(catalog['objects']),
        'file_variants': sum(len(o['variants']) for o in catalog['objects']),
        'by_wave': dict(sorted(per_wave.items())),
        'exact_identity_names_across_waves': {k:[{'wave':e['wave'],'id':e['id']} for e in v]
            for k,v in ids.items() if len(set(e['wave'] for e in v)) > 1},
        'identical_sha256_across_paths': {k:v for k,v in hashes.items() if len(v)>1},
        'related_subject_families': {k:v for k,v in overlaps.items()
            if len({(x['wave'], x['id']) for x in v})>1},
        'limitations': [
            'This report audits provided manifest metadata; unmanifested files may exist.',
            'Equal SHA is definitive for byte-identical files; different SHA does not prove different visuals.',
            'Semantic families are review hints, not automatic proof of identical art.',
            'Run --candidate-image from a checkout/worktree with reference images for pixel similarity.']}


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--catalog', default='art/production/catalog/asset_registry.json', type=Path)
    ap.add_argument('--audit', action='store_true')
    ap.add_argument('--candidate-id', help='Proposed NEW subject ID')
    ap.add_argument('--candidate-image', type=Path)
    ap.add_argument('--root', type=Path, default=Path('.'))
    ap.add_argument('--reference-root', action='append', default=[], metavar='REF=DIR',
                    help='Map a GitHub branch ref to checked-out local worktree for pixel comparison')
    ap.add_argument('--report', type=Path)
    args = ap.parse_args()
    cat = load_catalog(args.catalog)
    if args.candidate_image and not args.candidate_id:
        ap.error('--candidate-image requires --candidate-id')
    if not args.audit and not args.candidate_id:
        ap.error('Specify --audit and/or --candidate-id')
    refs = {}
    for pair in args.reference_root:
        if '=' not in pair:
            ap.error('--reference-root must be REF=DIR')
        key, val = pair.split('=', 1)
        refs[key] = Path(val)
    result = {'catalog_audit': audit_catalog(cat)} if args.audit else {}
    if args.candidate_id:
        if args.candidate_image and not args.candidate_image.is_file():
            ap.error('Candidate image does not exist')
        result['candidate'] = evaluate(cat,args.candidate_id,args.candidate_image,args.root,refs)
    output = json.dumps(result, ensure_ascii=False, indent=2)+'\n'
    print(output)
    if args.report:
        args.report.parent.mkdir(parents=True,exist_ok=True)
        args.report.write_text(output,encoding='utf-8')
    if 'candidate' in result and result['candidate']['status'] != 'NEW_SUBJECT_CANDIDATE':
        return 2
    return 0


if __name__ == '__main__':
    raise SystemExit(main())