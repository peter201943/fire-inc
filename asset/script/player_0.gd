extends KinematicBody


# https://github.com/GarbajYT/godot-projectile-weapons/blob/master/ProjectileStarter.gd



# options
var player
var difficulty

# status
var status



func _ready():
	_bind()


func _bind():
	"""Bind the variables to scene instances"""
	var options = self.get_node("../optionsN")
	player = options.player
	difficulty = options.difficulty
	status = self.get_node("../statusN")



func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * player.mouse.sensitivity.y)) 
		rotate_x(deg2rad(-event.relative.y * player.mouse.sensitivity.x)) 
		rotation.x = clamp(rotation.x, deg2rad(-90), deg2rad(90))











