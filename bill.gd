extends CharacterBody2D

signal game_over

const JUMP_VELOCITY = -195.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") / 2
var dead = false


func _ready():
	dead = false


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and not dead:
		velocity.y = JUMP_VELOCITY

	var collision = move_and_collide(velocity*delta)
	if collision and not dead:
		dead = true
		game_over.emit()
