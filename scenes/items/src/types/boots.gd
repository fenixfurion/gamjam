extends Item

func _init(item_dict):
	._init(item_dict)
	self.hp_change = self.item_dict["hp"]
	self.sp_change = self.item_dict["sp"]
