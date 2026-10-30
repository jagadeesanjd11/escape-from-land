extends Node
var coinCount:int = 0
var healthCount:int = 10
var gamePaused: bool = false
var keyCollected: bool = false
var game_level:int = 1
var overAllCoin:int = 0

func resetAll():
	coinCount = 0
	healthCount = 10
	gamePaused = false
	keyCollected = false
	
func hurt(body,sound):
	if body.name == "player":
		healthCount = healthCount - 1
		sound.play()
		if healthCount <= 0:
			get_tree().reload_current_scene()
			resetAll()
