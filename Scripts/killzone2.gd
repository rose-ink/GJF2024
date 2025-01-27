extends Area2D
@onready var timer = $Timer
@onready var bunny = %bunny
@onready var cat = %cat
@onready var bunny_cam = %BunnyCam
@onready var player_cam = %"Player Cam"

@onready var initalPosition = cat.position
var player = cat
var otherPlayer = bunny
var isCatSafe = true
var cat_dead = false
var bunny_dead = false
var both_dead = false

var maxHealth = 5
@onready var currentHealth: int = maxHealth
signal healthChanged


func _on_body_entered(body):
	if body == bunny:
		bunny_dead = true
		
	else:
		cat_dead = true
		
	body.get_node("CollisionShape2D").set_deferred("disabled", true)
	
	if cat_dead == true:
		player = cat
		otherPlayer = bunny
		
	else:
		player = bunny
		otherPlayer = cat
		
	timer.start()	
	if cat_dead == true and bunny_dead == true:
		reset_both_players()
	else:
		reset_player()
	
		
func _on_timer_timeout():
	print(currentHealth)
	
	
		
	cat_dead = false
	bunny_dead = false
	
	if currentHealth <= 0:
		get_tree().change_scene_to_file("res://Scenes/lose_menu.tscn")
	healthChanged.emit()


func reset_both_players():
	currentHealth -= 2
	print("at reset both players")
	player.get_node("CollisionShape2D").set_deferred("disabled", false)
	otherPlayer.get_node("CollisionShape2D").set_deferred("disabled", false)
	player.position = initalPosition
	otherPlayer.position = initalPosition
	
	player.velocity = Vector2(0,0)


func reset_player():
	currentHealth -= 1
	print("at reset player")
	player.get_node("CollisionShape2D").set_deferred("disabled", false)
	
	var bodies = 1
	while (bodies > 0):
		bunny_cam.enabled = true
		bunny_cam.make_current()
		bodies = bunny.get_node("Area2D").get_overlapping_bodies().size()
		await get_tree().physics_frame
	isCatSafe = true
		
	if isCatSafe == true:
		bunny_cam.enabled = false
		player_cam.make_current()
		player.position = otherPlayer.position
	
	player.velocity = Vector2(0,0)
