extends Bullet

func _ready() -> void:
	area_entered.connect(func(area) -> void :
		if area is HitBoxComponent:
			if area.get_parent() is Mob :
				var attack = Attack.new()
				attack.attack_damage = damage
				attack.knockback_force = knockback
				attack.attack_position = global_position
				area.damage(attack)
				)
	_initial_position = position
	var bullet_max_rotation := rotation
	direction = Vector2.RIGHT.rotated(bullet_max_rotation)
