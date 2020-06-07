extends Spatial

var on_fire = false
var burn_rate = 1
var health = 100
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if not on_fire:
		pass #set fire effects?
	
	if not dead and on_fire:
		health -= burn_rate
		#set fire effects?
	if health <= 0:
		dead = true
		
	if dead:
		pass #TODO


func set_onfire(b):
	on_fire = b
