extends RigidBody2D

signal hit

@export var gravity : float = 50
@export var rotation_speed : float = 10

func _physics_process(delta):
	translate(Vector2(0, gravity * delta))
	rotate(rotation_speed * delta)
	
func _on_body_entered(body):
	print(body)
