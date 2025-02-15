extends Area2D

@export var dialogue_box : DialogueBox
var player_in_area := false
var dialogue : Control
var player : Player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dialogue = get_node("/root/Level/CanvasLayer/Dialogue")
	area_entered.connect(func(area : Node2D) -> void :
		if area is HitBoxComponent:
			if area.get_parent() is Player:
				player = area.get_parent()
				player_in_area = true
				)
	area_exited.connect(func(area : Node2D) -> void :
		if area is HitBoxComponent:
			if area.get_parent() is Player:
				player_in_area = false
				)

func _unhandled_input(event: InputEvent) -> void:
	if player_in_area :
		if event.is_action_pressed("E_key"):
			player.set_physics_process(false)
			var tween := create_tween()
			dialogue.show_text(0)
			dialogue.visible = true
			tween.tween_property(dialogue , "modulate:a" , 1 , 0.5)
			tween.finished.connect(tween.kill)
