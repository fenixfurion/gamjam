extends Node
class_name ItemManager

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

var items = []

func register_items_from_json():
	var file = File.new()
	var a = file.open("res://scenes/items/src/types/items.json", File.READ)
	var text = file.get_as_text()
	var dict = {}
	dict = parse_json(text)
	file.close()
	for i in dict["items"]:
		var it = register_item(i)
		items.append(it)

	
func register_item(item_dict):
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


# Called when the node enters the scene tree for the first time.
func _ready():
	register_items_from_json()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
