extends CharacterBody2D
@onready var soundHurt:AudioStreamPlayer2D = $soundHurt
@onready var enemyWarmAni =$enemyWarmAni
var time_passed: float = 0.0
var wait_time: float = 2 # Wait for 2 seconds
func _process(delta: float) -> void:
	time_passed += delta
	if time_passed >= wait_time:
		#print("Timeout reached!")
		if enemyWarmAni.flip_h == true:
			enemyWarmAni.flip_h = false
		else:
			enemyWarmAni.flip_h = true
		time_passed = 0.0 # Reset the timer loop
func _on_warm_area_body_entered(body: Node2D) -> void:
	Coman.hurt(body, soundHurt)
