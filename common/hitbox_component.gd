extends Area2D
class_name HitBoxComponent

@export var health_componnent : HealthComponent

func damage(attack : Attack):
	if health_componnent:
		if get_parent() is CharacterBody2D :
			var parent := get_parent()
			parent.velocity = (global_position - attack.attack_position).normalized() * attack.knockback_force
		health_componnent.damage(attack)

func heal(heal : Heal):
	if health_componnent:
		if get_parent() is Player:
			health_componnent.heal(heal)
