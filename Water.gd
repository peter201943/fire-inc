extends RigidBody

func _ready():
	set_as_toplevel(true)


func _on_Area_body_entered(body):
	if body.is_in_group("Window"):
		print("window hit me")
		body.hit()
	queue_free()
