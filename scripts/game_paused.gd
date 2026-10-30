extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	hide()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("esc"):
		Coman.gamePaused = true
		get_tree().paused = Coman.gamePaused
		#get_tree().change_scene_to_file("res://scene/menu.tscn")
		show()
	if Input.is_action_pressed("continue"):
		Coman.gamePaused = false
		get_tree().paused = Coman.gamePaused
		#get_tree().change_scene_to_file("res://scene/menu.tscn")
		hide()


func _on_cotinue_btn_pressed() -> void:
	Coman.gamePaused = false
	get_tree().paused = Coman.gamePaused
	hide()


func _on_exit_btn_pressed() -> void:
	get_tree().quit()
	#pass # Replace with function body.


func _on_restart_btn_pressed() -> void:
	Coman.gamePaused = false
	get_tree().paused = Coman.gamePaused
	Coman.resetAll()
	hide()
	get_tree().reload_current_scene()
