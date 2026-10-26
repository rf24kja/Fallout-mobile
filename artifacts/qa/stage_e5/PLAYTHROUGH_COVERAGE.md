# Stage E.5 Audit — Playthrough Coverage

## 14-Step Full Vertical Slice Playthrough Coverage Analysis

### Steps Exercising Real Godot Scenes/UI Interactions

| Step | Scene/UI | Description |
|------|----------|-------------|
| 2 | Dialogue system | Open interaction, select dialogue option, consequence applies SET_QUEST_FLAG |
| 3 | Quest system | QuestManager registers activated quest, GameManager.quest_flags updated |
| 5 | Inventory system | add_item("power_cell", 1) validates item_database lookup, inventory.items array updated |
| 6 | Inventory system | get_equipped("weapon_primary"), equip_item("weapon_primary", instance) — equipment slot assignment, stat bonuses calculated |
| 10 | Dialogue system | start_dialogue("lost_power_cell"), get_available_options(), select_option(i) with DialogueOption object |

### Steps Using Direct System-Method Calls (No Scenes)

| Step | System Method | Description |
|------|--------------|-------------|
| 1 | CharacterSystem._init_default_character() | Fresh character setup with default stats, skills, equipment |
| 4 | GameManager.get_quest_flag("lost_power_cell") | Flag state check after dialogue consequence |
| 7 | CombatSystem.start_combat(participants) | Creates combat encounter, turn order, initial AP |
| 8 | CombatSystem.perform_attack_direct("player", "raider_1") | Bypasses turn system, AP regeneration added in test |
| 9 | CombatSystem.force_end_combat() | Ends current combat encounter |
| 11 | CharacterSystem.character_data.xp | Verify XP gain: 0 → 100 after quest completion |
| 12 | SaveSystem.save_game(1) | Persist game state to slot 1 |
| 13 | SaveSystem.get_save_data(1) / GameManager.load_save_data() | Load persisted state from slot 1 |
| 14 | GameManager.player_data.xp / level / item counts | Verify persistent state after load |

### Steps Not Genuinely Exercised Through Gameplay

| Step | Reason |
|------|--------|
| 6 (equip fallback) | Uses default weapon dict when no item equipped; not a real in-game acquisition flow |
| 12-14 | Save/load operations verify data persistence but don't test full user-driven save/load cycle |

### Summary

- **6 steps** exercise real Godot scenes/UI interactions (dialogue, quest, inventory equipment)
- **8 steps** use direct system-method calls (character init, combat, save/load, state verification)
- **0 steps** fully exercise touchscreen playability from launcher to completion
- **The playthrough test validates system integration**, not touchscreen UI playability

## Test 21 — Full Vertical Slice Playthrough Coverage

**Total steps:** 14  
**Real UI interactions:** 4 (steps 2, 3, 5, 6)  
**System calls:** 10 (steps 1, 4, 7, 8, 9, 11, 12, 13, 14)  
**Not genuinely exercised:** 0 steps that would prove touchscreen playability from scratch  

The test validates that all systems integrate correctly through an end-to-end workflow, but does not prove the game is playable via touchscreen from the main menu.