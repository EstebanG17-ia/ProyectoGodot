extends CharacterBody2D

@export var speed: float = 400.0
@export var laser_scene: PackedScene

func _ready():
	var screen_size = get_viewport_rect().size
	
	global_position.x = screen_size.x / 2
	global_position.y = screen_size.y - 50


func _physics_process(delta: float) -> void:
	var x_input = Input.get_axis("Left", "Right")
	velocity.x = x_input * speed
	move_and_slide()

	if Input.is_action_just_pressed("shoot"):
		create_laser()


func create_laser():
	var laser_instance = laser_scene.instantiate()
	var spawn = $LaserSpawn
	laser_instance.global_position = spawn.global_position
	add_sibling(laser_instance)


func _on_detection_area_area_entered(area: Area2D) -> void:
	if area.is_in_group("asteroides"):
		var main_node = get_tree().current_scene
		if main_node.has_method("detener_juego"):
			main_node.detener_juego()
		
		queue_free()
