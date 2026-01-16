extends Node2D

@export var max_clouds: int = 15

var cloud_scene = preload("res://Components/cloud.tscn")
@export var animation_player: AnimationPlayer

func _ready():
	animation_player.play("idle")

func create_cloud():
	var clouds_count = 0
	
	for child in get_children():
		if child is Sprite2D:
			clouds_count += 1
	
	if clouds_count >= max_clouds:
		return
	
	var new_cloud = cloud_scene.instantiate()
	new_cloud.set_new_position = true
	add_child(new_cloud)
