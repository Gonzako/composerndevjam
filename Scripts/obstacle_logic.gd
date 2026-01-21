extends RigidBody2D

var obstacle_types = ["bird", "brick", "broke", "spinner"]
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var from_bottom: bool = true
var bottom_modulate: Color = Color(4.3, 0.722, 0.0)
var bottom_collision = 2
var top_collision = 4

func _ready():
	sprite.play(obstacle_types.pick_random())
	if from_bottom:
		sprite.self_modulate = bottom_modulate
		set_collision_layer(bottom_collision)
		set_collision_mask(bottom_collision)
	else:
		set_collision_layer(top_collision)
		set_collision_mask(top_collision)
		gravity_scale = 1
		sprite.rotation_degrees = 180

func _on_body_entered(body: Node) -> void:
	print("Hit node " + body.name)
	if body.has_method("get_reckt"):
		body.get_reckt()
	pass # Replace with function body.
