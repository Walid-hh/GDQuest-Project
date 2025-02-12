extends CharacterBody2D
class_name Player

@export var hit_box: HitBoxComponent 
@onready var weapon: Node2D = %Weapon
const SPEED := 500.0
const ACCELERATION := 1400.0
const DECELERATION := 1200.0
var direction : Vector2

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("move_left" , "move_right" , "move_up" , "move_down")
	direction = direction.sign()
	direction = direction.normalized()
	var desired_velocity := direction * SPEED
	if direction.length() > 0:
		velocity = velocity.move_toward(desired_velocity , ACCELERATION * delta)
	else :
		velocity = velocity.move_toward(Vector2.ZERO , DECELERATION * delta)
	move_and_slide()
