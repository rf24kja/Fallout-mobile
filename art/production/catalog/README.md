# RADZONE — Single source of truth for art subjects

[Current snapshot](./asset_registry.json) · [Duplicate audit](./AUDIT_2026-11-10.md) · [Validator](../../../tools/art/asset_uniqueness_guard.py)

### Why this exists
Different renders and sizes of a pump shotgun, pistol or generator are **not** new gameplay objects. A valid PNG can still be redundant, wrongly labelled, too low-resolution or unsuitable for a real Godot map.

**Current registry scope:** 16 manifests across `master` and three named art staging branches. Includes character poses and UI references, not only inventory/world objects. This is not a count of unique in-game items. No automatic merge to `master` is implied.

### Use in Windows PowerShell 5.1

```powershell
# Audit catalog metadata (no GitHub Actions or paid services required).
python tools/art/asset_uniqueness_guard.py --audit --report artifacts/art_review/duplicate_audit.json

# Check an ID BEFORE image generation (name-only; not a pixel scan).
python tools/art/asset_uniqueness_guard.py --candidate-id reinforced_knee_guards

# After saving a real PNG, compare it to accessible checkout files.
python tools/art/asset_uniqueness_guard.py --candidate-id reinforced_knee_guards --candidate-image C:\Code\REA_FALLOUT\art_staging\reinforced_knee_guards.png --reference-root master=C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile

# Run 6 local unit tests.
python -m unittest discover -s tests -p test_asset_uniqueness_guard.py -v
```

Use additional `--reference-root REF=DIR` arguments for each staging branch worktree. Without the original reference PNGs, the CLI explicitly reports missing image comparisons instead of claiming uniqueness. Exit code `2` means duplicate, review required or incomplete; exit `0` for a candidate only when no known match was found and the requested visual comparison completed. **Even exit 0 is not automatic human approval.**

### Maintenance contract

For **each new visual object** in a PR:
1. Check canonical ID and semantic family using this catalog.
2. Decide whether it is a new subject or a derivative/alternate view of an existing subject. A variant must keep the parent ID and must not increase unique-subject counts.
3. If genuinely new, add its source-manifest entry to `asset_registry.json` in the same PR, with actual SHA-256, path, Git ref, generation provenance and classification.
4. Keep unapproved art staged. Only a human review + running Godot/Android QA can promote it to production.
5. Update the audit report and run unit tests. Do not delete old art automatically.

**No GitHub Actions added** to preserve GitHub minutes; OpenCode runs this guard locally before any art work.
