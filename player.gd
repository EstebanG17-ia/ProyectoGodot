extends CharacterBody2D

@export var speed: float = 300.0
@export var laser_scene: PackedScene

func _physics_process(delta: float) -> void:
	var x_input = Input.get_axis("Left", "Right")
	var y_input = Input.get_axis("Up", "Down")

	velocity.x = x_input * speed
	velocity.y = y_input * speed

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
		queue_free()
