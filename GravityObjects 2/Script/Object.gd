extends RigidBody2D

var dragging = false
signal on_drag

var hovering = false
signal on_hover

var direction = Vector2.ZERO

var last_linear

@export var test : String = ""


func _mouse_enter():
	if(!hovering):
		on_hover.emit(true)
	hovering = true
	
	
func _mouse_exit():
	hovering = false
	on_hover.emit(false)
	
func _input(event):
	if event is InputEventMouseButton:
		if (hovering && event.is_pressed()):
			dragging = true
			on_drag.emit(true)
		elif event.is_released():
			dragging = false
			on_drag.emit(false)
		direction = (get_global_mouse_position() - global_transform.origin).normalized()


func _physics_process(delta):
	_apply_physics()

func _apply_physics():
	if last_linear != linear_velocity:
		last_linear = linear_velocity

	if dragging:
		var distance:float = global_transform.origin.distance_to(get_global_mouse_position())
		if distance > 150:
			dragging = false
		else:
			print(round(distance))
			direction = (get_global_mouse_position() - global_transform.origin)
			apply_force(((direction) * 5 * distance) / mass)
			linear_damp = distance
	else:
		linear_damp = 3.061

func _on_body_entered(body):
	print(last_linear)
	if abs(last_linear.x) > 50 || abs(last_linear.y) > 50:
		print("Break")
	elif abs(last_linear.x) > 10 || abs(last_linear.y) > 10:
		print("Crack")
