extends Node

class_name E

enum GameState {
	NEW_GAME,
	RUNNING,
	GAME_OVER,
	PAUSED,
}

enum CharacterClass {
	BASIC,
	MAGIC,
	MILITARY,
	SUPPORT,
}

enum AttackType {
	DART,
	BULLET,
	SPELL,
	MELEE,
}

enum BulletPhysModifier {
	BOUNCING,
	POP,
}
