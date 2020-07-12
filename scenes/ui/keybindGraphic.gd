extends ReferenceRect

var keyInfo = {}

# maybe make this global?
var actionGraphicMap = {
	#"move_up": "bleg",
	#"move_left": "blog",
	#"move_right": "blug",
	#"move_down": "blorg"
}

func _ready():
	var actionGraphic
	print("Drawing keybindGraphic %s" % self.name)
	if keyInfo == {}:
		$keyName.text = "???"
	else:
		$keyName.text = keyInfo['name']
	var i = 0
	for action in keyInfo['actions']:
		print("Generating graphic for action %d: %s" % [i, action])
		if !(action in actionGraphicMap.keys()):
			actionGraphic = createActionLabel(action)
		else:
			actionGraphic = createActionGraphic(action)
		# instantiate it here
		actionGraphic.set_position(Vector2(0, -15*i-15))
		add_child(actionGraphic)
		i+=1
	pass

func createActionGraphic(action):
	var node
	
	return node
	pass

func createActionLabel(action):
	# fallback to create a text label for ungraphic'd actions
	var node
	if 'move_' in action:
		action = action.split('_')[1]
	node = Label.new()
	node.text = action
	node.align = Label.ALIGN_CENTER
	node.valign = Label.VALIGN_CENTER
	return node
