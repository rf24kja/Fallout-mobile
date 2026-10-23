import requests, json
r = requests.get('https://openrouter.ai/api/v1/models')
data = r.json()
img_models = [m for m in data['data'] if any(x in m.get('id', '').lower() for x in ['image', 'dall-e', 'gpt-image', 'imagen', 'flux', 'midjourney', 'stable-diffusion', 'sdxl', 'playground'])]
for m in img_models[:30]:
    pricing = m.get('pricing', {})
    print(f"{m['id']}: prompt={pricing.get('prompt','N/A')}, completion={pricing.get('completion','N/A')}, context={m.get('context_length','N/A')}")