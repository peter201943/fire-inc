extends KinematicBody

export var distance = 100
export var radius = 20
var dir

func _ready():
	dir = rand_range(-radius, radius)

func _process(delta):
	var colliding
	
	# put logic here for gravity drop!
	
	if Input.is_action_pressed("ui_accept"):
		var move = Vector3(distance, 0, dir)
		colliding = move_and_collide(move * delta)
	
	if colliding:
		set_global_transform(Transform.IDENTITY)
		dir = rand_range(-radius, radius)
