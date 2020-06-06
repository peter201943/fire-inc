extends Spatial

var ROWS = 4
var COLUMNS = 3
var WINDOW_SIZE = float(1) #set to same size as window size in window.tscn

var WINDOWS = []

# Called when the node enters the scene tree for the first time.
func _ready():
	$"MeshInstance".scale = Vector3(
		WINDOW_SIZE/2 + COLUMNS*WINDOW_SIZE*2,
		WINDOW_SIZE/2 + ROWS*WINDOW_SIZE*2,
		1)
		
	var windows_parent = Spatial.new()
	windows_parent.name = "Windows"
	windows_parent.translation = Vector3(0, 0, 0)
	windows_parent.translate(Vector3(-5*WINDOW_SIZE, -4*WINDOW_SIZE, 0))
	
	#var marker = MeshInstance.new()
	#marker.mesh = SphereMesh.new()
	#marker.translate(Vector3(0, 0, 0.1))
	#windows_parent.add_child(marker)
	
	add_child(windows_parent)
		
	for y in range(ROWS):
		WINDOWS.append([])
		for x in range(COLUMNS):
			var window = load("res://Window.tscn").instance()
			window.name = "(" + str(x) + ", " + str(y) + ")"
			
			window.translation = Vector3(
				(WINDOW_SIZE/2) + 2.5*((x*WINDOW_SIZE) + x*(WINDOW_SIZE/2)),
				(WINDOW_SIZE/2) + 2.5*((y*WINDOW_SIZE) + y*(WINDOW_SIZE/2)),
				0)
			
			WINDOWS[y].append(window)
			windows_parent.add_child(window)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass  
