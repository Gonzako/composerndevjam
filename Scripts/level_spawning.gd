extends Node2D

@export var obstacle : Array[PackedScene]
@export var bottomNode : Node2D
@export var topNode : Node2D
@export var spawnParent : Node2D

func SpawnRandomObstacle(given_side = -1):
	var rng = RandomNumberGenerator.new()
	var target_obstacle = obstacle[0].instantiate()
	var side
	if given_side == -1:
		side = rng.randi_range(0, 1)
	else:
		side = given_side
	
	target_obstacle.position = [bottomNode, topNode][side].position
	target_obstacle.position.x += rng.randi_range(-280, 280)
	target_obstacle.from_bottom = [true, false][side]
	target_obstacle.linear_velocity.x = rng.randi_range(-100, 100)
	spawnParent.add_child(target_obstacle)

func SpawnObstacle(pos_offset: float, obs_idx: int, from_bottom = true, x_momentum: int = 0) -> void:
	var target_obstacle = obstacle[obs_idx].instantiate()
	target_obstacle.position = (bottomNode if from_bottom == true else topNode).position
	target_obstacle.position.x += pos_offset
	target_obstacle.from_bottom = from_bottom
	target_obstacle.linear_velocity.x = x_momentum
	spawnParent.add_child(target_obstacle)
