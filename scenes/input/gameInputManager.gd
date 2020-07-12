extends Node

# gameInputManager
# recalculate keybinds in pickupAction and dropAction?
signal keysUpdated

# using a dict cause fuck life
var keyDict = {
	'w': { 
		'name': "W",
		'key' : KEY_W,
		'actions' : ["move_up"]
	},
	'a': {
		'name': "A",
		'key' : KEY_A,
		'actions' : ["move_left"]
	},
	's': {
		'name': "S",
		'key' : KEY_S,
		'actions' : ["move_down"]
	},
	'd': {
		'name': "D",
		'key' : KEY_D,
		'actions' : ["move_right"]
	},
	'mouse1': {
		'name': "LMB",
		'key' : BUTTON_LEFT,
		'actions' : ["attack"]
	},
	'shift': {
		'name': "Shift",
		'key' : KEY_SHIFT,
		'actions' : ["roll"]
	}
}

func _ready():
	# create the base input events
	reload_keys()
	# reload keys should be called as a callback from pickupAction and dropAction
	pass

func reload_keys():
	print("DEBUG: Reload called; original keys:")
	print_keys()
	clear_keybinds()
	print("DEBUG: registering keys...")
	for key in keyDict:
		for action in keyDict[key]['actions']:
			if !action in InputMap.get_actions():
				print("DEBUG: Registering action %s to InputMap" % action)
				InputMap.add_action(action, 0.1)
			print("DEBUG: adding key %s to action %s " % [keyDict[key]['name'], action])
			var event = InputEventKey.new()
			event.scancode = keyDict[key]['key']
			InputMap.action_add_event(action, event)
	print("DEBUG: new keys:")
	print_keys()
	emit_signal("keysUpdated")
	
func clear_keybinds():
	print("Clearing keybinds")
	# clear all current keybinds
	for action in InputMap.get_actions():
		InputMap.erase_action(action)

func print_keys():
	# debug function to print keys
	print("Printing keys:")
	for action in InputMap.get_actions():
		for event in InputMap.get_action_list(action):
			print("Action: %s | InputEvent: %s" % [action, event])

func _input(event):
	pass
