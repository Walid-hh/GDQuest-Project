class_name Item extends Resource

@export var item_image : Texture
@export var item_particle_texture : Texture
@export var item_particle_effect : ParticleProcessMaterial
@export var sfx : AudioStreamWAV

func use(player_hit_box : HitBoxComponent)-> void :
	pass
