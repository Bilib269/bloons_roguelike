extends Node2D


const BULLET_SPEED = 1200.0


var phys_mod : float
var damage : float
var bounces : int
var bouncing : bool

var bullet_phys_mod = E.BulletPhysModifier


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_damage(value: float) -> void:
	damage = value


func get_damage() -> float:
	return damage


func apply_phys_mod(type) -> void:
	bullet_phys_mod = type
	match bullet_phys_mod:
		E.BulletPhysModifier.BOUNCING:
			bouncing = true
		E.BulletPhysModifier.POP:
			bouncing = false
