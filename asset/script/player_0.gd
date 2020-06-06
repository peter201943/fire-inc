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



# movement
var direction
var velocity




func _ready():
	direction = Vector3()
	velocity = Vector3()
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
	var args = [delta, Vector3(0.0, direction.y, 0.0)]
	print( _fall( _user_jump( _walk( _user_move( args ) ) ) ) )





func _user_jump(args):
	var delta = args[0]
	var direction = args[1]
	
	if not is_on_floor():
		direction.y -= options.move.fall * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		direction.y = options.move.jump
	
	return [delta, direction]




func _fall(args):
	var delta = args[0]
	var direction = args[1]
	move_and_slide(direction, Vector3.UP)
	return [delta, direction]




func _walk(args):
	var delta = args[0]
	var direction = args[1]
	move_and_slide(direction, Vector3.UP)
	return [delta, direction]




func _user_move(args):
	
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
	
	return [delta, direction.normalized()]








