@tool
extends Area2D

@export var item_list : Array[Item]
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
var player : Player = null
const PICKUP = preload("res://pickups/pickup.tscn")

func _ready() -> void:
	if not Engine.is_editor_hint():
		area_entered.connect(func(area) -> void :
			if area is HitBoxComponent:
				if area.get_parent() is Player:
					player = area.get_parent()
					)
		area_exited.connect(func(area) -> void :
			if area is HitBoxComponent:
				if area.get_parent() is Player:
					player = null
						)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = []
	if item_list.is_empty():
		warnings.append("Item List is Empty ! Please add an item")
	return warnings

func open() -> void :
	if not Engine.is_editor_hint():
		var item = item_list.pick_random()
		var item_instance = PICKUP.instantiate()
		var tween_duration := 1
		animation_player.play("open")
		item_instance.item = item
		add_child(item_instance)
		var random_angle := randf_range(0.0, 2.0 * PI)
		var random_direction := Vector2.RIGHT.rotated(random_angle)
		var land_position := random_direction * randf_range(60.0, 120.0)
		const FLIGHT_TIME := 0.4
		const HALF_FLIGHT_TIME := FLIGHT_TIME / 2.0

		var tween := create_tween()
		tween.set_parallel()
		item_instance.scale = Vector2(0.25, 0.25)
		tween.tween_property(item_instance, "scale", Vector2(1.0, 1.0), HALF_FLIGHT_TIME)
		tween.tween_property(item_instance, "position:x", land_position.x, FLIGHT_TIME)
		tween = create_tween()
		tween.set_trans(Tween.TRANS_QUAD)
		tween.set_ease(Tween.EASE_OUT)
		var jump_height := randf_range(30.0, 80.0)
		tween.tween_property(item_instance, "position:y", land_position.y - jump_height, HALF_FLIGHT_TIME)
		tween.set_ease(Tween.EASE_IN)
		tween.tween_property(item_instance, "position:y", land_position.y, HALF_FLIGHT_TIME)
		collision_shape_2d.disabled = true

func _unhandled_input(event: InputEvent) -> void:
	if not Engine.is_editor_hint():
		if event.is_action_pressed("ui_accept") and player != null :
			open()
			
