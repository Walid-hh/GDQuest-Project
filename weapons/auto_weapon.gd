extends Weapon

@onready var cooldown_timer: Timer = %CooldownTimer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("mouse_left") and cooldown_timer.is_stopped():
		_shoot()
		cooldown_timer.start()
