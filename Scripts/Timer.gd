extends Node

@onready var label = $Label
@onready var timer = $Timer

func _ready():
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return[minute, second]
	
func _process(_delta):
	label.text = "%02d:%02d" % time_left_to_live()

func _on_timer_timeout():
	#Engine.time_scale = .5
	get_tree().change_scene_to_file("res://Scenes/lose_menu.tscn")
