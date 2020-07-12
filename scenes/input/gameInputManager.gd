extends Node

# gameInputManager
# recalculate keybinds in pickupAction and dropAction?
signal keysUpdated(key_dict)

# using a dict cause fuck life
var keyDict = {
	'move_up': { 
		'key' : [KEY_W],
		'name':['Up']
	},
	'move_left': {
		'key' : [KEY_A],
		'name':['Left']
	},
	'move_down': {
		'key' : [KEY_S],
		'name':['Down']
	},
	'move_right': {
		'key' : [KEY_D],
		'name': ['Right']
	},
	'attack': {
		'key' : [BUTTON_LEFT],
		'name': ['Attack']
	},
	'roll': {
		'key' : [KEY_SPACE],
		'name': ['Roll']
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
		if !key in InputMap.get_actions():
			print("DEBUG: Registering action %s to InputMap" % key)
		InputMap.add_action(key, 0.1)
		print("DEBUG: adding key %s to action %s " % [keyDict[key], key])
		var event = InputEventKey.new()
		event.scancode = keyDict[key]['key'][-1]
		keyDict[key]['key'] = [keyDict[key]['key'][0]]
		InputMap.action_add_event(key, event)
	print("DEBUG: new keys:")
	print_keys()
	emit_signal("keysUpdated", keyDict)

func update_key(action, key):
	keyDict[action]["key"].append(key)
	InputMap.action_add_event(action, key)
	
func remove_key(action):
	keyDict[action]["key"].pop()
	InputMap.action_add_event(action, keyDict[action]["key"][-1])

	
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
