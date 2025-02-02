extends Node2D


@onready var game_state := E.GameState.NEW_GAME


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and not game_state == E.GameState.PAUSED:
		game_state = E.GameState.PAUSED
	# Handle behaviour during different game_states. 
	match game_state:
		E.GameState.NEW_GAME:
			print(game_state)
		E.GameState.RUNNING:
			pass
		E.GameState.PAUSED:
			print(game_state)
		E.GameState.GAME_OVER:
			pass
