extends Container

var inputManager
var keybindGraphicList = []
var kgScene = preload("res://scenes/ui/keybindGraphic.tscn")

func _ready():
	inputManager = get_node("/root/PlayerInputManager")
	updateBindings()
	# this will eventually register a signal to update whenever we pick something up
	pass

# update bindings whenever we pick up or drop an item?
func updateBindings():
	for node in keybindGraphicList:
		node.queue_free()
	var i = 0;
	for key in inputManager.keyDict.keys():
		print("Passing key info to new keybindGraphic for %s" % str(inputManager.keyDict[key]))
		# generate the UI here
		var kg = kgScene.instance()
		# pass key info to the keybindGraphic, it will take care of the drawing
		kg.keyInfo = inputManager.keyDict[key]
		# TODO: don't hardcode this shit
		kg.set_position(Vector2(10+(i*50),270))
		# this instances the child, it should do its own thing
		self.add_child(kg)
		keybindGraphicList.append(kg)
		i += 1;
	pass
