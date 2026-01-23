extends CharacterBody2D

var isMidair: bool = true
@export var health: int = 3
@export var speed: int = 1000
@export var jump_speed = -1800
@export var gravity: int = 4000
@export var bounce: int = 4000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('fall')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
func _physics_process(delta: float) -> void:
	velocity.y = gravity * delta
	if isMidair:
		var dir = Input.get_axis('walk_left','walk_right')
		if dir != 0:
			velocity.x = dir * speed
		else:
			velocity.x = 0
	else:
		if is_on_floor():
			velocity.y = bounce * delta
	move_and_slide()
