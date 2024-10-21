extends Control



func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/tut_level.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_credits_pressed():
	pass # Replace with function body.
