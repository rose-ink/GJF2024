extends Area2D
@onready var timer = $Timer
@onready var bunny = $"../Players/bunny"
@onready var cat = $"../Players/cat"
@onready var initalPosition = cat.position
var player = cat
var otherPlayer = bunny
var count = 0

var maxHealth = 5
@onready var currentHealth: int = maxHealth
signal healthChanged


func _on_body_entered(body):
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
	currentHealth -= 1
	
	#player.get_node("CollisionShape2D").disabled = false
	player.velocity = Vector2(0,0)
	if count == 2:
		currentHealth -= 1
		player.position = initalPosition
		otherPlayer.position = initalPosition
	player.position = otherPlayer.position
	if currentHealth <= 0:
		get_tree().reload_current_scene()
	healthChanged.emit()
	count = 0
	
	#get_tree().reload_current_scene()
