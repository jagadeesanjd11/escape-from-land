extends Node2D

func _on_health_addon_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if visible == true:
			Coman.healthCount += 1 
			$healthSound.play()
			visible = false
