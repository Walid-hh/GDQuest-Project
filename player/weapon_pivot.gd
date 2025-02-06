extends Node2D

var kbm := true
var joystick_direction : Vector2
func _physics_process(delta: float) -> void:
	if kbm :
		look_at(get_global_mouse_position())
	else :
		joystick_direction = Input.get_vector("move_left" , "move_right" , "move_up" , "move_up" )
		joystick_direction = joystick_direction.sign()
		joystick_direction = joystick_direction.normalized()
		rotation = joystick_direction.angle()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		kbm = true
	elif event is InputEventJoypadMotion:
		kbm = false
