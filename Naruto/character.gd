extends Node2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var state = StateMachine.State.STANDING
var velocity: Vector2 = Vector2.ONE

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	pass
	
func _input(event):
	if event is InputEventKey and event.is_pressed():
		match event.keycode:
			KEY_A, KEY_D:
				state = StateMachine.State.RUNNING
			_:
				state = StateMachine.State.STANDING
	elif  event is InputEventKey and event.is_released():
		state = StateMachine.State.STANDING
