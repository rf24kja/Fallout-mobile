class_name Constants
extends Node

## Shared constants and enums used across the project.

enum GameState {
	MAIN_MENU,
	PLAYING,
	PAUSED,
	DIALOGUE,
	COMBAT,
	INVENTORY,
	WORLD_MAP,
	GAME_OVER
}

enum InteractionType {
	TALK,
	PICKUP,
	USE,
	INSPECT,
	CUSTOM
}

enum ItemType {
	WEAPON,
	ARMOR,
	CONSUMABLE,
	AMMO,
	MISC,
	QUEST,
	KEY
}

enum QuestStatus {
	NOT_STARTED,
	STARTED,
	COMPLETED,
	FAILED
}