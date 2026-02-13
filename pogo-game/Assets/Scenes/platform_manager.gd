extends Node2D

var platform_prefab = preload("res://Assets/Scenes/platform.tscn")
@export var follow_target : Node2D = null
@export var space_required: int = 400
@export var next_platform_level: int = -600
@export var next_platform_space = 440


func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if follow_target.global_position.y - next_platform_level < space_required:
		var platform_copy = platform_prefab.instantiate()
		platform_copy.global_position = Vector2(0, next_platform_level)
		add_child(platform_copy)
		next_platform_level -= next_platform_space
	 
	
	
