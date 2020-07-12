extends Item

var damage
var rang

func _init(item_dict).(item_dict):
	self.damage = item_dict["damage"]
	self.rang = item_dict["range"]
