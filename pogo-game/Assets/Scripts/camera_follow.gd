extends Camera2D

# Please assign a target in the editor
@export var follow_target : Node2D = null
@export var free_follow_cam : bool
@export var camera_speed : float = 500

# This variable indicates where the camera "should" be in order to follow
#	the player properly. -150 is its initial value because 150 is the distance
#	between platforms.
var focus_height : float = -150

func _ready():
	focus_height = follow_target.global_position.y

func _physics_process(delta):
	
	# The camera target's the player's y position
	var camera_target = follow_target.global_position.y
	if (camera_target < focus_height):
		focus_height = camera_target
	
	# DEBUG ONLY
	if (free_follow_cam):
		global_position.y = camera_target

	# If the camera's actual height is below where it's supposed to be...
	elif (focus_height < global_position.y):
		
		# Move towards that location.
		global_position.y -= camera_speed * delta
		
		# Do not let the camera's actual height go above the focus height.
		if (focus_height > global_position.y):
			global_position.y = focus_height
			
