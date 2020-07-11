extends Camera2D

func _ready():
	pass

func _process(delta):
	var playerPosition = get_player_node().get_transform().origin + get_player_node().get_node("actorPhysics").position
	self.position = playerPosition.round()
	# push the camera a little bit based on mouse location
	self.position = self.position + ((get_viewport().get_mouse_position() - get_viewport_rect().size/2)*0.25)
	force_update_scroll()
	#self.position = playerPosition

func get_player_node():
	# TODO: make this not static (recurse and find player node? sounds painful)
	var playerNode = null
	if get_parent().get_parent().has_node("player"):
		playerNode = get_parent().get_parent().get_node("player")
	else:
		return null

	return playerNode
