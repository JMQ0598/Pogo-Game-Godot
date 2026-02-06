extends Camera2D

# Please assign a target in the editor
@export var follow_target : Node2D = null
@export var can_go_down : bool
@export var camera_speed : float = 500
var focus_height : float = 0
var focus_height_offset : float = 20

func _ready():
	focus_height = follow_target.global_position.y

func _physics_process(delta):
	
	# focus_height checkpoint
	if (follow_target.global_position.y < focus_height):
		focus_height = follow_target.global_position.y
	
	# DEBUG ONLY
	if (can_go_down):
		global_position.y = follow_target.global_position.y

	# In-game behavior
	elif (focus_height < global_position.y):
		global_position.y -= camera_speed * delta
		if (focus_height > global_position.y):
			global_position.y = focus_height
			
