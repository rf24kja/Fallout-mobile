# Quest Design Principles — Systemic Benchmark

## Purpose

Define the **minimum quality bar** for every quest in our product, benchmarked against Fallout 2's best quest design. Not a copy — a standard.

---

## 1. Core Design Pillars

### 1.1 Multiple Solutions (The "Rule of Three")
**Every major quest must offer ≥3 distinct resolution paths.**

| Path Type | Mechanics | Example |
|-----------|-----------|---------|
| **Combat** | Fight through/kill target | Assault the compound |
| **Stealth** | Sneak, avoid, steal | Infiltrate at night, steal key |
| **Social** | Dialogue, persuasion, deception | Talk leader into surrender |
| **Skill** | Science/Repair/Lockpick/Doctor | Hack terminal, repair reactor, pick lock |
| **Economic** | Bribe, buy, trade | Pay off guards, buy intel |
| **Exploration** | Find alternate route | Discover sewer entrance |
| **Faction** | Ally with third party | Recruit rivals to attack |

**Minimum**: 3 paths per major quest. 2 paths per minor quest.

### 1.2 Skill-Gated Options (Visible & Hidden)
**Skills must gate meaningful alternatives, not just flavor text.**

| Skill | Dialogue Gate | World Gate | Quest Example |
|-------|---------------|------------|---------------|
| Speech | Persuade/Intimidate/Lie | — | Talk down hostage taker |
| Science | Technical lie, hack | Terminal, robot | Reprogram defender bots |
| Repair | Fix equipment | Generator, door | Restore power to open vault |
| Lockpick | — | Doors, containers | Enter via back entrance |
| Sneak | — | Patrol bypass | Plant evidence unseen |
| Doctor | Medical knowledge | Heal NPC, autopsy | Prove poisoning vs natural |
| Barter | Better deals | Vendor prices | Buy key item cheaper |
| Outdoorsman | Track, survive | World map, ambush | Find hidden camp |
| Traps | — | Disarm, set | Booby-trap enemy path |
| Gambling | — | Casino intel | Win access to back room |

**Rule**: If a skill check exists, failure must have consequences (not just "try again").

### 1.3 Consequence Persistence
**Choices must echo beyond the quest.**

| Consequence Type | Implementation |
|------------------|----------------|
| **Reputation** | Town/faction standing changes ± |
| **World State** | NPCs dead/alive, buildings destroyed, items moved |
| **Economy** | Prices shift, vendors appear/disappear |
| **Quest Availability** | New quests unlock, others close |
| **Companions** | Join/leave based on morality |
| **Ending Slides** | Epilogue reflects major choices |

### 1.4 Moral Ambiguity
**No "Good vs Evil" — only competing interests.**

| False Choice | Real Choice |
|--------------|-------------|
| Save orphans vs burn orphans | Support ruthless leader who feeds people vs idealist who starves them |
| Kill bandits vs spare bandits | Exterminate raiders (safe roads) vs recruit them (unstable ally) |
| Give water to village vs keep it | Distribute fairly (loyalty) vs sell to highest bidder (funds war) |

---

## 2. Quest Structure Template

### 2.1 Major Quest Blueprint
```
QUEST: [Title]
TYPE: Main / Faction / Companion / Exploration
LOCATION: [Settlement/Region]
LEVEL RANGE: [Min-Max]

HOOKS (3+ entry points):
  - NPC dialogue
  - Environmental clue
  - Rumor/note
  - Companion comment

OBJECTIVE: [Clear, one sentence]

PATHS:
  Path A: [Combat] — [Requirements] — [Consequences]
  Path B: [Stealth/Skill] — [Requirements] — [Consequences]
  Path C: [Social] — [Requirements] — [Consequences]
  Path D: [Alternate] — [Requirements] — [Consequences]

BRANCHING:
  - Decision Point 1: [Choice] → [Outcome A/B/C]
  - Decision Point 2: [Choice] → [Outcome A/B/C]

REWARDS:
  - XP: [Amount]
  - Reputation: [Faction ±Value]
  - Items: [Specific, not random]
  - Unlocks: [Quest, vendor, area, companion]

FAILURE STATES:
  - Time limit missed → [Consequence]
  - Key NPC killed → [Consequence]
  - Evidence destroyed → [Consequence]

NOTES:
  - Skill checks: [List with DCs]
  - Companion reactions: [Per companion]
  - World changes: [Persistent flags]
```

### 2.2 Current Prototype Quest Audit

| Quest | Paths | Skill Gates | Consequences | Moral Ambiguity | Status |
|-------|-------|-------------|--------------|-----------------|--------|
| Power Cell Delivery | 2 (keep/return) | INT 7 only | Minor rep | None | ❌ Below bar |

**Required**: 8-12 major quests for vertical slice, each meeting full template.

---

## 3. Quest Design Patterns (FO2 Benchmarks)

### 3.1 The "Den Slavers" Pattern — Multi-Faction Infiltration
**Structure**: 
- Faction A controls area
- Faction B wants it
- Player can: help A, help B, betray both, negotiate truce
- Each path uses different skills
- Reputation shifts for all 3 factions

**Our Application**: Settlement caught between Raiders, Militia, Traders.

### 3.2 The "Vault City" Pattern — Bureaucracy as Obstacle
**Structure**:
- Goal behind institutional wall
- Multiple departments (Science, Medical, Admin, Security)
- Each requires different skill/approach
- Can bypass via corruption, force, merit, or insider
- Citizens have side quests revealing corruption

