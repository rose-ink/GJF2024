extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://Scenes/grass_area.tscn")

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
