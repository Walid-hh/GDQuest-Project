extends Area2D

var speed : float
var max_range : float
var _initial_position : Vector2
var direction : Vector2
var max_random_angle := 0.1
var damage := 1
var knockback := 100.0

func _ready() -> void:
	area_entered.connect(func(area) -> void :
		if area is HitBoxComponent:
			if area.get_parent() is Mob :
				var attack = Attack.new()
				attack.attack_damage = damage
				attack.knockback_force = knockback
				attack.attack_position = global_position
				area.damage(attack)
				_destroy())
	_initial_position = position
	var bullet_rotation := randf_range(rotation - max_random_angle , rotation + max_random_angle)
	direction = Vector2.RIGHT.rotated(rotation)

func _physics_process(delta: float) -> void:
	var velocity := direction * speed
	position += velocity * delta
	var distance_traveled := _initial_position.distance_to(position)
	if distance_traveled > max_range :
		_destroy()

func _destroy() -> void :
		queue_free()


	
