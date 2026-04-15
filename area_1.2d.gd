extends Area2D

@export var speed = 150

func _process(delta: float) -> void:
	position.y += speed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("laser"):
		var main_node = get_tree().current_scene
		
		if main_node.has_method("sumar_puntos"):
			main_node.sumar_puntos() 
		
		area.queue_free() 
		queue_free() 

	if area.is_in_group("suelo"):
		var main_node = get_tree().current_scene
		
		if main_node.has_method("detener_juego"):
			main_node.detener_juego()    


func _on_body_entered(body: Node2D) -> void:
	print("Cuerpo detectado")
