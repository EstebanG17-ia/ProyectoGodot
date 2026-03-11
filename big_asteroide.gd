extends Area2D

@export var speed = 250

func _process(delta: float) -> void:
	position.x -= speed * delta


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser"):
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	print("Cuerpo detectado")
