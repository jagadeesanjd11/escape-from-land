extends CharacterBody2D
@onready var flayAni2_0 = $flayAni2_0
@onready var soundHurt:AudioStreamPlayer2D = $soundHurt
@onready var player:CharacterBody2D = $"../player"
@export var move_speed:float = 320.0
@export var target: CharacterBody2D

var follow:bool = true
var time_passed: float = 0.0
var wait_time: float = 2 # Wait for 2 seconds
var flayHit: bool = false

func _ready() -> void:
	flayAni2_0.flip_h = true
	flayAni2_0.play("default")
	if Coman.game_level == 9:
		move_speed = 325	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if follow == true:
		if flayHit == true:
			var direction = position.direction_to(Vector2(player.global_position.x-150,player.global_position.y)).normalized()
			velocity = direction * move_speed
			move_and_slide()
			flayHit= false
		else:
			var direction = position.direction_to(player.global_position).normalized()
			velocity = direction * move_speed
			move_and_slide()
			flayHit = true
	else:
		var direction: Vector2 = global_position.direction_to(Vector2(473,572))
		velocity = direction * move_speed
		move_and_slide()
		
		#anime
		time_passed += delta
		if time_passed >= wait_time:
			#print("Timeout reached!")
			if flayAni2_0.flip_h == true:
				flayAni2_0.flip_h = false
			else:
				flayAni2_0.flip_h = true
			time_passed = 0.0 # Reset the timer loop
			$AnimationPlayer.play("moving")


func _on_flay_area_2_0_body_exited(body: Node2D) -> void:
	Coman.hurt(body, soundHurt)
	if body.name == "player":
		flayHit=true

func _on_stop_area_enemy_body_exited(body: Node2D) -> void:
	print("body faly", body.name)
	if body.name == "flay_2_0" ||  body.name == "flay_2_1" || body.name == "flay_2_2":
		follow = false
		flayAni2_0.flip_h = false
