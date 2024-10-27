extends Camera2D

var move_camera = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		move_camera =  event.is_pressed() && event.button_index == MOUSE_BUTTON_MIDDLE
		
	elif event is InputEventMouseMotion:
		if move_camera:
			global_position = get_global_mouse_position()
