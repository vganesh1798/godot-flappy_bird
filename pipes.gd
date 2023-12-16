extends CharacterBody2D

var is_game_over

func _ready():
	is_game_over = false

func _physics_process(delta):
	velocity.x = -50 if not is_game_over else 0
	position += velocity * delta
	
	if position.x <= -32:
		queue_free()


func _on_safe_zone_body_entered(body):
	print(body)


