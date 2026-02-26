extends Node2D

var platform_prefab = preload("res://Assets/Scenes/platform.tscn")
@export var player : Node2D = null
@export var scene_camera : Camera2D = null
@export var platform_spacing: int = 200
@export var platforms_queue = []

var camera_vertical_bound: int
@export var bounds_buffer: int = 100

func _ready() -> void:
	camera_vertical_bound = DisplayServer.screen_get_size().y / 2 + bounds_buffer
	position.y = scene_camera.position.y + camera_vertical_bound
	
func _process(delta: float) -> void:
	if absi(scene_camera.position.y - camera_vertical_bound) <= camera_vertical_bound:
		var platform_copy = platform_prefab.instantiate()
		platform_copy.global_position = Vector2(0, position.y)
		add_child(platform_copy)
		platforms_queue.push_back(platform_copy)
		
	#if follow_target.global_position.y + next_platform_level < bottom_boundary :
		#if len(platforms_queue) > 0:
			#var oldest_platform = platforms_queue.pop_front()
			#oldest_platform.queue_free()
			#bottom_boundary -= platform_spacing
