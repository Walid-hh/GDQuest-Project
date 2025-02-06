extends Item
class_name HealthItem

@export var heal_amount : int = 2

func use(player_hit_box : HitBoxComponent):
	if player_hit_box.get_parent() is Player:
		var heal := Heal.new()
		heal.heal_amount = heal_amount
		player_hit_box.heal(heal)
