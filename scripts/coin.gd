extends Node2D
@onready var coinSound = $coinArea/coinSound
# Called when the node enters the scene tree for the first time.
func _on_coin_area_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if visible == true:
			Coman.coinCount = Coman.coinCount + 1
			coinSound.play()
			visible = false
			print(Coman.coinCount)
