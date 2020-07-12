extends Node2D


var playerPosition = Vector2(0.0, 0.0)

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	# connect a signal to callback whenever the game pauses
	# only if we have a parent node (i.e.: the UI node)
	var parentNode = get_parent()
	if parentNode:
		parentNode.connect("gamePauseStateChanged", self, "handlePauseStateChange")
	
	pass # Replace with function body.

func handlePauseStateChange():
	var parentNode = get_parent()
	if parentNode.isPaused:
		$crosshairTrace.hide()
	else:
		$crosshairTrace.show()

func _process(delta):
	if get_player_node() != null:
		playerPosition = get_player_node().get_transform().origin + get_player_node().get_node("actorPhysics").position
		var playerCamera = get_parent().get_node("playerCamera")
		var crosshairTrace = $crosshairTrace
		# set crosshair position to current mouse position + camera offset
		#print(playerCamera.position)
		self.position = playerCamera.position + (get_viewport().get_mouse_position() - get_viewport_rect().size/2)
		#print(self.position)
		#  print("[%s, %s]" %[playerPosition, self.position])
		# DEBUG? draw a line between player and crosshair
		crosshairTrace.points = PoolVector2Array([to_local(playerPosition), to_local(self.position)])
	pass

func get_player_node():
	# TODO: make this not static (recurse and find player node? sounds painful)
	var playerNode = null
	if get_parent().get_parent().has_node("player"):
		playerNode = get_parent().get_parent().get_node("player")
	else:
		return null

	return playerNode
