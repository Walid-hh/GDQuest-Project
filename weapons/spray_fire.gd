extends Weapon

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("mouse_left"):
		_shoot()

func _shoot():
	for i in range(8):
		var bullet_instance = weapon.bullet_type.instantiate()
		bullet_instance.global_transform = global_transform
		bullet_instance.speed = weapon.bullet_speed
		bullet_instance.max_range = 400
		bullet_instance.max_random_angle = 0.5
		bullet_instance.damage = weapon.bullet_damage
		bullet_sound.play()
		get_tree().current_scene.add_child(bullet_instance)
