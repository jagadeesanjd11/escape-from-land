extends CharacterBody2D
@onready var playerAni:AnimatedSprite2D = $playerAni
@onready var soundJump:AudioStreamPlayer2D = $soundJump
const SPEED = 300.0
const JUMP_VELOCITY = -850.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		playerAni.play("jump")
		soundJump.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_pressed("move_left"):
		playerAni.play("run")
	if Input.is_action_pressed("move_right"):
		playerAni.play("run")
	if Input.is_action_just_released("move_left"):
		playerAni.play("stand")
	if Input.is_action_just_released("move_right"):
		playerAni.play("stand")
	if Input.is_action_just_released("jump"):
			playerAni.play("stand")
		
