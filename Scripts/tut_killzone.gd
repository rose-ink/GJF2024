extends Area2D
@onready var bunny = %bunny
@onready var cat = %cat

#hey
@onready var initalPosition = cat.position
var player = cat
var otherPlayer = bunny
var count = 0
var isCatSafe = true

var maxHealth = 5
@onready var currentHealth: int = maxHealth

func _on_body_entered(body):
	if body == cat:
		player = cat
		otherPlayer = bunny
		
		
		var bodies = 1
		while (bodies > 0):
			bodies = bunny.get_node("Area2D").get_overlapping_bodies().size()
			#isCatSafe = false
			#print("isCateSafe = false", bodies)
			await get_tree().physics_frame
		isCatSafe = true
		#print("isCateSafe = true")
		
	else:
		player = bunny
		otherPlayer = cat
	count += 1
	print("You died!")
	#body.get_node("CollisionShape2D").set_disabled.call_deferred(true)

func _on_timer_timeout():
	currentHealth -= 1
	
	#player.get_node("CollisionShape2D").disabled = false
	player.velocity = Vector2(0,0)
	if count == 2:
		currentHealth -= 1
		player.position = initalPosition
		otherPlayer.position = initalPosition
	if isCatSafe == true:
		player.position = otherPlayer.position
	
	count = 0
