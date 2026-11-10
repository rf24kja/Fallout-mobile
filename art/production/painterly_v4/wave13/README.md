# RADZONE — Wave 13 / settlement interior and street props

**Status: candidate game-textures, not in-game verified.**

This pack publishes **10 distinct illustrated objects** as **20 transparent PNG images** (128px / 256px) and **10 instantiable Godot Node2D+Sprite2D prefab scenes**. All objects were postprocessed from a single 1536×1024 *AI-generated composite poster*, not separately generated source sprites.

Objects: glass market display, antique cash register, canned-goods shelf, rusty dumpster, medical gurney, public-address loudspeaker pole, air-conditioning unit, dual floodlight, notice board, and leather armchair. Compared with existing v4 waves, these are new **object types** rather than recycled existing inventory icons, but the source remains only a composite.

The generated poster was NOT saved as a shipped game asset: it included fictional project-progress claims and IP-adjacent signage. No claim of 42 created/verified objects is valid.

Real checks: PNG signature, RGBA alpha, decode, dimensions, SHA-256; static Godot resource references. Unrealized checks: Godot runtime import, collisions, scale and draw-order, Android runtime, aesthetic/rights approval. Upscaling low-detail source regions to 256px **does not create additional native detail**.

Import the preview scene only in an isolated Godot test run. Existing gameplay/resources/SPECIAL and Android release build remain untouched; do not merge without reviewed screenshots and runtime QA.

The exact provenance and source rectangles are in `manifest.json`.