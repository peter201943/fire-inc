extends KinematicBody




# https://github.com/GarbajYT/godot-projectile-weapons/blob/master/ProjectileStarter.gd
# try this later: https://gitlab.com/monnef/golden-gadget
# https://godotengine.org/qa/7850/how-to-combine-x-and-y-rotation-but-leave-z-untouched
# https://godotengine.org/qa/234/how-to-get-the-screen-dimensions-in-gdscript
# https://godotengine.org/qa/5878/set-mouse-position
# https://docs.godotengine.org/en/stable/tutorials/inputs/mouse_and_input_coordinates.html
# http://kidscancode.org/godot_recipes/2d/screen_wrap/


# ARG! Curse you GDScript!
#
# Peter's Grievances:
# - No first class functions !!!
# - No inline functions !!!
# - No tuples ?!?!?!?!?!
#     - cannot pass multiple arguments between functions!!! GRRRR




# options
var options			# the player options
var difficulty		# the difficulty options




# status
var status			# status of the player at any given moment




# movement
var direction
var velocity
var can_jump = false



# gun
onready var projectile = preload("res://asset/scene/projectile.tscn")
var p # TEMP TEMP TEMP
var fire_delay = 1




func _ready():
	
	# Keep mouse in window
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	# reset direction and velocity
	direction = Vector3()
	velocity = Vector3()
	
	# misc
	_bind()
	_test_docs()




func _bind():
	"""Bind the variables to scene instances"""
	var options_holder = self.get_node("../optionsN")
	options = options_holder.player
	difficulty = options_holder.difficulty
	status = self.get_node("../statusN")




func _input(event):
	_rotate(event)




func _rotate(event):
	"""Read the user's mouse and smoothly rotate them"""
	# FIXME: SOMETHING IS REALLY WEIRD HERE!
	if event is InputEventMouseMotion:
		
		# rotate the player
		rotate_y(deg2rad(-event.relative.x * options.mouse.sensitivity.y))
		rotate_x(deg2rad(-event.relative.y * options.mouse.sensitivity.x))
		
		# prevent gimbal lock
		rotation.x = clamp(rotation.x, deg2rad(-90), deg2rad(90))
		
		# prevent rolling
		rotation.z = 0




func _test_docs():
	"""Test the help strings on the settings objects"""
	print(status.help)
	print(options.help)
	print(difficulty.help)
	print(options.move.jump)
	print(difficulty.fire.disperse.help)
	print(difficulty.fire.disperse.speed)




func _physics_process(delta):
	var args = [delta, Vector3(0.0, direction.y, 0.0), velocity]
	_fall( _user_jump( _walk( _user_move( args ) ) ) )
	_user_fire(delta)
	if p:
		p.apply_impulse(p.transform.basis.z, -p.transform.basis.z * difficulty.fire.disperse.speed) 





func _user_jump(args):
	
	"""Check if the user can jump and if they want to jump"""
	
	var delta = args[0]
	var direction = args[1]
	var velocity = args[2]
	
	if not can_jump and is_on_floor():
		can_jump = true
	if not can_jump:
		direction.y -= options.move.fall * delta
	if can_jump and Input.is_action_just_pressed("jump"):
		direction.y = options.move.jump
		can_jump = false
		print("JUMPING!")
	
	return [delta, direction, velocity]




func _fall(args):
	
	"""Apply forces to the player when jumping"""
	
	var delta = args[0]
	var direction = args[1]
	var velocity = args[2]
	
	move_and_slide(direction, Vector3.UP)
	
	return [delta, direction, velocity]




func _walk(args):
	
	"""Moves the player in the direction they want to fo"""
	
	var delta = args[0]
	var direction = args[1]
	var velocity = args[2]
	
	velocity = velocity.linear_interpolate(direction * options.move.speed, options.move.acceleration * delta)
	velocity = move_and_slide(Vector3(velocity[0], 0, velocity[2]), Vector3.UP)
	
	return [delta, direction, velocity]




func _user_move(args):
	
	"""Check if the user wants to move"""
	
	var delta = args[0]
	var direction = args[1]
	var velocity = args[2]
	
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z
	elif Input.is_action_pressed("move_backward"):
		direction += transform.basis.z
	if Input.is_action_pressed("move_left"):
		direction -= transform.basis.x			
	elif Input.is_action_pressed("move_right"):
		direction += transform.basis.x
	
	return [delta, direction.normalized(), velocity]




func _user_fire(delta):
	"""Check if the user wants to fire and do so"""
	if Input.is_action_pressed("fire") and fire_delay <= 0:
		fire_delay = difficulty.fire.disperse.rate
		p = projectile.instance()
		add_child(p)
	fire_delay -= delta









