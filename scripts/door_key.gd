extends Node2D
@onready var soundKey = $soundKey

func _on_key_area_body_entered(body: Node2D) -> void:
	if body.name == "player" && visible == true:
		Coman.keyCollected = true
		soundKey.play()
		hide()
