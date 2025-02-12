extends Resource
class_name WeaponClass

@export var bullet_type : PackedScene
@export_range(400.0 , 1200.0) var bullet_speed := 600.0
@export_range(400.0 , 1800.0) var bullet_max_range := 1800.0
@export_range(0.05 , 0.5) var bullet_max_random_angle := 0.05
@export_range(1 , 3) var bullet_damage := 1
