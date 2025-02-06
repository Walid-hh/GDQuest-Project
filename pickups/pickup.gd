extends Node2D

@onready var item_image: Sprite2D = %ItemImage
@onready var item_particles: GPUParticles2D = %ItemParticles
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@export var item : Item
@export var hit_box : HitBoxComponent
var off_set : Vector2
var initial_position : Vector2

func _ready() -> void:

	var audioplayer := AudioStreamPlayer2D.new()
	item_image.texture = item.item_image
	item_particles.texture = item.item_particle_texture
	item_particles.process_material = item.item_particle_effect
	initial_position = position
	off_set = position + Vector2(0 , -20)
	_animate_item()
	hit_box.area_entered.connect(func(area)-> void :
		if area is HitBoxComponent:
			if area.get_parent() is Player:
				item.use(area)
				audioplayer.stream = item.sfx
				get_tree().current_scene.add_child(audioplayer)
				audioplayer.play()
				animation_player.play("collected")
				animation_player.animation_finished.connect(func(animation : String) -> void :
					queue_free())
				)
	audioplayer.finished.connect(func()-> void :
		audioplayer.queue_free())

func _animate_item():
	var tween := create_tween()
	var duration := 1
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(self , "position" , off_set, duration)
	tween.tween_property(self , "position" , initial_position , duration)
	tween.set_loops()
