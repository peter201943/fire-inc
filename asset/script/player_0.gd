extends KinematicBody









func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.y * mouse_sensitivity))
