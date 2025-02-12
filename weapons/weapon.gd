extends Node2D
class_name Weapon
@export var weapon : WeaponClass
@onready var bullet_sound: AudioStreamPlayer = %BulletSound


func _physics_process(delta: float) -> void :
	if Input.is_action_just_pressed("mouse_left"):
		_shoot()

func _shoot() -> void :
	var bullet_instance := weapon.bullet_type.instantiate()
	bullet_instance.global_transform = global_transform
	bullet_instance.speed = weapon.bullet_speed
	bullet_instance.max_range = weapon.bullet_max_range
	bullet_instance.max_random_angle = weapon.bullet_max_random_angle
	bullet_instance.damage = weapon.bullet_damage
	bullet_sound.play()
	get_tree().current_scene.add_child(bullet_instance)
	
