extends Node2D

@export
var anim: AnimatedSprite2D
@export
var speed: float

@onready
var state_machine = $StateMachine

var velocity: Vector2 = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anim.flip_h = velocity.x < 0
	pass
	
func _physics_process(delta):
	if velocity != Vector2.ZERO:
		position += (velocity * speed * delta)
	
func _input(event):
	if event.is_pressed():
		if (event.is_action_pressed("ui_left")):
				state_machine.change_state("Running")
				velocity.x = -1
		if (event.is_action_pressed("ui_right")):
				state_machine.change_state("Running")
				velocity.x = 1
	elif event.is_released():
		state_machine.change_state("Standing")
		velocity.x = 0
