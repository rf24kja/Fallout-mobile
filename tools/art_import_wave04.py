#!/usr/bin/env python3
"""12 source-art RGBA sprites. Requires Pillow, numpy, OpenCV."""
import os, io, json, hashlib
from pathlib import Path
from urllib.request import Request, urlopen
import cv2, numpy as np
from PIL import Image, ImageDraw
ROOT=Path("art/production/painterly_v4/wave04")
GROUPS={
"urban":["traffic_signal","newspaper_box","street_lamp","road_divider","broken_park_bench","abandoned_motorcycle"],
"industrial":["water_purifier","fuse_cabinet","air_compressor","hydraulic_jack","shortwave_transmitter","power_transformer"]}
TASK_IDS={"urban":"b3a45990-cd82-4dcb-ab8c-bf8663e6db4b","industrial":"290169b2-7392-4f72-83af-54ae4051e779"}
def sha(path):return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def get_sheet(group):
    p=ROOT/"source_sheets"/(group+".png")
    p.parent.mkdir(parents=True,exist_ok=True)
    if not p.exists():
        url=os.environ.get("RADZONE_"+group.upper()+"_URL","")
        if not url.startswith("https://"):raise ValueError("Missing source url: "+group)
        req=Request(url,headers={"User-Agent":"RADZONE-asset-publisher/1.0"})
        with urlopen(req,timeout=90) as r:data=r.read(16000000)
        im=Image.open(io.BytesIO(data)).convert("RGBA")
        if im.width<1400 or im.height<700:raise ValueError("unexpected source dimensions")
        im.save(p,optimize=True)
    return p
def isolate(sheet,index):
    w,h=sheet.size; row,col=divmod(index,3)
    x0,y0=round(col*w/3),round(row*h/2)
    x1,y1=round((col+1)*w/3),round((row+1)*h/2)
    ix,iy=max(3,(x1-x0)//100),max(3,(y1-y0)//100)
    x0+=ix;y0+=iy;x1-=ix;y1-=iy
    rgb=np.asarray(sheet.convert("RGB").crop((x0,y0,x1,y1)))
    hh,ww=rgb.shape[:2]
    corners=np.concatenate((rgb[:8,:8].reshape(-1,3),rgb[:8,-8:].reshape(-1,3),rgb[-8:,:8].reshape(-1,3),rgb[-8:,-8:].reshape(-1,3)))
    bg=np.median(corners.astype(np.float32),axis=0)
    d=np.linalg.norm(rgb.astype(np.float32)-bg.reshape((1,1,3)),axis=2)
    m=np.full((hh,ww),cv2.GC_PR_FGD,np.uint8)
    m[d<35]=cv2.GC_PR_BGD;m[d<13]=cv2.GC_BGD;m[d>105]=cv2.GC_FGD
    m[:5,:]=0;m[-5:,:]=0;m[:,:5]=0;m[:,-5:]=0
    try:
        cv2.grabCut(rgb[:,:,::-1].copy(),m,None,np.zeros((1,65),np.float64),np.zeros((1,65),np.float64),5,cv2.GC_INIT_WITH_MASK)
        fg=np.isin(m,[cv2.GC_FGD,cv2.GC_PR_FGD]).astype(np.uint8)
    except cv2.error:fg=(d>30).astype(np.uint8)
    cc,lbl,stats,_=cv2.connectedComponentsWithStats(fg,8)
    if cc>1:
        largest=int(np.max(stats[1:,cv2.CC_STAT_AREA]))
        kept=np.zeros_like(fg)
        for j in range(1,cc):
            if stats[j,cv2.CC_STAT_AREA]>=max(18,largest*0.002):kept[lbl==j]=1
        fg=kept
    alpha=cv2.GaussianBlur(fg*255,(3,3),0.55)
    alpha[alpha<4]=0;alpha[alpha>251]=255
    coverage=float(np.mean(alpha>20))
    if not 0.015<coverage<0.82:raise ValueError(f"Suspicious foreground fraction {coverage} for {index}")
    yy,xx=np.where(alpha>12)
    if len(xx)==0:raise ValueError("empty image")
    L,T=max(0,int(xx.min())-20),max(0,int(yy.min())-20)
    R,B=min(ww,int(xx.max())+21),min(hh,int(yy.max())+21)
    rgba=Image.fromarray(np.dstack((rgb,alpha))[T:B,L:R],"RGBA")
    img=Image.new("RGBA",(rgba.width+24,rgba.height+24),(0,0,0,0))
    img.paste(rgba,(12,12))
    return img,[x0+L,y0+T,x0+R,y0+B],bg.tolist(),coverage
def main():
    entries=[];sources=[]
    for group,names in GROUPS.items():
        path=get_sheet(group);sources.append({"path":str(path),"sha256":sha(path),"task_id":TASK_IDS[group]})
        sheet=Image.open(path).convert("RGBA")
        for i,name in enumerate(names):
            img,bbox,bg,coverage=isolate(sheet,i)
            out=ROOT/"objects"/group/(name+".png");out.parent.mkdir(parents=True,exist_ok=True)
            img.save(out,optimize=True)
            if Image.open(out).getpixel((0,0))[3]!=0:raise ValueError("bad alpha border")
            entries.append({"name":name,"path":str(out),"size":list(img.size),"sha256":sha(out),"source":str(path),"source_cell":i,"bbox":bbox,"bg":bg,"coverage":coverage,"status":"DRAFT_AUTO_MASKED_NEEDS_VISUAL_QA"})
    cw,ch=320,270
    canvas=Image.new("RGB",(cw*4,ch*3))
    for idx,e in enumerate(entries):
        bg=(45,45,45) if idx%2 else (223,223,220)
        tile=Image.new("RGB",(cw,ch),bg);draw=ImageDraw.Draw(tile)
        for y in range(0,ch,24):
            for x in range(0,cw,24):
                if (x//24+y//24)%2==0:draw.rectangle((x,y,x+23,y+23),fill=(65,65,65) if idx%2 else (190,190,185))
        im=Image.open(e["path"]).convert("RGBA");im.thumbnail((cw-24,ch-48))
        tile.paste(im,((cw-im.width)//2,(ch-36-im.height)//2),im)
        draw.text((6,ch-20),e["name"],fill="white" if idx%2 else "black")
        canvas.paste(tile,((idx%4)*cw,(idx//4)*ch))
    q=ROOT/"qa"/"contact_dark_light.jpg";q.parent.mkdir(exist_ok=True,parents=True);canvas.save(q,quality=90)
    manifest={"pack":"RADZONE_WAVE04","source_sheets":sources,"asset_count":len(entries),"assets":entries,"qa_preview":str(q),"classification":"DRAFT_NOT_ANDROID_VERIFIED"}
    (ROOT/"manifest.json").write_text(json.dumps(manifest,indent=2)+"\n")
    (ROOT/"README.md").write_text("# RADZONE Wave 04\n\n12 new original city and industrial world-prop PNG drafts with alpha, plus two unchanged source sheets, SHA-256 manifest and checkerboard QA. These auto-masked art crops need manual visual review. No in-game screenshots, animations or Godot code changes.\n")
    print("Published source sprites:",len(entries))
if __name__=="__main__":main()
