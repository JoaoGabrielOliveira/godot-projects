extends RigidBody2D

var is_selected: bool
var is_hovered: bool

func _ready():
	self.input_pickable = true

func _physics_process(delta):
	if is_selected:
		global_transform.origin = get_global_mouse_position()
	
func _mouse_enter():
	self.modulate = Color.RED
	is_hovered = true

func _mouse_exit():
	self.modulate = Color.WHITE
	is_hovered = false

func _input(event):
	if event is InputEventMouseButton:
		_on_click_mouse(event)
	elif event is InputEventMouseMotion:
		_on_move_mouse(event)

func _on_click_mouse(event: InputEventMouseButton):
	var mouse_position = get_viewport().get_mouse_position()
	if event.is_pressed():
		if is_hovered:
			is_selected = true
	elif event.is_released():
		is_selected = false
		
func _on_move_mouse(event: InputEventMouseMotion):
	pass
