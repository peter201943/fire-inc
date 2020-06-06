extends Spatial

export var particleAmount = 16
var waterParticleScene
var waterParticleInstance

func _ready():
	# Load particle
	waterParticleScene = load("res://Water.tscn")
	waterParticleInstance = waterParticleScene.instance()
	
	# Create a bunch of particles
	for i in range(particleAmount):
		waterParticleScene.instance()

func _process(delta):
	# Pool the objects
	pass
