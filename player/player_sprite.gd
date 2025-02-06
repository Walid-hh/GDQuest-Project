extends Sprite2D

const GODOT_BOTTOM = preload("res://player/godot_bottom.png")
const GODOT_BOTTOM_RIGHT = preload("res://player/godot_bottom_right.png")
const GODOT_RIGHT = preload("res://player/godot_right.png")
const GODOT_UP = preload("res://player/godot_up.png")
const GODOT_UP_RIGHT = preload("res://player/godot_up_right.png")
func _process(delta: float) -> void:
	var direction = get_parent().direction
	direction = direction.sign()
	if direction.length() > 0 :
		flip_h = direction.x < 0
	match direction :
		Vector2.RIGHT , Vector2.LEFT:
			texture = GODOT_RIGHT
		Vector2.RIGHT + Vector2.UP , Vector2.LEFT + Vector2.UP:
			texture = GODOT_UP_RIGHT
		Vector2.RIGHT + Vector2.DOWN , Vector2.LEFT + Vector2.DOWN:
			texture = GODOT_BOTTOM_RIGHT
		Vector2.DOWN:
			texture = GODOT_BOTTOM
		Vector2.UP:
			texture = GODOT_UP
