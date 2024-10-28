extends RigidBody2D
class_name GravityObject

#region Public
@export var sprite: Sprite2D
#endregion

#region Privete
var direction : Vector2
var last_linear_velocity : Vector2


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


func _ready():
	_connect_signals()

func _process(delta):
	if (is_hovering && is_dragging):
		sprite.self_modulate = Color.DARK_RED
	elif (is_hovering):
		sprite.self_modulate = Color.AQUA
	else:
		sprite.self_modulate = Color.WHITE

func _physics_process(delta):
	if is_dragging:
		_apply_physics()


func _apply_physics():
	if last_linear_velocity != linear_velocity:
		last_linear_velocity = linear_velocity
	direction = (get_global_mouse_position() - global_transform.origin) * 50
	apply_central_force(direction)

func _mouse_enter():
	hovering.emit(true)

func _mouse_exit():
	hovering.emit(false)

func _connect_signals():
	dragging.connect(_on_object_is_draged)
	hovering.connect(_on_object_is_hovered)

func _on_object_is_draged(drag: bool, event: InputEventMouseButton):
	is_dragging = drag
	print_debug("Dragging: ", drag)
	
	hovering.emit(false)
	
	if(!is_dragging && !is_hovering):
		Director.hovered_object = null
		
func _on_object_is_hovered(hover:bool):
	is_hovering = hover
	Director.hovered_object = self
	print_debug("Hovering: ", hover)
