import requests, json
r = requests.get('https://openrouter.ai/api/v1/models')
data = r.json()

# Check for free models
free_models = [m for m in data['data'] if m.get('id', '').endswith(':free') or ':free' in m.get('id', '')]
print('Free models:')
for m in free_models[:20]:
    print(f"  {m['id']}")

print()
# Check pricing for all image models
all_img = [m for m in data['data'] if any(x in m.get('id', '').lower() for x in ['image', 'dall-e', 'gpt-image', 'imagen', 'flux', 'midjourney', 'stable-diffusion', 'sdxl', 'playground', 'luma', 'ideogram'])]
print('All image-related models:')
for m in all_img[:50]:
    pricing = m.get('pricing', {})
    p = pricing.get('prompt', 0)
    c = pricing.get('completion', 0)
    is_free = p == 0 and c == 0
    marker = " [FREE]" if is_free else ""
    print(f"  {m['id']}: prompt={p}, completion={c}{marker}")