extends CharacterBody2D

@export var speed := 300

func _process(delta):
	var direction := 0

	if Input.is_action_pressed("Up"):
		direction -= 1
	if Input.is_action_pressed("Down"):
		direction += 1

	position.y += direction * speed * delta
