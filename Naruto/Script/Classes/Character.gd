extends Node2D

@export
var anim: AnimatedSprite2D

@onready
var state_machine = $StateMachine

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
				state_machine.change_state("RunState")
	elif  event is InputEventKey and event.is_released():
		state_machine.change_state("StandState")
