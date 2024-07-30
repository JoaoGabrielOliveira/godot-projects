extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match $"..".state:
		StateMachine.State.STANDING:
			play("standing")
			
		StateMachine.State.RUNNING:
			play("running")
	
