extends Marker2D

@export var asteroides: Array[PackedScene]

@export var min_x: float = 0
@export var max_x: float = 800

@export var spawn_chance: float = 0.8

@export var max_asteroides: int = 3

@export var min_time: float = 0.5
@export var max_time: float = 1.5


func add_asteroides():
	if randf() > spawn_chance:
		return
	
	var cantidad = randi_range(1, max_asteroides)
	
	for i in cantidad:
		var random_asteroid_scene = asteroides.pick_random()
		var asteroid = random_asteroid_scene.instantiate()
		
		var random_x = randf_range(min_x, max_x)
		
		get_tree().current_scene.add_child(asteroid) 
		asteroid.global_position = Vector2(random_x, -50)


func _on_timer_timeout() -> void:
	add_asteroides()
	
	var new_time = randf_range(min_time, max_time)
	$Timer.wait_time = new_time
	$Timer.start()
	
