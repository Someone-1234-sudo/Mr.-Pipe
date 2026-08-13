extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite = $AnimatedSprite2D
@onready var efect_fumo = $fumo
@onready var efect_passo = $passos


func _process(delta: float) -> void:
	# Add the gravity.

	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.x < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
		animated_sprite.play("andando")
		#efect_fumo.stop()
		#efect_passo.stream = load("res://sound effects/passos.mp3")
		#efect_passo.play(0.0)
	else:
		# efect_passo.stop()
		#efect_fumo.stream = load("res://sound effects/fumo.mp3")
		#efect_fumo.play(0.0)
		animated_sprite.play("lazer")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
