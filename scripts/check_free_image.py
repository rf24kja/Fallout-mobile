import requests, json
r = requests.get('https://openrouter.ai/api/v1/models')
data = r.json()
for m in data['data']:
    if 'image' in m.get('id', '').lower():
        pricing = m.get('pricing', {})
        p = pricing.get('prompt', -1)
        c = pricing.get('completion', -1)
        if p == 0 and c == 0:
            print('FREE IMAGE MODEL: ' + m['id'])