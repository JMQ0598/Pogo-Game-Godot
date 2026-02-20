extends Node2D

var platform_prefab = preload("res://Assets/Scenes/platform.tscn")
@export var follow_target : Node2D = null
@export var scene_camera : Camera2D = null
@export var space_required: int = 400
@export var next_platform_level: int = 300
@export var platform_spacing: int = 200
@export var bottom_boundary: int = 100
@export var platforms_queue = []

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if position.y - scene_camera.position.y <= space_required:
		var platform_copy = platform_prefab.instantiate()
		platform_copy.global_position = Vector2(0, next_platform_level)
		add_child(platform_copy)
		next_platform_level -= platform_spacing
		platforms_queue.push_back(platform_copy)
		
	if follow_target.global_position.y + next_platform_level < bottom_boundary :
		if len(platforms_queue) > 0:
			var oldest_platform = platforms_queue.pop_front()
			oldest_platform.queue_free()
			bottom_boundary -= platform_spacing
