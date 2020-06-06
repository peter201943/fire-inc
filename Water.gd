extends RigidBody

export(Vector3) var movement

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move()
	
func move():
	add_force(movement, transform.origin)
