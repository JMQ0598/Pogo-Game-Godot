extends Camera2D

# Please assign a target in the editor
@export var follow_target : Node2D = null

func _physics_process(_delta):
	
	# Set to match position of target
	if (follow_target.global_position.y < global_position.y):
		global_position.y = follow_target.global_position.y
