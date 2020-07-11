extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.


func _process(delta):
	var crosshairTrace = $crosshairTrace
	# set crosshair position to current mouse position
	self.position = get_viewport().get_mouse_position()
	# DEBUG? draw a line between player and crosshair
	# crosshairTrace.points = PoolVector2Array([])
	pass
