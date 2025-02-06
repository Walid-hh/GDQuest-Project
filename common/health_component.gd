extends Node2D
class_name HealthComponent
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@export var max_health := 5.0
var health := max_health :
	set = set_health

func set_health(new_health):
	health = clampi(new_health , 0 , max_health)
	if health == 0:
		if get_parent() is Mob:
			get_parent().queue_free()
		elif get_parent() is Player:
			get_parent().set_physics_process(false)
			get_parent().hit_box.get_child(0).disabled = true

func damage(attack : Attack) :
	animation_player.play("take_damage")
	set_health(health - attack.attack_damage)

func heal(heal : Heal):
	animation_player.play("heal")
	set_health(health + heal.heal_amount)
