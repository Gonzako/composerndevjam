extends Sprite2D

@export var sprite_amount: int = 6

var rng = RandomNumberGenerator.new()
var initial_position_x
var initial_position_y

var scale_mult
var speed_mult

var movement_speed

var has_appeared: bool = false
var is_top: int

var set_new_position: int = false

func _ready():
	texture = load("res://sprites/background/cloud{i}.PNG".format({"i": rng.randi_range(1, sprite_amount)}))
	
	is_top = rng.randi_range(0, 1)
	
	scale_mult = rng.randf_range(0.1, 0.3)
	speed_mult = rng.randf_range(1, 2)
	
	scale = Vector2(scale_mult, scale_mult)
	self_modulate.a = 0.5
	
	if set_new_position:
		set_initial_position()
	
	movement_speed = -10 * speed_mult if is_top else 10 * speed_mult

func set_initial_position():
	var self_height = self.texture.get_height() * scale_mult
	var screen_height = get_viewport_rect().size[1]
	var screen_width = get_viewport_rect().size[0]
	
	#Y position is either at the top or bottom of the screen
	initial_position_y = (1 if is_top else -1) * ((screen_height + self_height) / 2)
	position[1] = initial_position_y
	#X position can be anywhere along the X axis
	initial_position_x = rng.randi_range(-screen_width / 2, screen_width / 2)
	position[0] = initial_position_x

func _process(delta):
	for child in get_children():
		if not child.is_on_screen():
			if has_appeared:
				queue_free()
		else:
			has_appeared = true
	
	position[1] += movement_speed * delta
