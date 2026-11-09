#!/usr/bin/env python3
"""Fail a new RADZONE art batch if an object type has already been drawn.

Usage: python tools/art_check_duplicates.py path/to/candidate_manifest.json
Candidate JSON: {"assets": [{"id": "name"}, ...]}
No argument: list registered existing subjects (for inspection).

This is a semantic gate, not a replacement for visual human review.
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
MANIFESTS = [
    'art/production/painterly_v3/RADZONE_GITHUB_MANIFEST.json',
    'art/production/painterly_v4/wave01/manifest.json',
    'art/production/painterly_v4/wave04/manifest.json',
    'art/production/painterly_v4/wave03_unique/manifest.json',
    'art/production/painterly_v4/wave06_unique/manifest.json',
]
# Broad but grounded same-subject aliases. Do not equate an ammo case with a supply crate,
# a single cot with a double bunk bed, or a standalone valve with a pumping station.
ALIASES = {
    'medical_kit': 'medkit first_aid_kit field_medical_case medical_case',
    'injector': 'stim_injector field_injector stimpak stimpack',
    'gas_mask': 'gas_mask heavy_respirator',
    'lockpick_tools': 'lockpick_set lockpick_roll locksmith_tool_roll',
    'geiger_counter': 'geiger_counter analog_radiation_meter radio_detector',
    'field_boots': 'reinforced_boots reinforced_field_boots field_boots',
    'backpack': 'backpack wasteland_backpack rolltop_scout_pack scout_backpack',
    'field_radio': 'analog_field_radio field_radio portable_field_radio',
    'workbench': 'scavenger_workbench scavenger_workbench_b workshop_workbench',
    'metal_stove': 'potbelly_stove compact_iron_stove potbelly_heater',
    'camp_barricade': 'concrete_barricade roadblock_scrap_assemblage road_divider',
    'supply_crate': 'supply_crate reinforced_supply_crate',
    'vending_machine': 'vending_machine red_vending_machine',
    'bus_shelter': 'abandoned_bus_shelter bus_stop_shelter',
    'market_stall': 'salvage_market_stall scrap_market_stall',
    'dead_tree': 'dead_tree dead_desert_tree',
    'scrap_shack': 'scrap_shack fortified_scrap_shack',
    'ammo_storage': 'military_ammo_case',
    'radiation_barrel': 'radioactive_waste_drum rust_barrel',
    'fragmentation_grenade': 'fragmentation_grenade frag_grenade',
    'short_smg': 'compact_submachine_gun compact_smg',
    'pump_shotgun': 'pump_shotgun',
    'patchwork_coat': 'patched_leather_coat',
    'campfire_kettle': 'campfire_with_kettle',
}
REVERSE = {}
for canonical, names in ALIASES.items():
    for item in names.split():
        if item in REVERSE and REVERSE[item] != canonical:
            raise RuntimeError(f'Conflicting alias: {item}')
        REVERSE[item] = canonical
# Includes already generated but not uploaded sheets: reserve their subjects as well.
PENDING_DRAWN = '''
heavy_combat_helmet leather_vest scrap_metal_chest_armor ration_tin
roadside_drop_box abandoned_payphone_booth operating_table manual_wheelchair
iv_stand medicine_shelves hospital_power_cart patient_gurney rainwater_collector
hand_grain_mill hydroponic_tray field_wheelbarrow garden_water_pump
 distillation_still
'''.split()


def normalize(name: str) -> str:
    stem = Path(str(name)).stem.lower().strip()
    stem = re.sub(r'[^a-z0-9]+', '_', stem).strip('_')
    stem = re.sub(r'(_v\d+|_rev\d+|_candidate|_b)$', '', stem)
    return REVERSE.get(stem, stem)


def source_assets(path: Path):
    data = json.loads(path.read_text(encoding='utf-8'))
    items = data.get('published_files', data.get('assets', []))
    if not isinstance(items, list):
        raise ValueError(f'Invalid asset manifest: {path}')
    for asset in items:
        if not isinstance(asset, dict):
            continue
        candidate = asset.get('id') or asset.get('name') or asset.get('path')
        if not candidate:
            continue
        if str(candidate).startswith('characters/') or '/characters/' in str(asset.get('path', '')):
            continue  # 8-direction turnaround frames of DIFFERENT characters are not duplicate items.
        yield str(candidate).split('/')[-1]


def main():
    existing = {}
    for relative in MANIFESTS:
        path = ROOT / relative
        if not path.exists():
            raise FileNotFoundError(f'Missing committed manifest: {relative}')
        for item in source_assets(path):
            existing.setdefault(normalize(item), []).append(relative + ':' + item)
    for item in PENDING_DRAWN:
        existing.setdefault(normalize(item), []).append('PENDING_NOT_GITHUB:' + item)
    if len(sys.argv) == 1:
        print(f'Known/previously drawn subject classes: {len(existing)}')
        print('\n'.join(sorted(existing)))
        return 0
    candidate = Path(sys.argv[1]); candidates = list(source_assets(candidate))
    if not candidates:
        raise ValueError('No candidate assets')
    seen = {}
    issues = []
    for item in candidates:
        key = normalize(item)
        if key in existing:
            issues.append(f'DUPLICATE: {item} => {key}; previously: {existing[key][0]}')
        if key in seen:
            issues.append(f'DUPLICATE WITHIN BATCH: {item}, previously {seen[key]}')
        seen[key] = item
    for x in issues:
        print(x, file=sys.stderr)
    if issues:
        print(f'REJECTED: {len(issues)} duplicate entries', file=sys.stderr)
        return 2
    print(f'PASS: {len(candidates)} candidates have no known subject collisions')
    print('Note: Visual similarity still requires human inspection.')
    return 0


if __name__ == '__main__':
    sys.exit(main())