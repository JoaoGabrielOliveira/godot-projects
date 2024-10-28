extends Node
class_name Director

signal hover_object
static var hovered_object : GravityObject
static var mouse_strength : float = 50

func _input(event):
	if event is InputEventMouseButton and hovered_object != null:
		if event.is_pressed() && hovered_object.is_hovering:
			hovered_object.dragging.emit(true, event)
		
		if event.is_released():
			hovered_object.dragging.emit(false, event)
