extends Weapon
class_name MobWeapon

@onready var cooldown_timer: Timer = %CooldownTimer

func _ready() -> void:
	cooldown_timer.start()

func _physics_process(delta: float) -> void:
	pass


func _shoot() -> void :
	if cooldown_timer.is_stopped():
		super()
		cooldown_timer.start()
