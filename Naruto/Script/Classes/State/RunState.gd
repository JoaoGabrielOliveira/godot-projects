extends State

"""
Using @export in all states will allocated a lot of memory space.
Should think a way to managent character animation in a one place

A code way is put a script on animated sprite, who checks the current state
"""
@export
var animated_sprite: AnimatedSprite2D

# Run when it´s runned by first time
func _enter():
	super()
	animated_sprite.play(AnimationUtil.RUNNING)
	
func _exit():
	animated_sprite.queue_free()
