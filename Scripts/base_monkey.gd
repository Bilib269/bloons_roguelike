extends CharacterBody2D


const SPEED = 300.0
const HEALTH = 100


var player_pos : Vector2
var direction_player_cursor : Vector2
var class_vel : float
var class_health_offset : int
var class_health : int: 
	get:
		return HEALTH + class_health_offset

var character_class = E.CharacterClass


func _ready() -> void:
	apply_class(E.CharacterClass.BASIC)


func _physics_process(delta: float) -> void:
	handle_input_movement(delta)
	player_pos = self.position
	direction_player_cursor = player_pos.direction_to(get_viewport().get_mouse_position())
	handle_input_shoot(direction_player_cursor)


func handle_input_shoot(direction: Vector2) -> void:
	print(direction)


func handle_input_movement(delta: float) -> void:
	match character_class:
		E.CharacterClass.BASIC:
			if Input.is_action_pressed("move_down"):
				velocity.y = SPEED * class_vel
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_up"):
				velocity.y = SPEED * class_vel * -1
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_left"):
				velocity.x = SPEED * class_vel * -1
				velocity.y = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_right"):
				velocity.x = SPEED * class_vel
				velocity.y = 0
				move_and_collide(velocity * delta)
		E.CharacterClass.MAGIC: #mages slide like on ice 
			if Input.is_action_pressed("move_down"):
				velocity.y = SPEED * class_vel
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_up"):
				velocity.y = SPEED * class_vel * -1
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_left"):
				velocity.x = SPEED * class_vel * -1
				velocity.y = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_right"):
				velocity.x = SPEED * class_vel
				velocity.y = 0
				move_and_collide(velocity * delta)
		E.CharacterClass.MILITARY: #movement speed builds up to ms value of basic monkey
			if Input.is_action_pressed("move_down"):
				velocity.y = SPEED * class_vel
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_up"):
				velocity.y = SPEED * class_vel * -1
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_left"):
				velocity.x = SPEED * class_vel * -1
				velocity.y = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_right"):
				velocity.x = SPEED * class_vel
				velocity.y = 0
				move_and_collide(velocity * delta)
		E.CharacterClass.SUPPORT:
			if Input.is_action_pressed("move_down"):
				velocity.y = SPEED * class_vel
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_up"):
				velocity.y = SPEED * class_vel * -1
				velocity.x = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_left"):
				velocity.x = SPEED * class_vel * -1
				velocity.y = 0
				move_and_collide(velocity * delta)
			if Input.is_action_pressed("move_right"):
				velocity.x = SPEED * class_vel
				velocity.y = 0
				move_and_collide(velocity * delta)


## Handle attacking of the player and spawn bullet
func hit() -> void:
	pass


## Apply the configuration for given class type 
func apply_class(type) -> void:
	# Handle class specific variables
	character_class = type
	match character_class:
		E.CharacterClass.BASIC:
			class_health_offset = 0
			class_vel = 0.5
		E.CharacterClass.MAGIC:
			class_health_offset = -30
			class_vel = 0.7
		E.CharacterClass.MILITARY:
			class_health_offset = 30
			class_vel = 0.3
		E.CharacterClass.SUPPORT:
			class_health_offset = -10
			class_vel = 0.9
