# RADZONE — two-stage duplicate art gate

1. **Semantic type IDs**: `python tools/art_check_duplicates.py candidate_manifest.json`. This rejects a repeat item category even when the new picture is visually different.
2. **Pixel/perceptual matches**: `python tools/art_visual_duplicate_gate.py candidate_manifest.json`. This uses cropped-alpha grayscale dHash + aHash to reject nearly identical images and resized copies, even when given different IDs.

The second command needs `python -m pip install pillow`. **Both must pass** before an asset PR is considered for manual review. Art is **not game-ready** until internal alpha holes, edge halos, perspective, art style and Android runtime have been verified.

This is intentionally a conservative pixel-level check: it cannot identify an independently drawn depiction of the same kind of object. Such semantic duplicates are handled by the first script plus a human check. Reject any AI batch that keeps regenerating existing items rather than uploading a second copy as new art.
