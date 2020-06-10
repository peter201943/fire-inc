extends RigidBody

export var distance = 100
export var radius = 20

func reset(i):
	set_global_transform(Transform.IDENTITY)

func _ready():
	connect("body_entered", self, "reset")
