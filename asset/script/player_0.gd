extends KinematicBody




# https://github.com/GarbajYT/godot-projectile-weapons/blob/master/ProjectileStarter.gd
# try this later: https://gitlab.com/monnef/golden-gadget
# ARG! Curse you GDScript!
#
# Peter's Grievances:
# - No first class functions !!!
# - No inline functions !!!
# - No tuples ?!?!?!?!?!




# options
var options			# the player options
var difficulty		# the difficulty options




# status
var status			# status of the player at any given moment




func _ready():
	_bind()
	_test_docs()




func _bind():
	"""Bind the variables to scene instances"""
	var options_holder = self.get_node("../optionsN")
	options = options_holder.player
	difficulty = options_holder.difficulty
	status = self.get_node("../statusN")




func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * options.mouse.sensitivity.y)) 
		rotate_x(deg2rad(-event.relative.y * options.mouse.sensitivity.x)) 
		rotation.x = clamp(rotation.x, deg2rad(-90), deg2rad(90))




func _test_docs():
	"""Test the help strings on the settings objects"""
	print(status.help)
	print(options.help)
	print(difficulty.help)




func _physics_process(delta):
	var args = [delta, Vector3()]
	_jump( _move( args ) )





func _jump(args):
	var delta = args[0]
	var direction = args[1]
	return [delta, direction]




func _move(args):
	
	var delta = args[0]
	var direction = args[1]
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x			
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	return [delta, direction]








