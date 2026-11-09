# AGENTS.md — Fallout 2 Reborn Mobile

## Agent Guidelines

### Primary Agent: Technical Supervisor
- Verifies environment, configures tools, directs reverse-engineering work
- Maintains `PROJECT_STATE.md` as single source of truth
- Implements, tests and improves actual Godot game code — not merely tooling/analysis

### Sub-agents (when delegated)
- **executor**: Implements tooling fixes, writes scripts, runs REA commands
- **explore**: Codebase exploration, file searches, pattern matching
- **general**: Research, multi-step analysis tasks

## Communication Rules
- Report in Russian
- Concise: verified state, issues, changes, tests, blockers, next action
- No success claims without validation
- Preserve original Fallout 2 files (READ-ONLY)

## Tool Usage
- REA CLI preferred over MCP for targeted analysis
- Context target: < 60K tokens active
- Use `ctx_execute`/`ctx_batch_execute` for data processing
- Keep comprehensive analysis in files, not conversation

## Workflow
1. Verify current state from `PROJECT_STATE.md`
2. Run minimal verification (REA CLI, context stability)
3. Fix one blocker at a time (Ghidra → REA analysis → MCP re-enable)
4. Update `PROJECT_STATE.md` after each meaningful task
5. Restart session if context exceeds 80K tokens

## Forbidden
- Modifying `C:\Code\REA_FALLOUT\Fallout2\` files
- Installing unrelated tools
- Re-enabling REA MCP before context fix validated
- Building AnyPS5 from source

---

## Canonical Project Paths

| Path | Description |
|------|-------------|
| `C:\Code\REA_FALLOUT\Fallout2_Reborn_Mobile` | Godot project (Git repo root) |
| `C:\Code\REA_FALLOUT\Fallout2` | Original Fallout 2 installation (READ-ONLY) |
| `https://github.com/rf24kja/Fallout-mobile.git` | GitHub remote |

## Correct Development Objective

**This is a Fallout 2 adaptation, NOT an original IP inspired by Fallout.**

### Preserve Original Fallout 2 Foundations
- SPECIAL and all related calculations
- Character creation, traits, perks, skills, leveling
- Combat mechanics and action points
- Damage, DT/DR, critical hits, aimed attacks
- Original weapons, ammunition, armor statistics
- Inventory and equipment behavior
- NPC interaction and AI
- Dialogue and quests
- Original locations and world structure
- Reputation and factions
- Companions and world states
- Saving and loading
- Original gameplay logic and balance

### Allowed Improvements
- Complete graphical modernization
- High-quality assets and character animations
- Cinematic effects and lighting
- Mobile-oriented user interface
- Touchscreen controls
- Performance optimization
- New weapons, equipment, quests, characters, locations

**New content extends the original foundation. It must not replace, weaken, or simplify it.**

## Engine & Version Information

| Component | Version |
|-----------|---------|
| Godot | 4.7.2 |
| Android SDK | API 31+ |
| Java | 17+ |
| Export Templates | Godot 4.7.2 standard |

## GitHub Synchronization Rules

1. **Branch**: `main` (remote) / `master` (local) for verified baselines
2. **Feature branches**: `fix/...`, `feature/...`, `art/...`
3. **Commit format**: `type(scope): description`
   - Examples: `fix(android): correct APK signing`, `feat(combat): align AP calculations`
4. **Before push**: Inspect diff → Check secrets → Run tests → Commit → Push → Verify remote
5. **Frequency**: After every meaningful verified milestone + end of session
6. **Never**: Force-push, rewrite history, push broken builds

## Build & Test Commands

```bash
# Verify project opens
godot --headless --check-only

# Run tests (when available)
godot --headless --script tests/run_tests.gd

# Export Android debug
godot --headless --export-debug "Android" builds/android/Fallout2_Reborn_Mobile_Debug.apk

# Verify APK
apksigner verify --print-certs builds/android/Fallout2_Reborn_Mobile_Debug.apk

# Install to device
adb install -r builds/android/Fallout2_Reborn_Mobile_Debug.apk

# View logs
adb logcat -s Godot
```

## Fidelity Requirements

**NEVER approximate mechanics if exact behavior can be verified.**

Verification sources (in priority order):
1. REA binary analysis of `fallout2.exe`
2. Ghidra decompilation
3. Original game behavior testing
4. Existing verified Godot implementations
5. Fallout 2 wiki/documentation (last resort)

## Prohibited Destructive Operations

- `git reset --hard` without explicit approval
- `git push --force` 
- Deleting working APKs or build artifacts
- Modifying original Fallout 2 installation files
- Replacing functioning architecture without evidence
- Declaring success without actual verification

## Documentation Update Requirements

After each meaningful task, update:
- `PROJECT_STATE.md` — Current verified status
- `NEXT_ACTIONS.md` — Prioritized development queue
- `DEVELOPMENT_HISTORY.md` — Major milestones
- `FALLOUT2_FIDELITY_MATRIX.md` — Mechanics verification

All documentation must be committed and pushed to GitHub.

---

## Quick Reference for New AI Agents

**To resume development:**
1. Read this `AGENTS.md`
2. Read `docs/PROJECT_MANDATE.md` — Product requirements
3. Read `docs/PROJECT_STATE.md` — Current status
4. Read `docs/NEXT_ACTIONS.md` — What to do next
5. Run `git status` and `git log -5 --oneline`
6. Open project in Godot 4.7.2
7. Verify latest APK works: `adb install builds/android/Fallout2_Reborn_Mobile_Debug.apk`

**The project is recoverable from GitHub alone.** Original Fallout 2 installation is only needed for reference/reverse engineering.