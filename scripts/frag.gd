extends CharacterBody2D
@onready var fragAni = $fragAni
var time_passed: float = 0.0
var wait_time: float = 1.5 # Wait for 2 seconds
func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= wait_time:
		#print("Timeout reached!")
		if fragAni.flip_h == true:
			fragAni.flip_h = false
		else:
			fragAni.flip_h = true
			time_passed = 0.0 # Reset the timer loop
