extends Control

onready var score = $Score
onready var life = $Life

func setScoreLabel(newScore):
	score.text = 'SCORE: ' + str(newScore)
	
func setLifeLabel(newLife):
	life.text = str(newLife)
