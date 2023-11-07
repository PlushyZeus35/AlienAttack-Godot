extends KinematicBody2D


# Declare player speed
export var playerSpeed = 400
# Declare laser gun
export var laserScene = preload("res://scenes/Laser.tscn")
# Get rocket container
var rocketContainer
var laserOffset = 50
# Declare custom signals
signal tookDamage

# Called when the node enters the scene tree for the first time.
func _ready():
	rocketContainer = get_node("RocketContainer")

func _physics_process(delta):
	# Move player
	var vector = Vector2(0, 0)
	if Input.is_action_pressed("ui_right"):
		vector.x = playerSpeed
	if Input.is_action_pressed("ui_left"):
		vector.x = -playerSpeed
	if Input.is_action_pressed("ui_up"):
		vector.y = -playerSpeed
	if Input.is_action_pressed("ui_down"):
		vector.y = playerSpeed
	move_and_slide(vector)
	
	# Get viewport screen resolution
	var projectResolution = get_viewport().size
	# Avoid the player movement out of the viewport area
	if global_position.x < 0:
		global_position.x = 0
	if global_position.x > projectResolution.x:
		global_position.x = projectResolution.x
	if global_position.y < 0:
		global_position.y = 0
	if global_position.y > projectResolution.y:
		global_position.y = projectResolution.y
	pass

func _process(delta):
	# Shoot player
	if Input.is_action_just_pressed("ui_accept"):
		shoot()
	pass
	
func shoot():
	var laserInstance = laserScene.instance()
	rocketContainer.add_child(laserInstance)
	laserInstance.global_position = global_position
	laserInstance.global_position.x += laserOffset

func takeDamage():
	emit_signal('tookDamage')
	pass
	
func die():
	queue_free()
