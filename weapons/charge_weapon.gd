extends Weapon
@onready var ice_particles: GPUParticles2D = $IceParticles
var charge_time : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left"):
		charge_time += delta
		if charge_time > 0.4 :
			ice_particles.emitting = true
		if charge_time > 1.4 :
			ice_particles.amount = 12
		else :
			ice_particles.amount = 5
	else :
		if charge_time > 0.5 :
			_shoot()
			charge_time = 0
			ice_particles.emitting = false
		else :
			charge_time = 0
			ice_particles.emitting = false

func _shoot():
	var bullet_instance := weapon.bullet_type.instantiate()
	bullet_instance.global_position = global_position
	bullet_instance.global_rotation = global_rotation
	bullet_instance.speed = weapon.bullet_speed
	bullet_instance.max_range = weapon.bullet_max_range
	bullet_instance.max_random_angle = weapon.bullet_max_random_angle
	bullet_instance.damage = weapon.bullet_damage
	if charge_time > 1.5 :
		bullet_instance.global_scale = Vector2(1.2 , 1.2)
		bullet_instance.damage = weapon.bullet_damage + 2
	bullet_sound.play()
	get_tree().current_scene.add_child(bullet_instance)
	
