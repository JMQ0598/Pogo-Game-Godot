extends StaticBody2D

@export var gravity : float = 50
@export var rotation_speed : float = 10

func _physics_process(delta):
	translate(Vector2(0, gravity * delta))
	rotate(rotation_speed * delta)
