extends RigidBody2D
class_name GravityObject


#region Public
@export var sprite: Sprite2D
#endregion

#region Privete
var direction : Vector2
var is_dragging : bool
var is_hovering : bool
#endregion

#region Events
signal hovering
signal dragging
signal cracking
signal breaking
signal do_action
#endregion

func _process(delta):
	if (is_hovering):
		sprite.self_modulate = Color.AQUA
	else:
		sprite.self_modulate = Color.WHITE

func _mouse_enter():
	if(!is_hovering):
		hovering.emit(true)
	is_hovering = true	
func _mouse_exit():
	is_hovering = false
	hovering.emit(false)
