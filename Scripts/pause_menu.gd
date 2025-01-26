extends Control
@onready var pause_menu = $"."

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		pause()
	
func resume():
	print("at resume")
	pause_menu.visible = false
	get_tree().paused = false

func pause():
	print("at pause")
	pause_menu.visible = true
	get_tree().paused = true
	
func _on_resume_pressed():
	resume()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
