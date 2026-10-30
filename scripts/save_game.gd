const SAVE_PATH = "user://save_data.json"

func save_game_data(level_name: String) -> void:
	var data = {
		"current_level": level_name
	}
	var json_string = JSON.stringify(data)
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_line(json_string)

func load_game_data() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {"current_level": "res://scene/l_1.tscn"}
	
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json_string = file.get_line()
	var json = JSON.new()
	var error = json.parse(json_string)
	if error == OK:
		return json.get_data()
	return {"current_level": "res://scene/l_1.tscn"}
