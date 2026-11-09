#!/usr/bin/env python3
"""Import three original RADZONE Wave 01 sheets to permanent GitHub RGBA draft PNGs."""
import io, json, os, hashlib, sys
from pathlib import Path
from urllib.request import urlopen, Request
from PIL import Image, ImageDraw
sys.path.insert(0,str(Path(__file__).resolve().parent))
from art_import_wave04 import isolate,sha

ROOT=Path("art/production/painterly_v4/wave01")
GROUPS={
"interior":["vending_machine","scavenger_workbench","retro_refrigerator","steel_locker","potbelly_stove","medical_cabinet"],
"settlement":["abandoned_compact_car","salvage_market_stall","water_tower","dead_tree","abandoned_bus_shelter","scrap_shack"],
"weapons":["heavy_revolver","compact_submachine_gun","pump_shotgun","sledgehammer","laser_pistol","fragmentation_grenade"]
}
TASK_IDS={
"interior":"8bc9142f-cdcd-4362-b2b1-c79dca729fcd",
"settlement":"2ac8705a-8cf9-44d4-bf9b-28144e137af9",
"weapons":"48d0cbc5-f4d2-45a0-bfef-aa6805f52456"}
def import_source(key):
    path=ROOT/"source_sheets"/(key+".png");path.parent.mkdir(exist_ok=True,parents=True)
    if not path.exists():
        url=os.environ["RADZONE_"+key.upper()+"_URL"]
        if not url.startswith("https://"):raise ValueError("Invalid URL")
        with urlopen(Request(url,headers={"User-Agent":"RADZONE-asset-publisher/1.0"}),timeout=90) as r:buf=r.read(16000000)
        img=Image.open(io.BytesIO(buf)).convert("RGBA")
        if img.width<1400 or img.height<700:raise ValueError("Too small input sheet")
        img.save(path,optimize=True)
    return path
def main():
    assets=[];sources=[]
    for group,names in GROUPS.items():
        src=import_source(group);sheet=Image.open(src).convert("RGBA")
        sources.append({"group":group,"path":str(src),"sha256":sha(src),"source_task_id":TASK_IDS[group]})
        for i,name in enumerate(names):
            img,box,bg,coverage=isolate(sheet,i)
            target=ROOT/"objects"/group/(name+".png")
            target.parent.mkdir(exist_ok=True,parents=True)
            img.save(target,optimize=True)
            if Image.open(target).getpixel((0,0))[3]!=0:raise ValueError("Not transparent")
            assets.append({"id":group+"/"+name,"path":str(target),"source_path":str(src),"source_cell":i,
                           "bbox":box,"size":list(img.size),"source_bg_rgb":bg,"coverage":coverage,
                           "sha256":sha(target),"status":"DRAFT_AUTO_MASKED_NEEDS_HUMAN_QA"})
    cw,ch=320,260
    dst=Image.new("RGB",(cw*6,ch*3))
    for i,a in enumerate(assets):
        light=(i%2==0);bg=(220,220,217) if light else (34,34,34)
        tile=Image.new("RGB",(cw,ch),bg)
        d=ImageDraw.Draw(tile)
        for yy in range(0,ch,24):
            for xx in range(0,cw,24):
                if (xx//24+yy//24)%2==0:
                    d.rectangle((xx,yy,xx+23,yy+23),fill=(192,192,190) if light else (58,58,58))
        im=Image.open(a["path"]).convert("RGBA")
        im.thumbnail((cw-20,ch-42),Image.Resampling.LANCZOS)
        tile.paste(im,((cw-im.width)//2,(ch-35-im.height)//2),im)
        d.text((7,ch-20),a["id"],fill="black" if light else "white")
        dst.paste(tile,((i%6)*cw,(i//6)*ch))
    preview=ROOT/"qa"/"contact_dark_light.jpg";preview.parent.mkdir(parents=True,exist_ok=True)
    dst.save(preview,quality=88)
    manifest={"pack":"RADZONE_WAVE01","count":len(assets),"sources":sources,"assets":assets,
              "qa_preview":str(preview),"status":"DRAFT_NOT_GODOT_VERIFIED"}
    (ROOT/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    (ROOT/"README.md").write_text(
        "# RADZONE Wave 01 — imported painterly art sheets\n\n"
        "Three original high-resolution generated source sheets and eighteen individually "
        "auto-extracted RGBA draft assets (interior props, settlement structures, weapons). "
        "All hashes and source cell coordinates are in manifest.json; view QA on light/dark "
        "checkerboard. **These are still visual-review candidates, not animation frames or "
        "validated Godot sprites.** Keep project mechanics and runtime resources unchanged.\n")
    print("Published",len(assets),"separate artwork drafts and",len(sources),"source sheets.")
if __name__=="__main__":main()
