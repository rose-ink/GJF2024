extends Area2D

func _on_body_entered(_body: PhysicsBody2D):
	get_tree().change_scene_to_file.bind("res://Scenes/grass_area.tscn").call_deferred()
