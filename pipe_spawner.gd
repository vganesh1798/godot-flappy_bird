extends Area2D

signal halt_pipes

@export var pipe_scene: PackedScene
var rng = RandomNumberGenerator.new()
var is_game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	is_game_over = false
	rng.randomize()
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if not is_game_over and (body.name == "Pipes" or "CharacterBody2D" in body.name):
		spawn_pipes()


func spawn_pipes():
	var pipes = pipe_scene.instantiate()
	pipes.position.x = $CollisionShape2D.position.x + ($CollisionShape2D.shape.size.x * 1.5)
	pipes.position.y = rng.randi_range(-32, 96)
	
	add_child(pipes)


func _on_bill_game_over():
	is_game_over = true
	halt_pipes.emit()
