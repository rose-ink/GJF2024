extends Control
@onready var pause_menu = $"."
@onready var resume_button = $Resume

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause()
	
func resume():
	BgMusic.stream_paused = false
	pause_menu.hide()
	Engine.time_scale = 1

func pause():
	pause_menu.show()
	resume_button.grab_focus()
	BgMusic.stream_paused = true
	Engine.time_scale = 0
	
func _on_resume_pressed():
	resume()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	pause()
	resume()
