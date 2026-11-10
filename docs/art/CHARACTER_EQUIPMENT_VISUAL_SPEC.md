# RADZONE — Mandatory Visual Equipment & Character Pipeline

**Binding requirement: gameplay equipment must be visible in world and combat.** Applies to player, human NPCs, armed enemies and equipped companions. Approved reference: [RADZONE Visual Catalog](./APPROVED_VISUAL_CATALOG.md).

## Existing Godot baseline (verified from repository)

- `scripts/entities/character_visual.gd` already provides a **Node2D paper-doll**, with separate `AnimatedSprite2D` layers: `BaseSprite`, `ArmorBodySprite`, `ArmorHeadSprite`, `ArmorHandsSprite`, `ArmorFeetSprite`, `ArmorEyesSprite`, `WeaponSprite`, and `ShadowSprite`.
- `scripts/entities/player.gd` already calls `_sync_equipment_visual()` and supplies 8 direction names: `S, SW, W, NW, N, NE, E, SE`.
- There are existing armor tier atlases under `assets/characters/armor_tier_1_clothing` ... `armor_tier_4_advanced`; there are existing pistol Rev2 directional assets.
- **Gap:** `WEAPON_SPRITE_PATHS` currently only maps a few production-pistol resources. The fallback image-icon route is not equivalent to a rigged weapon held in the character's hand.
- **Gap:** `_get_armor_tier()` groups multiple distinct item IDs into just four tiers (some misleadingly). A tier overlay cannot guarantee that each actual armor item looks unique.
- **Gap:** fixed `z_index` layering and `_sync_animation` alone cannot prove proper front/back occlusion, matching frames, correct hand grip, armor masking or all directions.

**Do not rewrite game code as part of this art branch.** OpenCode must validate these gaps and integrate art using focused changes.

## Required component system

```text
character_visual/
  body_base             (phenotype / body rig / age class)
  skin_head_face        (face and skin variation)
  hair_facial_hair      (approved customizable looks)
  torso_outfit          (shirt/coat/jacket)
  leg_outfit            (pants)
  boots_gloves          (distinct visible equipment)
  armor_torso           (item ID)
  armor_shoulders_arms  (item ID, directional occlusion)
  helmet_mask_eyes      (item ID)
  backpack_gear         (item ID)
  hand_grip_left_right  (animation sockets)
  primary_weapon        (actual equipped item ID / grip type)
  offhand_weapon        (if system supports)
  effects_shadow        (below world sprites)
```

**Asset selection** must use authoritative game item IDs, not filename guesses or arbitrary tiers. Support an explicit, versioned `item_id → visual_id → atlas/frames, anchor, grip, skin, draw-order` mapping. Clothing and armor must not stack in ways that duplicate the same baked coat/helmet. Use empty/transparent slots when no item is equipped.

## Required direction and animation contract

- Directions: `S SW W NW N NE E SE` **exactly as project expects**; check actual screen-space orientation before naming generated reference-sheet viewpoints. Do not assume a front-facing turnaround image equals engine `N`.
- All layered frames share canvas dimensions, ground pivot, feet alignment, consistent camera angle and body silhouette per frame.
- Minimum first pass: `idle`, `walk`, `attack`, `hit`, `death`; add `reload`, `use`, `aim`, `equip` where needed.
- For each direction and animation, support `weapon pose/grip` (unarmed, one-handed pistol, two-handed rifle/shotgun, knife/melee, heavy weapon).
- Weapon sprites need **hand attachment anchors** for each facing/frame, consistent front/back draw order, recoil and muzzle origin. Wearing armor may change hand offsets.
- Separate back-facing gear from arm/weapon overlays according to orientation; validate clipping on every animation.
- Do not rely on static inventory icons as world sprites.

## Acceptance tests — mandatory for actual gameplay

1. Equip pistol → correct visible pistol in hand for 8 directions, attack and idle; holster/unequip → gone.
2. Switch pistol → rifle → knife → unarmed; each switches pose/hand anchor and animation, not just inventory data.
3. Equip leather → metal → advanced armor → no armor: torso, arms and legs visibly change and match item ID.
4. Equip and remove helmet, mask and backpack; head/body layers and occlusion are correct.
5. NPC/companion equipment changes and shows in world, inventory preview and combat.
6. Save/load rehydrates visual state; no missing texture or stale weapon after scene changes.
7. 8 directions × key actions: no floating weapons, double armor, missing frames, disappearing hands, wrong left/right order.
8. Original damage, AP and defense mechanics remain unchanged; rendering is a presentation layer.
9. Capture real Android screenshots and tests. Do not mark any art asset `IN_GAME_VERIFIED` before runtime evidence.

## Production priority

**First:** one human player baseline + unarmed/pistol/rifle/knife, and leather/metal armor sets, *complete 8-direction idle/walk/attack coverage*.  
**Next:** second adult body type, raider and civilian variations, age/ethnic diversity, helmets/masks, backpacks.  
**Then:** creatures, heavy weapons, additional armor variants and portrait-level detail.

A full-body 8-pose concept sheet is a **turnaround reference**, not 8 aligned per-frame production sprites. Produce isolated per-direction PNG/atlas frames after pivots and attachment validation.
