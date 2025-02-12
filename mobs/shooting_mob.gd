extends Mob

@onready var mob_weapon: MobWeapon = %MobWeapon

func _ready() -> void:
	super()

func _physics_process(delta: float) -> void:
	super(delta)
	if target != null:
		mob_weapon._shoot()
