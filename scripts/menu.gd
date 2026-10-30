extends CanvasLayer

@onready var playBtn = $playBtn
const SAVE_PATH = "user://save_data.json"
var data = {}
# Called when the node enters the scene tree for the first time.
func load_game_data() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {"current_level": "res://scene/l_1.tscn", "l_no":1, "coins":0}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json_string = file.get_line()
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		return json.get_data()
	return {"current_level": "res://scene/l_1.tscn", "l_no":1, "coins":0}

func _ready() -> void:
	data = load_game_data()
	Coman.game_level = data.l_no
	Coman.overAllCoin = data.coins
	if data.l_no == 1 :
		playBtn.text = "Play"
	else:
		playBtn.text = "Continue"

func _on_play_btn_pressed() -> void:
	Coman.resetAll()
	get_tree().change_scene_to_file(data.current_level)


func _on_exit_btn_pressed() -> void:
	get_tree().quit()
