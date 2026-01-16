extends Camera2D

# Please assign a target in the editor
@export var follow_target : Node2D = null

func _ready():
	pass

func _physics_process(_delta):
	
	# Set to match position of target
	global_position = follow_target.global_position
