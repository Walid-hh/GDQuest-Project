extends Control

@onready var settings_button: Button = %SettingsButton
@onready var menu_button: Button = %MenuButton
@onready var pause_menu: Control = %PauseMenu
@onready var music_slider: HSlider = %MusicSlider
@onready var sfx_slider: HSlider = %SfxSlider


func _ready() -> void:
	settings_button.pressed.connect(func() -> void :
		visible = true )
	menu_button.pressed.connect(func() -> void :
		visible = false
		pause_menu.visible = true
		)
