extends CharacterBody2D

@export var physics_scale: int = 1000
@export var health: int = 3
@export var speed: int = 300
@export var jump_speed: int = -18
@export var gravity: int = 4
@export var bounce: int = -50

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('fall')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
		
func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		velocity.y = 0
		await get_tree().create_timer(0.5).timeout
		velocity.y = bounce * physics_scale * delta
	else:
		velocity.y = clamp(
			velocity.y + gravity * physics_scale * delta, 
			velocity.y + gravity * physics_scale * delta,
			10000)
		var dir = Input.get_axis('walk_left','walk_right')
		if dir != 0:
			velocity.x = dir * speed
		else:
			velocity.x = 0
		
	move_and_slide()
	
