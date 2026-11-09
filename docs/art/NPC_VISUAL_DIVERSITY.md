# RADZONE — NPC Appearance Variety & Population Art Matrix

## Requirement

NPCs must look like **different people**, not clones wearing only recolored outfits. Diversity includes age, body shapes, facial structure, hairstyles, skin tones, clothing silhouettes, social roles and equipment. Any non-human creature type has its own anatomy and animation/appearance rules.

## Baseline variation dimensions

| Dimension | Baseline choices | Notes |
|---|---|---|
| Age silhouette | child, teen, adult, elderly | Distinct scale, proportions and posture; child-specific rigs/animations |
| Body forms | varied height/build, proportions and posture | Not all variants should share the same rigid adult silhouette |
| Character gender | male, female, non-binary/androgynous where appropriate | Portray as people with distinct faces and outfits, no stereotypes |
| Human appearance | varied complexion, facial features, hair types and colors | Ground individual details, avoid caricature |
| Role | civilian, merchant, healer, worker, scavenger, guard, raider, companion, leader | Gameplay role and readable silhouette |
| Clothing state | poor everyday, traveler, protective workwear, trader, tactical, faction uniform | Visuals vary with location/social context |
| Gear | unarmed, pistol, rifle, melee, armor, helmet, mask, backpack | Actual equipment state when those systems support it |
| Creature | human, mutant, ghoul-like irradiated or other lore-defined groups | Use when grounded in approved game content; separate rigs |

## First representative cast art backlog

| ID | NPC example | Body | Outfit | Gameplay visualization |
|---|---|---|---|---|
| N01 | Adult traveling merchant | adult man | patched coat, trader satchel | item belt / empty hands |
| N02 | Adult settlement mechanic | adult woman | work overalls and tool apron | held wrench / tool |
| N03 | Elder village historian | elderly woman | layered robes and shawl | small bag / walking stance |
| N04 | Elder traveler | elderly man | worn coat and hat | staff / pack |
| N05 | Local child | child | practical everyday clothing | small stature and child proportions |
| N06 | Caravan youth | teen | utility clothes | small bag |
| N07 | Settlement guard | adult woman | armor / patrol wear | rifle equipped |
| N08 | Raider scout | adult man | improvised metal/leather armor | knife and pistol |
| N09 | Medical worker | adult woman | field medical clothing | medkit |
| N10 | Drifter | adult man | dark skin, different face/hair | clothes / backpack |

These are **art-production examples**, not claims that the exact NPCs or quests already exist in current game data. OpenCode must map each visual to a real NPC record.

## Technical production

- Reusable **rig families**, with compatible sockets and drawing masks within each family.
- Child, elderly, creature and significantly different body-shape rigs need their own silhouette, anatomy and animations; never scale a generic adult sprite down and call it a child.
- Each NPC can have seed-controlled variation (hair, complexion, garments, equipment) where supported, but important story NPCs receive fixed unique identities.
- Portraits must match the in-world sprite's face, armor and signature accessories.
- Evaluate NPCs in the **same isometric camera, lighting and scale** as the player; test crowd appearance and screen readability on phones.
- Avoid assigning ethnicity to an NPC based on clothing alone; maintain believable worldbuilding.

## Acceptance

- Demonstrate 10 visibly distinguishable NPCs in one populated scene (with actual runtime capture), not merely a montage of generated portraits.
- Demonstrate at least one adult man, adult woman, elderly adult, and child in-world with distinct rigs/proportions; no combat requirement is implied for child NPCs.
- Demonstrate role/gear variation and equipment response for NPCs that can equip items.
- No placeholder repeated faces/identical proportions across the entire town.
