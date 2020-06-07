extends Button
# Declare member variables here. Examples:
var notPaused = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func pause():
	if Input.is_action_just_pressed("Pause"):
		if notPaused:
			get_tree().paused = true
			$PausePanel.show()
			notPaused = false
		else:
			get_tree().paused = false
			not
		

func on_resume_pressed():
	$PausePanel.hide()
	get_tree().paused = false
	
func on_restart_pressed():
	get_tree().reload_current_scene()

func on_quit_pressed():
	get_tree().quit()
	pass
