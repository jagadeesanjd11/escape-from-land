extends CharacterBody2D
@onready var teniAni2_0 = $teniAni2_0
@onready var soundHurt:AudioStreamPlayer2D = $soundHurt
@onready var player:CharacterBody2D = $"../player"
@export var move_speed:float = 320.0
@export var target: CharacterBody2D

var follow:bool = true
var time_passed: float = 0.0
var wait_time: float = 2 # Wait for 2 seconds
var teniHit: bool = false
func _ready() -> void:
	teniAni2_0.flip_h = true
	teniAni2_0.play("flay")
	print("teni ", Coman.game_level)
	if Coman.game_level == 9:
		move_speed = 325
func _physics_process(delta: float) -> void:
	if follow == true:
		if teniHit == true:
			var direction = position.direction_to(Vector2(player.global_position.x-150,player.global_position.y)).normalized()
			velocity = direction * move_speed
			move_and_slide()
			teniHit= false
		else:
			var direction = position.direction_to(player.global_position).normalized()
			velocity = direction * move_speed
			move_and_slide()
			teniHit = true
	else:
		var direction: Vector2 = global_position.direction_to(Vector2(473,572))
		velocity = direction * move_speed
		move_and_slide()
		
		#anime
		time_passed += delta
		if time_passed >= wait_time:
			#print("Timeout reached!")
			if teniAni2_0.flip_h == true:
				teniAni2_0.flip_h = false
			else:
				teniAni2_0.flip_h = true
			time_passed = 0.0 # Reset the timer loop
			$AnimationPlayer.play("moving")
func _on_teni_area_2_0_body_entered(body: Node2D) -> void:
	Coman.hurt(body, soundHurt)
	if body.name == "player":
		teniHit=true
func _on_stop_area_teni_2_0_body_entered(body: Node2D) -> void:
	print("body 1", body.name)
	if body.name == "teni2_0" || body.name == "teni2_1":
		follow = false
		teniAni2_0.flip_h = false

func _on_stop_area_enemy_body_exited(body: Node2D) -> void:
	print("body 2", body.name)
	if body.name == "teni2_0" || body.name == "teni2_1" || body.name == "teni2_2":
		follow = false
		teniAni2_0.flip_h = false
