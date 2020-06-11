extends Spatial

var on_fire = true
var burn_rate = float(1)
var water_strength = float(0.05)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	# TODO - set fire effects
	if on_fire:
		pass
	else:
		pass


# TODO - hook this up to collision event
func hit():
	print("i'm being called")
	burn_rate -= water_strength
	if burn_rate <= 0:
		on_fire = false
