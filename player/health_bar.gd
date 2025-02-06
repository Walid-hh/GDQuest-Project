extends ProgressBar
@export var health_component : HealthComponent

func _process(delta: float) -> void:
	self.min_value = 0
	self.max_value = health_component.max_health
	self.value = health_component.health
