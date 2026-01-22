extends AnimationPlayer

@onready var spawner: AnimationPlayer = $Spawner
@onready var label: Label = $"../Label"

var level_order = ["intermission1", "level2", "level3"]

func play_next_level():
	var next = level_order.pop_front()
	
	play(next)
	spawner.play(next)

func play_final_spawner():
	spawner.play("final")

func finish_game():
	get_tree().change_scene_to_file("res://Scenes/win.tscn")

func display_label(text: String):
	label.text = text
	label.show()

func hide_label():
	label.hide()
