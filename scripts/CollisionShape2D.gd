extends CollisionShape2D


var laserSpeed = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	global_position.x = global_position.x + laserSpeed
	pass
