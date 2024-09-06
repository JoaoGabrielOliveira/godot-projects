extends Node2D

var held_object = false

func _ready():
	for node in $Actors.get_children():
		if node is RigidBody2D:
			node.clicked.connect(_on_pickable_clicked)
		
func _on_pickable_clicked(object):
	if !held_object:
		object.pickup()
		held_object = object
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_velocity() / 1.0)
			held_object = null
