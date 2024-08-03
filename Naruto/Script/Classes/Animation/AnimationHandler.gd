extends AnimatedSprite2D

@onready
var state_machine: StateMachine = $"../StateMachine"

# Called when the node enters the scene tree for the first time.
func _ready():
	state_machine.change_state_signal.connect(on_state_change)
	if state_machine.initial_state:
		self.play(state_machine.initial_state.name.to_lower())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_state_change(previues_state:String, next_state:String):
	self.play(next_state.to_lower())
