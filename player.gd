extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var x_input = Input.get_axis("Left", "Right")
	var y_input = Input.get_axis("Up", "Down")
	
	velocity.x = x_input * speed
	velocity.y = y_input * speed
	
	move_and_slide()
