# RADZONE — inventory icons Wave 2

**Deliverable:** 7 individual transparent 64×64 PNG icons staged at **actual** `res://assets/ui/icons/<item_id>.png` resource paths already used by `data/weapons.json`, `data/armor.json`, and `data/utility.json`. Each has a matching 256×256 review asset under `art/production/inventory_icons_v2/high_res/`.

Source: owner-provided post-apocalyptic equipment sheet `Постапокалиптический арсенал выжившего.png`. The source has real RGBA transparency; extraction keeps the dominant connected component in each crop, preventing adjacent items from being mixed. These images were *processed from supplied source art*, **not** freshly generated individually.

Use `scenes/art_preview/inventory_icons_review_v2.tscn` as a non-production Godot gallery. It shows 64px textures at 2× with nearest filtering. Review real inventory at 1× under mobile runtime before release.

QA completed locally: PNG decoding/signatures, dimensions, RGBA transparency, nonempty alpha bounds, SHA-256 hash manifest and printed actual-scale contact sheet. No Godot/Android QA performed. Do not overwrite existing resources. Game item IDs and item data were unchanged.

**Approval requirement:** Some items are artist interpretations (e.g. green energy pistol mapped to laser pistol); verify item silhouettes against canonical game item identity before production merge. Commercial-use rights for the supplied source should also be confirmed.