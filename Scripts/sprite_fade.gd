extends AnimatedSprite2D

var distance = 250

func update_opacity(opacity: float):
	modulate.a = opacity

func update_position(new_pos: float):
	position.y = new_pos

func start_fading():
	var opacity_tween = get_tree().create_tween()
	opacity_tween.tween_method(update_opacity, 0.3, 0.0, 1)
	
	var rotated = 1 if rotation == 0 else -1
	
	var current_y = position.y
	var position_tween = get_tree().create_tween()
	position_tween.tween_method(update_position, current_y, current_y - (rotated * distance), 1)
	
	position_tween.finished.connect(queue_free) 
