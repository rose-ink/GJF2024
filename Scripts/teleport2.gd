extends Area2D

func _on_body_entered(body: PhysicsBody2D):
	print("Entered")
	get_tree().change_scene_to_file("res://Scenes/grass_area.tscn")
