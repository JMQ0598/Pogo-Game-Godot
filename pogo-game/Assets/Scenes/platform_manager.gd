extends Node2D

var platformPrefab
@export var delay_seconds: int = 1
var count = 0

func _ready() -> void:
	platformPrefab = $Platform
	print(DisplayServer.window_get_size())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	await get_tree().create_timer(delay_seconds).timeout
	print(count, 'seconds has passed')
	
