extends Control
@onready var next: Button = %Next
@onready var npc: Area2D = %Npc
@onready var dialogue_text: RichTextLabel = %DialogueText
@onready var dialogue_audio: AudioStreamPlayer = %DialogueAudio
var dialogue_box : Array
var idx := 0
var text_tween : Tween


func _ready() -> void:
	dialogue_box = npc.dialogue_box.dialogues
	next.pressed.connect(func() -> void :
		if dialogue_text.visible_ratio < 1:
			text_tween.kill()
			dialogue_audio.stop()
			dialogue_text.visible_ratio = 1
		else :
			idx += 1
			if idx < dialogue_box.size():
				show_text(idx)
			else :
				idx = 0
				visible = false
				modulate.a = 0
				npc.player.set_physics_process(true)
				)


func show_text(idx : int) -> void :
	text_tween = create_tween()
	dialogue_text.visible_ratio = 0
	dialogue_text.text = dialogue_box[idx]
	var text_length := dialogue_text.text.length()
	var text_duration := text_length / 20
	var audio_offset = dialogue_audio.stream.get_length() - text_duration
	var audio_start_position = randf() * audio_offset
	dialogue_audio.play(audio_start_position)
	text_tween.tween_property(dialogue_text , "visible_ratio" , 1 , text_duration)
	text_tween.finished.connect(dialogue_audio.stop)
	
