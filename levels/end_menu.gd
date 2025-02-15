extends Control

@onready var replay: Button = %ReplayButton
@onready var exit: Button = %ExitButton
@onready var label_2: Label = %Label2
var start_timer : float

func _ready() -> void:
	var start_timer := Time.get_ticks_msec()
	visible = false
	replay.pressed.connect(func() -> void :
		get_tree().paused = false
		get_tree().reload_current_scene())
	exit.pressed.connect(get_tree().quit)

func toggle() -> void :
		visible = !visible
		var time_elapsed := Time.get_ticks_msec() - start_timer
		time_elapsed = snappedf(time_elapsed/1000 , 0.1)
		label_2.text = "Time : " + str(time_elapsed) + "s"
