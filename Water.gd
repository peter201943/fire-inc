extends KinematicBody

export var distance = 5

func _ready():
	pass

func _process(delta):
	# determine the vector within the cone the sphere will follow
	var dir = rand_range(-.5, .5)
	
	# if input is pushed send the sphere down the vector path
	if Input.is_action_pressed("ui_accept"):
		var move = Vector3(distance, 0, dir)
		var colliding = move_and_collide(move*delta)
