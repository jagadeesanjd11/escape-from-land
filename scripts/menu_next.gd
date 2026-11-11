extends Node2D
@onready var nxtBtn = $CanvasLayer/nxtBtn
const SAVE_PATH = "user://save_data.json"
@onready var winSound = $CanvasLayer/winSound
var endLevel = 9
@onready var label:Label = $CanvasLayer/won
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
	#print("Coman.game_level ", Coman.game_level)
	Coman.game_level += 1
	Coman.overAllCoin += Coman.coinCount 
	save_game_data("res://scene/l_"+ str(Coman.game_level)+ ".tscn", Coman.game_level, Coman.overAllCoin)
	winSound.play()
	if Coman.game_level > endLevel:
		nxtBtn.text = "Play again"
		label.text = "The End"
func _on_nxt_btn_pressed() -> void:
	if Coman.game_level > endLevel:
		Coman.game_level = 1
		Coman.overAllCoin = 0
		save_game_data("res://scene/l_"+ str(Coman.game_level)+ ".tscn", Coman.game_level, Coman.overAllCoin)
	else:
		get_tree().change_scene_to_file("res://scene/l_" + str(Coman.game_level) + ".tscn")
		Coman.resetAll()
func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/menu.tscn")
