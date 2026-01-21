extends Node2D

@export var obstacle : Array[PackedScene]
@export var bottomNode : Node2D
@export var topNode : Node2D
@export var spawnParent : Node2D

func SpawnRandomObstacle():
	var rng = RandomNumberGenerator.new()
	var target_obstacle = obstacle[0].instantiate()
	var side = rng.randi_range(0, 1)
	
	target_obstacle.position = [bottomNode, topNode][side].position
	target_obstacle.position.x += rng.randi_range(-280, 280)
	target_obstacle.from_bottom = [true, false][side]
	spawnParent.add_child(target_obstacle)

func SpawnObstacle(pos_offset: float, obs_idx: int, from_bottom = true) -> void:
	var target_obstacle = obstacle[obs_idx].instantiate()
	target_obstacle.position = bottomNode.position
	target_obstacle.position.x += pos_offset
	target_obstacle.from_bottom = from_bottom
	spawnParent.add_child(target_obstacle)
