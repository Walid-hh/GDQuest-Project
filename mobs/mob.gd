extends CharacterBody2D
class_name Mob

@onready var deactivation_area: Area2D = %DeactivationArea
@onready var activation_area: Area2D = %ActivationArea
@export var hit_box : HitBoxComponent
const MAX_SPEED := 300.0
const ACCELERATION := 600.0
var target : Player
var attack_damage := 1
var knockback := 700
var direction : Vector2

func _ready() -> void:
	activation_area.body_entered.connect(func(body) -> void :
		if body is Player :
			target = body
		)
	deactivation_area.body_exited.connect(func (body) -> void :
		if body is Player :
			target = null
		)
	hit_box.area_entered.connect(func (area) -> void :
		if area is HitBoxComponent :
			if area.get_parent() is Player :
				var attack = Attack.new()
				attack.attack_damage = attack_damage
				attack.attack_position = global_position
				attack.knockback_force = knockback
				area.damage(attack)
			)
func _physics_process(delta: float) -> void:
	if target == null :
		velocity = velocity.move_toward(Vector2.ZERO , ACCELERATION * delta)
	else :
		direction = global_position.direction_to(target.global_position)
		var distance := global_position.distance_to(target.global_position)
		var speed := MAX_SPEED if distance > 120 else MAX_SPEED * distance / 120
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity , ACCELERATION * delta)
		if target.hit_box.health_componnent.health == 0:
			target = null
	if velocity.length() > 0 :
		rotation = direction.angle()
	move_and_slide()
	
	
