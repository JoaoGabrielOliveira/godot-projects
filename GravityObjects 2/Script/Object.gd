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

func _apply_physics():
	if last_linear != linear_velocity:
		last_linear = linear_velocity

	if dragging:
		var distance:float = global_transform.origin.distance_to(get_global_mouse_position())
		if distance > 150:
			dragging = false
		else:
			print(round(distance))
			direction = (get_global_mouse_position() - global_transform.origin).normalized()
			apply_central_impulse(((direction) * 5 * distance) / mass)

func _on_body_entered(body):
	print(last_linear)
	if abs(last_linear.x) > 50 || abs(last_linear.y) > 50:
		print("Break")
	elif abs(last_linear.x) > 10 || abs(last_linear.y) > 10:
		print("Crack")
