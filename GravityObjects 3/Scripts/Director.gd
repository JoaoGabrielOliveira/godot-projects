extends Node
class_name Director

signal hover_object
static var hovered_object : GravityObject

func _input(event):
	if event is InputEventMouseButton and hovered_object != null:
		if event.is_pressed():
			hovered_object.is_dragging = true
		
		if event.is_released():
			hovered_object.is_dragging = false
			hovered_object = null

