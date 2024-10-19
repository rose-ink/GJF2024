extends Area2D

@onready var timer = $Timer
@onready var bunny = $"../Players/bunny"
@onready var cat = $"../Players/cat"
var player = cat
var otherPlayer = bunny
var count = 0

var maxHealth = 5
@onready var currentHealth: int = maxHealth
signal healthChanged


func _on_body_entered(body):
	healthChanged.emit()
	if body == cat:
		player = cat
		otherPlayer = bunny
	else:
		player = bunny
		otherPlayer = cat
	count += 1
	print("You died!")
	Engine.time_scale = 0.5
	#body.get_node("CollisionShape2D").set_disabled.call_deferred(true)
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1
	
	#player.get_node("CollisionShape2D").disabled = false
	player.velocity = Vector2(0,0)
	if count == 2:
		get_tree().reload_current_scene()
	player.position = otherPlayer.position
	count = 0
	
	#get_tree().reload_current_scene()
