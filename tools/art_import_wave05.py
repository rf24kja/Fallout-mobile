#!/usr/bin/env python3
"""Generate and QA 12 new original Wave 05 wasteland health + agriculture props."""
import json
from pathlib import Path
import art_import_wave01 as core

core.ROOT=Path("art/production/painterly_v4/wave05")
core.GROUPS={
    "clinic":["operating_table","manual_wheelchair","iv_stand","medicine_shelves","hospital_power_cart","patient_gurney"],
    "agriculture":["rainwater_collector","hand_grain_mill","hydroponic_tray","field_wheelbarrow","garden_water_pump","distillation_still"]
}
core.TASK_IDS={
    "clinic":"dd966927-f457-422b-90d0-639d7dfae14c",
    "agriculture":"ab5b6dd1-17f1-45d0-9979-79f024cd932c"
}
core.main()
p=core.ROOT/"manifest.json"
m=json.loads(p.read_text());m["pack"]="RADZONE_WAVE05"
p.write_text(json.dumps(m,indent=2)+"\n")
(core.ROOT/"README.md").write_text(
    "# RADZONE Wave 05 — clinic and agriculture artwork\n\n"
    "Two original source sheets and 12 individually auto-masked transparent RGBA "
    "PNGs for an abandoned clinic and agriculture/water-survival environments. "
    "See manifest.json for source provenance, exact dimensions and SHA-256. "
    "See qa/contact_dark_light.jpg for a light/dark background preview. "
    "**All are DRAFT source candidates until manual alpha-edge and visual QA.** "
    "No Godot gameplay, animation, item data or Android tests are changed.\n"
)
print("Wave05 manifest and classification written.")
