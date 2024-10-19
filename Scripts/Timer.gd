extends Node

@onready var label = $Label
@onready var timer = $Timer
@onready var lose = $"../lose"

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
	lose.visible = true
	await get_tree().create_timer(5.0).timeout
	get_tree().reload_current_scene()
