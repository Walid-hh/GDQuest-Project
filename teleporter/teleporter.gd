extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(func(area : Node2D) -> void :
		if area is HitBoxComponent:
			if area.get_parent() is Player :
				get_node("../CanvasLayer/EndMenu").toggle()
				get_tree().paused = true
				)
