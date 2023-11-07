extends Node2D


# Declare enemy scene
export var enemyScene = preload("res://scenes/Enemy.tscn")
# Get spawn positions
onready var spawnPositions = $SpawnPositions
# Declare custom signals
signal enemy_spawned(enemyInstance)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	# Get all positions
	var positions = spawnPositions.get_children()
	# Randomize array
	positions.shuffle()
	# Generate an enemy in a random position
	spawn_enemy(positions[0].global_position)
	pass

func spawn_enemy(position):
	var enemyInstance = enemyScene.instance()
	enemyInstance.global_position = position
	emit_signal('enemy_spawned', enemyInstance)
	pass
