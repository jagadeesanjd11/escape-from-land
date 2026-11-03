extends Area2D
@onready var plat = $".."
@onready var staticBody:StaticBody2D = $"../StaticBody2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_exited(body: Node2D) -> void:
	if Coman.landStable == false:
		if body.name == "player":
			print("here ",body.name) # Replace with function body.
			plat.remove_child(staticBody) # Replace with function body.
