extends Node
@onready var bunny = %bunny
@onready var cat = %cat
@onready var win = $"../CanvasLayer2/win"
@onready var win_area = $"../win area"

var score = 2

#@onready var score_label = $"score label"

func add_point():
	score += 1
	#score_label.text = "You collected " + str(score) + " coins."
	print(score)

func _on_win_area_body_entered(body: PhysicsBody2D):
	print(body.name)
	if (cat in win_area.get_overlapping_bodies() and bunny in win_area.get_overlapping_bodies()) and score == 2:
		win.visible = true
		await get_tree().create_timer(5.0).timeout
		get_tree().reload_current_scene()
		
		
