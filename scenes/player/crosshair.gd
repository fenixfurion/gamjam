extends Node2D


var playerPosition = Vector2(0.0, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass # Replace with function body.


func _process(delta):
	var crosshairTrace = $crosshairTrace
	# set crosshair position to current mouse position
	self.position = get_viewport().get_mouse_position()
	# print("[%s, %s]" %[playerPosition, self.position])
	# DEBUG? draw a line between player and crosshair
	crosshairTrace.points = PoolVector2Array([to_local(playerPosition), to_local(self.position)])
	pass
