extends Node2D
@export var weapon : Weapon


func _physics_process(delta: float) -> void :
	_shoot()

func _shoot() -> void :
	if Input.is_action_just_pressed("mouse_left"):
		var bullet_instance := weapon.bullet_type.instantiate()
		bullet_instance.global_transform = global_transform
		bullet_instance.speed = weapon.bullet_speed
		bullet_instance.max_range = weapon.bullet_max_range
		bullet_instance.max_random_angle = weapon.bullet_max_random_angle
		bullet_instance.damage = weapon.bullet_damage
		get_tree().current_scene.add_child(bullet_instance)
