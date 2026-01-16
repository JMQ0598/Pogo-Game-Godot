extends Node2D

var rng = RandomNumberGenerator.new()

@export var gravity : float = 30
@export var jump_force : float = -500
@export var movement_speed : float = 200

func _ready():
	pass

func _physics_process(delta):
	if (Input.is_action_pressed("walk_left")):
		position.x -= movement_speed * delta
	if (Input.is_action_pressed("walk_right")):
		position.x += movement_speed * delta
	if (Input.is_action_pressed("walk_up")):
		position.y -= movement_speed * delta
	if (Input.is_action_pressed("walk_down")):
		position.y += movement_speed * delta
