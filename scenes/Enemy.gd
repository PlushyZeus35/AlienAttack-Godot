extends Area2D

export var enemySpeed = 600
# Declare custom signals
signal died

func _physics_process(delta):
	global_position.x -= enemySpeed*delta
	pass

func die():
	emit_signal('died')
	queue_free()


func _on_Enemy_body_entered(body):
	queue_free()
	body.takeDamage()
