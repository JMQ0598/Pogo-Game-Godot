extends CharacterBody2D

var isMidair: bool = true
@export var health: int = 3
@export var speed: int = 1000
@export var jump_speed = -1800
@export var gravity: int = 4000
@export var bounce: int = -90000

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
		velocity.y = bounce * delta
	else:
		velocity.y = velocity.y + gravity * delta
		var dir = Input.get_axis('walk_left','walk_right')
		if dir != 0:
			velocity.x = dir * speed
		else:
			velocity.x = 0
		
	move_and_slide()
	
