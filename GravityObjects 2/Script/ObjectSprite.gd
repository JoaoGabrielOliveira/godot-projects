extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_object_on_hover(hovering):	
	if (hovering):
		self_modulate = Color.YELLOW
	else:
		self_modulate = Color.WHITE


func _on_object_on_drag(dragging):
	if (dragging):
		self_modulate = Color.RED
	else:
		self_modulate = Color.WHITE
