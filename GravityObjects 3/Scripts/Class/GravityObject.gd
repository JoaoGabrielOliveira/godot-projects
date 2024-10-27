class_name GravityObject
extends Node

#region Public
@export var mass: float
@export var sprite: Sprite2D
@export var rigidbody2d: RigidBody2D
#endregion

#region Privete
var direction : Vector2
#endregion

#region Events
signal hovering
signal dragging
signal cracking
signal breaking
signal do_action
#endregion

func _ready():
	pass
func _process(delta):
	pass
