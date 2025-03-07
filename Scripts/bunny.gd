extends CharacterBody2D

signal is_dead
signal respawned

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var safe_pos = position
@onready var area_2d = $Area2D
@onready var cat = %cat
@onready var other_player_dead = false
@onready var pos_timer = $PositionCheckerTimer
@onready var kill_zone = %"Kill Zone"
@onready var start_pos = position

func _ready():
	cat.is_dead.connect(cat_is_dead)
	cat.respawned.connect(cat_respawned)
	pos_timer.start()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("bunny_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("bunny_left", "bunny_right")
	if direction < 0:
		animated_sprite_2d.flip_h = false
	elif direction > 0:
		animated_sprite_2d.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#get the last safe position the character was at 
	
func _on_position_checker_timer_timeout():
	if is_on_floor() ==  true:
		safe_pos = position
	
	
func _on_area_2d_area_entered(_area):
	is_dead.emit()
	pos_timer.stop()
	area_2d.set_deferred("monitoring", false)
	
	await get_tree().create_timer(1.0).timeout

	if other_player_dead == true:
		respawn_both()
		print("cat is dead")
		position = start_pos
		area_2d.set_deferred("monitoring", true)
		other_player_dead = false
		
	else:
		position = safe_pos
		respawned.emit()
		area_2d.set_deferred("monitoring", true)
		pos_timer.start()
		
func cat_is_dead():
	other_player_dead = true
	
func cat_respawned():
	other_player_dead = false
	
#make respawning of both characters smoother, too lazy to rn
func respawn_both():
	pass
