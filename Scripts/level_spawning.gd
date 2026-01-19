extends Node2D

@export var obstacle : Array[PackedScene]
@export var bottomNode : Node2D
@export var topNode : Node2D
@export var spawnParent : Node2D

func SpawnObstacle(pos_offset: float, obs_idx: int, from_bottom = true) -> void:
	var target_obstacle = obstacle[obs_idx].instantiate()
	target_obstacle.position = bottomNode.position
	target_obstacle.position.x += pos_offset
	spawnParent.add_child(target_obstacle)
