extends Node2D

const SAVE_PATH = "user://save_data.json"
@onready var winSound = $CanvasLayer/winSound
func save_game_data(level_name: String,l_no:int, coins:int) -> void:
	var data = {
		"current_level": level_name,
		"l_no":l_no,
		"coins":coins
	}
	var json_string = JSON.stringify(data)
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_line(json_string)

func _ready() -> void:
	winSound.play()
	Coman.game_level += 1
	Coman.overAllCoin += Coman.coinCount 
	save_game_data("res://scene/l_"+ str(Coman.game_level)+ ".tscn", Coman.game_level, Coman.overAllCoin)
	
func _on_nxt_btn_pressed() -> void:
	print("res://scene/l_" + str(Coman.game_level) + ".tscn")
	get_tree().change_scene_to_file("res://scene/l_" + str(Coman.game_level) + ".tscn")
	Coman.resetAll()
	print(Coman.keyCollected)
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menu.tscn")
