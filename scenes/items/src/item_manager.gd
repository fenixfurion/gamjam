# Class to read and store global """database""" of items
# 
# Reads a JSON file to register
# no idea how to make this like global

extends Node
# class_name ItemManager

# Load specific item resources
const Helm = preload("types/helm.gd")
const Chest = preload("types/chest.gd")
const Pants = preload("types/pants.gd")
const Boots = preload("types/boots.gd")
const Melee = preload("types/melee.gd")
const Ranged = preload("types/ranged.gd")
const Cons = preload("types/consumable.gd")
enum ITEM_BY_TYPE {HELM, CHEST, PANTS, BOOTS, 
				   MELEE, RANGED, CONS}

# ItemManager.items will hold them all
var items = []

func register_items_from_json():
	# Register items from json function
	# Expects items to be registered in items.json in this directory
	var file = File.new()
	file.open("res://scenes/items/src/types/items.json", File.READ)
	var text = file.get_as_text()
	var dict = {}
	dict = parse_json(text)
	file.close()
	for i in dict["items"]:
		var it = register_item(i)
		items.append(it)

	
func register_item(item_dict):
	# Case matchs to generate an item at a time
	# 
	# Args:
	#	item_dict: what should the json for an item
	match int(item_dict['type']):
		ITEM_BY_TYPE.HELM:
			return Helm.new(item_dict)
		ITEM_BY_TYPE.CHEST:
			return Chest.new(item_dict)
		ITEM_BY_TYPE.PANTS:
			return Pants.new(item_dict)
		ITEM_BY_TYPE.BOOTS:
			return Boots.new(item_dict)
		ITEM_BY_TYPE.MELEE:
			return Melee.new(item_dict)
		ITEM_BY_TYPE.RANGED:
			return Ranged.new(item_dict)
		ITEM_BY_TYPE.CONS:
			return Cons.new(item_dict)


func get_item_from_list():
	# Gets a random item for a list
	return self.items[randi() % self.items.size()]


# Called when the node enters the scene tree for the first time.
func _ready():
	register_items_from_json()
	pass # Replace with function body.
