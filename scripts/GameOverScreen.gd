extends Control


func setScore(newScore):
	$Panel/FinalScore.text = "FINAL SCORE: " + str(newScore)

func _on_Button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
