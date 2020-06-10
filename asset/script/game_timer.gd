extends Control

var display_value = 120
onready var timer = get_node("Timer")


# Called when the node enters the scene tree for the first time.
func _ready():
	$"Label".text = str(display_value)
	timer.set_wait_time(1)
	timer.start()


func _process(_delta):
	$"Label".text = str(display_value)


func timer_timeout():
	display_value -= 1
	if display_value <= 0:
		display_value = 0
		$"GameOver".visible = true
