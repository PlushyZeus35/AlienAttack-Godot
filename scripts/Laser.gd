extends Area2D


export var laserSpeed = 600
onready var visibleNotifier = $visibleNotifier

func _physics_process(delta):
	global_position.x += laserSpeed*delta
	pass

func _on_VisibleNotifier_screen_exited():
	queue_free()


func _on_Laser_area_entered(area):
	queue_free()
	area.die()
	pass # Replace with function body.
