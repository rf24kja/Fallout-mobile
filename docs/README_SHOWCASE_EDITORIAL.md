# RADZONE GitHub Landing Page — editorial rules

The repository root README is a **multilingual visual introduction to the game**, not a technical changelog or a fictional screenshot gallery.

- English `README.md` is the GitHub landing page. The other seven README translations are complete standalone pages.
- First three approved images deliberately replace the previous wide banner with a large empty text panel; the project owner requested this change.
- All ten `github-assets/approved/v2/` images are concept art and must **never** be called screenshots from Godot or Android.
- Two WIP previews under `github-assets/showcase/` are archived previews derived from the art staging branch; they show actual candidate files, **not proven in-engine output**.
- Each page distinguishes **goals** from **verified features** and links to actual development documentation.
- Keep language links and the order of 12 illustrations consistent across translations.
- Do not add download/Play Store badges, ratings, user counts, live gameplay claims, release dates or invented test metrics.
- Github-Flavored Markdown and allowed GitHub HTML are the platform: no CSS/JS is required, and all graphics live in this repository rather than on a remote badge/tracking service.
- Validate after edits: `python tools/docs/validate_readme_showcase.py` from repository root. Docs-only changes must not launch art/Android publishing workflows.
- Keep image payloads optimized; do not add original 10-megabyte concept masters to the README.

Approved reference design: `docs/ART_DIRECTION_RADZONE.md`; status: `PROJECT_STATE.md`; staged graphics PR: #28.