extends Camera2D

# Please assign a target in the editor
@export var follow_target : Node2D = null
@export var can_go_down : bool = false

func _physics_process(_delta):
	
	# Set to match position of target
	if (!can_go_down and follow_target.global_position.y < global_position.y):
		global_position.y = follow_target.global_position.y
