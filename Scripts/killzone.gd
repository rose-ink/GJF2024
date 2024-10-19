extends Area2D

@onready var timer = $Timer
@onready var bunny = $"../Players/bunny"
@onready var cat = $"../Players/cat"
var player = cat
var otherPlayer = bunny

func _on_body_entered(body):
	if body == cat:
		player = cat
		otherPlayer = bunny
	else:
		player = bunny
		otherPlayer = cat
	
	print("You died!")
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").disabled = true
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	player.get_node("CollisionShape2D").disabled = false
	player.velocity = Vector2(0,0)
	player.position = otherPlayer.position
	
	#get_tree().reload_current_scene()
