extends Node
@onready var bunny = %bunny
@onready var cat = %cat
@onready var win = $"../CanvasLayer2/win"

var score = 2

#@onready var score_label = $"score label"

func add_point():
	score += 1
	#score_label.text = "You collected " + str(score) + " coins."
	print(score)

func _on_win_area_body_entered(body: PhysicsBody2D):
	if (cat in body and bunny in body) and score == 2:
		win.visible
		get_tree().reload_current_scene()
		
		
