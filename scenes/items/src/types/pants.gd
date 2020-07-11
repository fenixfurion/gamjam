extends Item

func _init(item_dict).(item_dict):
	self.hp_change = item_dict["hp"]
	self.sp_change = item_dict["sp"]
