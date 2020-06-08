extends Control
# Declare member variables here. Examples:
var notPaused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause"):
		if notPaused:
			get_tree().paused = true
			visible = true
			notPaused = false
		else:
			get_tree().paused = false
			notPaused = true
			visible = false
		
	
func _on_ResumeButton_pressed():
	get_tree().paused = false
	notPaused = true
	visible = false

func _on_RestartButton_pressed():
	get_tree().reload_current_scene()
	notPaused = true
	visible = false	

func _on_QuitButton_pressed():
	get_tree().quit()
	pass
