extends Marker2D

@export var asteroides: Array[PackedScene]

@export var min_y: float = 101.5
@export var max_y: float = 554.5

func add_asteroides():
	var random_asteroid_scene = asteroides.pick_random()
	var asteroid = random_asteroid_scene.instantiate()
	var random_y = randf_range(min_y, max_y)
	add_child(asteroid)
	asteroid.global_position = Vector2(global_position.x, random_y)

func _on_timer_timeout() -> void:
	add_asteroides()
	
	
