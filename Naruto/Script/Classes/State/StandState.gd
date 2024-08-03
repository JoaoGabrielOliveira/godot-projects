extends State

"""
Using @export in all states will allocated a lot of memory space.
Should think a way to managent character animation in a one place

A code way is put a script on animated sprite, who checks the current state
"""

# Run when it´s runned by first time
func _enter():
	pass
	
func _exit():
	#animated_sprite.queue_free()
	pass