**Our Application**: Bunker archive access controlled by AI overseer.

### 3.3 The "New Reno" Pattern — Vice Economy
**Structure**:
- Multiple crime families
- Each offers work
- Working for one angers others
- Can play them against each other
- Ultimate choice: destroy all, rule one, or burn it down

**Our Application**: Trading hub with 3 merchant houses + underground.

### 3.4 The "Broken Hills" Pattern — Resource Conflict
**Structure**:
- Resource (uranium/water/tech) needed by all
- Miners vs Refiners vs Town
- Environmental hazard (radiation/mutants)
- Solution requires technical + social
- No perfect outcome — compromise or domination

**Our Application**: Water purification plant in contested zone.

### 3.5 The "Enclave" Pattern — Revealed Truth
**Structure**:
- Early hints of greater threat
- Mid-game reveal changes context
- Previous choices gain new meaning
- Final act: confront or join
- Multiple endings based on accumulated reputation

**Our Application**: Pre-war AI network waking up.

---

## 4. Dialogue Writing Standards

### 4.1 Node Structure
```json
{
  "id": "npc_greeting_01",
  "speaker": "npc_id",
  "text": "Written as spoken dialogue. No narration.",
  "options": [
    {
      "text": "[Speech 50%] 'I can pay double.'",
      "condition": "skill:speech >= 50",
      "next": "npc_bribe_success",
      "skill_check": { "skill": "speech", "dc": 50, "visible": true }
    },
    {
      "text": "'What do you know about the water plant?'",
      "condition": "quest:water_plant_active",
      "next": "npc_water_info"
    },
    {
      "text": "[Science] 'The filtration system is failing.'",
      "condition": "skill:science >= 60",
      "next": "npc_science_talk",
      "skill_check": { "skill": "science", "dc": 60, "visible": true }
    },
    {
      "text": "'Never mind.'",
      "next": "exit"
    }
  ]
}
```

### 4.2 Skill Tag Format
- **Visible**: `[Skill X%]` — player knows requirement
- **Hidden**: No tag — roleplay reward for attentive players
- **Failed**: Grayed out with DC shown (option exists but fails)

### 4.3 Writing Rules
1. **No exposition dumps** — info through conflict
2. **NPCs have agendas** — they lie, omit, manipulate
3. **Player voice varies** — options reflect stats (Low INT = simple, High IN = technical)
4. **Consequences in text** — "He hesitates, glancing at his guards" not "He likes you now"

---

## 5. Quest Implementation Requirements

### 5.1 Data-Driven Format
```
data/quests/
├── main_questline.json
├── faction_raiders.json
├── faction_militia.json
├── faction_traders.json
├── companion_*.json
└── side_*.json
```

### 5.2 Required Engine Features
| Feature | Current | Needed |
|---------|---------|--------|
| Quest flags | ✅ Basic | Persistent, namespaced |
| Reputation | ❌ | Per-faction, per-settlement |
| Time limits | ❌ | In-game days, visible timer |
| Companion reactions | ❌ | Per-companion affinity |
| World state persistence | ⚠️ Partial | NPC death, building damage, item movement |
| Dynamic dialogue | ⚠️ Basic | Condition: reputation, time, world flags |

---

## 6. Vertical Slice Quest List (Target)

| # | Quest | Type | Region | Paths | Key Skills |
|---|-------|------|--------|-------|------------|
| 1 | **The Waking Archive** | Main | Bunker | 4 | Science, Speech, Lockpick, Combat |
| 2 | **Water War** | Faction | Oasis | 3 | Barter, Repair, Combat, Sneak |
| 3 | **Raider's Bargain** | Faction | Raider Camp | 4 | Speech, Sneak, Traps, Combat |
| 4 | **Militia's Honor** | Faction | Militia Outpost | 3 | Speech, Doctor, Outdoorsman, Combat |
| 5 | **Trader's Route** | Faction | Caravan Hub | 4 | Barter, Repair, Science, Combat |
| 6 | **Ghost in the Machine** | Companion | Ruined Lab | 3 | Science, Repair, Speech |
| 7 | **The Last Harvest** | Side | Farmstead | 3 | Doctor, Outdoorsman, Repair |
| 8 | **Silent Frequency** | Side | Radio Tower | 3 | Science, Lockpick, Sneak |
| 9 | **Buried Truth** | Exploration | Pre-war Vault | 4 | Science, Repair, Lockpick, Combat |
| 10 | **Feast or Famine** | Main | Region | 5 | All (capstone) |

---

## 7. Quality Checklist (Per Quest)

- [ ] ≥3 resolution paths with different primary mechanics
- [ ] ≥2 skill-gated dialogue options (different skills)
- [ ] ≥1 world-interaction gate (lockpick, repair, science, sneak)
- [ ] Meaningful failure state (not just "quest failed")
- [ ] Persistent consequence (reputation, world, economy, companion)
- [ ] No "correct" choice — each path has costs
- [ ] NPCs react to player reputation/previous choices
- [ ] Companion has opinion (if companion active)
- [ ] Rewards match effort/risk (not just XP)
- [ ] Can be discovered organically (not just marker)

---

*Document Version: 1.0*  
*Date: 2026-10-21*  
*Author: Lead Quest Designer*  
*Status: DESIGN COMPLETE — Awaiting Implementation*