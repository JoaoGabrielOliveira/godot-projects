extends RigidBody2D

var dragging = false
var hovering = false
var direction = Vector2.ZERO
var last_linear

func _mouse_enter():
	hovering = true
	
func _mouse_exit():
	hovering = false
	
func _input(event):
	if event is InputEventMouseButton:
		dragging = true if (hovering && event.pressed) else false
		direction = (get_global_mouse_position() - global_transform.origin).normalized()
	
func _physics_process(delta):
	_apply_physics()
	pass

func _apply_physics():
	if last_linear != linear_velocity:
		last_linear = linear_velocity
		print(last_linear)

	if dragging:
		
		direction = (get_global_mouse_position() - global_transform.origin).normalized()
		apply_central_impulse(direction * 50)
