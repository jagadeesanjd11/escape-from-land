extends CharacterBody2D
@onready var soundHurt:AudioStreamPlayer2D = $soundHurt
@onready var flayAni = $flayAni
var time_passed: float = 0.0
var wait_time: float = 2 # Wait for 2 seconds
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= wait_time:
		#print("Timeout reached!")
		if flayAni.flip_h == true:
			flayAni.flip_h = false
		else:
			flayAni.flip_h = true
		time_passed = 0.0 # Reset the timer loop


func _on_flay_area_body_entered(body: Node2D) -> void:
	Coman.hurt(body, soundHurt)
