extends Node2D
export var lives = 3
var score = 0
onready var player = $Player
onready var hud = $UI/HUD
onready var ui = $UI
var gameOverScene = preload("res://scenes/GameOverScreen.tscn")

func _ready():
	hud.setScoreLabel(score)
	hud.setLifeLabel(lives)

func _on_DeathZone_area_entered(area):
	area.queue_free()
	pass # Replace with function body.


func _on_Player_tookDamage():
	lives -= 1
	hud.setLifeLabel(lives)
	if lives==0:
		var gameOverInstance = gameOverScene.instance()
		gameOverInstance.setScore(score)
		ui.add_child(gameOverInstance)
		player.die()
	pass

func _on_enemy_died():
	score += 100
	hud.setScoreLabel(score)

func _on_EnemySpawner_enemy_spawned(enemyInstance):
	enemyInstance.connect('died', self, '_on_enemy_died')
	add_child(enemyInstance)
	pass # Replace with function body.


