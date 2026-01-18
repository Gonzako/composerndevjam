extends Node

@onready var animated_sprite_2d: AnimatedSprite2D = $"../AnimatedSprite2D"
@export var rotation: int = 0
@export var origin: Node2D

func _process(_delta):
	if (get_tree().get_frame() % 5 == 0):
		var newsprite: AnimatedSprite2D = animated_sprite_2d.duplicate()
		newsprite.stop()
		newsprite.z_index = 0
		newsprite.modulate.a = 0
		newsprite.global_position = origin.global_position
		newsprite.rotation = rotation
		
		add_child(newsprite)
		newsprite.start_fading()
