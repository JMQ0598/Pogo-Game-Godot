extends Node2D



## var isMidair: bool = true
@export var speed: int = 1000
@export var jump_speed = -1800
@export var gravity: int = 4000
@export_range(0.0, 1.0) var friction: float = 0.1
@export_range(0.0, 1.0) var acceleration: float = 0.25


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('fall')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
func _physics_process(delta: float) -> void:
##	if isMidair:
		var dir = Input.get_axis('walk_left','walk_right')
		if dir != 0:
			$CharacterBody2D.velocity.x = lerp($CharacterBody2D.velocity.x, dir * speed, acceleration)
		else:
			$CharacterBody2D.velocity.x = lerp($CharacterBody2D.velocity.x, 0.0, friction)
