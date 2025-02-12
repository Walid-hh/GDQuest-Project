extends Node2D
class_name HealthComponent
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var hurt_sound = %HurtSound
@onready var death_sound = %DeathSound
@export var max_health := 5
var health := max_health :
	set = set_health

func set_health(new_health):
	health = clampi(new_health , 0 , max_health)
	if health == 0:
		if get_parent() is Mob:
			var mob_death_sound : AudioStreamPlayer2D = death_sound
			mob_death_sound.reparent(get_node("/root/Level"))
			mob_death_sound.play()
			mob_death_sound.finished.connect(mob_death_sound.queue_free)
			get_parent().queue_free()
		elif get_parent() is Player:
			animation_player.call_deferred("stop")
			death_sound.play()
			get_parent().set_physics_process(false)
			get_parent().weapon.set_physics_process(false)
			get_parent().hit_box.get_child(0).set_deferred("disabled" , true)

func damage(attack : Attack) :
	animation_player.call_deferred("play" , "take_damage")
	hurt_sound.play()
	set_health(health - attack.attack_damage)

func heal(heal : Heal):
	animation_player.play("heal")
	set_health(health + heal.heal_amount)
