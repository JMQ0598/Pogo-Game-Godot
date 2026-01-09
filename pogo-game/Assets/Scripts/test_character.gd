extends CharacterBody2D

var rng = RandomNumberGenerator.new()

@export var gravity = 30
@export var jump_force = -500
@export var movement_speed = 200

func _ready():
	pass

func _physics_process(delta):
	if (Input.is_action_pressed("walk_left")):
		velocity.x = -movement_speed
