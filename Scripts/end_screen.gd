extends Node2D



func _on_button_pressed():
	$AudioStreamPlayer.stop()
	get_tree().change_scene_to_file("res://Scenes/TestScene.tscn")
