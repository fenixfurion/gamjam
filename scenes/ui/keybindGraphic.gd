extends ReferenceRect

var keyInfo = {}

# maybe make this global?
var actionGraphicMap = {
	#"move_up": "bleg",
	#"move_left": "blog",
	#"move_right": "blug",
	#"move_down": "blorg"
}

var lmao ={ 
	KEY_0:"0",KEY_1:"1",KEY_2:"2",KEY_3:"3",KEY_4:"4",KEY_5:"5",KEY_6:"6",
	KEY_7:"7",KEY_8:"8",KEY_9:"9",KEY_A:"A",KEY_B:"B",KEY_C:"C",KEY_D:"D",
	KEY_E:"E",KEY_F:"F",KEY_G:"G",KEY_H:"H",KEY_I:"I",KEY_J:"J",KEY_K:"K",
	KEY_L:"L",KEY_M:"M",KEY_N:"N",KEY_O:"O",KEY_P:"P",KEY_Q:"Q",KEY_R:"R",
	KEY_S:"S",KEY_T:"T",KEY_U:"U",KEY_V:"V",KEY_W:"W",KEY_X:"X",KEY_Y:"Y",
	KEY_Z:"Z",KEY_SPACE:"Space", BUTTON_LEFT:"LMB", BUTTON_RIGHT:"RMB",
	BUTTON_MIDDLE:"MMB"
}

func _ready():
	var actionGraphic
	print("Drawing keybindGraphic %s" % self.name)
	if keyInfo == {}:
		$keyName.text = "???"
	else:
		$keyName.text = lmao[keyInfo['key'][-1]]
	var i = 0
	for action in keyInfo["name"]:
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
