extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var move_axis = ["ui_left","ui_right","ui_up","ui_down"]
@export var animation_player: AnimationPlayer
var move_animations = ["left", "right", "up", "down"]

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		#Shoot logic
		print("test")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector(move_axis[0],move_axis[1],move_axis[2],move_axis[3]).normalized()
	if direction:
		velocity = direction * SPEED
		
		# Simple animation player
		for index in move_axis.size():
			if Input.is_action_pressed(move_axis[index]):
				animation_player.play(move_animations[index])
		
	else:
		velocity = velocity.move_toward(Vector2.ZERO,SPEED*0.2)
		animation_player.play("idle")

	move_and_slide()
