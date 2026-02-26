extends CharacterBody2D

@export var health: int = 3
@export var speed: float = 150
@export var gravity: float = 20
@export var bounce: float = -250
@export var jump_delay: float = 0.3

# JANK
@export var fps : int = 60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play('fall')
		
func _physics_process(delta: float) -> void:
	
	# JANK
	Engine.max_fps = fps
	
	if is_on_floor():
		velocity.y = 0
		await get_tree().create_timer(jump_delay).timeout
		velocity.y = bounce
	else:
		velocity.y += gravity
		var dir = Input.get_axis('walk_left','walk_right')
		if dir != 0:
			velocity.x = dir * speed
		else:
			velocity.x = 0
		
	move_and_slide()
	
