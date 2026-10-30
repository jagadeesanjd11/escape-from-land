extends Node2D
@onready var soundHurt = $soundHurt

func _on_enemy_area_body_exited(body: Node2D) -> void:
	Coman.hurt(body,soundHurt)
