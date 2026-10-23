import re
with open(r'C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile\assets\characters\survivor_sprite_frames.tres', 'r') as f:
    content = f.read()
animations = re.findall(r'"([^"]+)": \{', content)
print('Total animations:', len(animations))
print(animations[:30])