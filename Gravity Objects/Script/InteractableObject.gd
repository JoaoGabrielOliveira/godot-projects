extends RigidBody2D

signal clicked
var held = false


func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			clicked.emit(self)
	
func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()
	
func pickup():
	if held:
		return
	held = true

func drop(impulse=Vector2.ZERO):
	if held:
		apply_central_impulse(impulse)
		held = false
