# item base class
# 
# virtualization isn't even real but what the fuck do i care
#
# "init" args lmao init is barely even real:
#    name: (string) to set the name of an object
#    type: (enum) to set the type of object i guess
#    action_proc: (func) to replace the shit in InputMap etc
#    ui_sprite: (path) in a sane engine this would probably be inherited
#    character_sprite: (path) see above
#
# there's no multi line comments in this lol

extends Resource  # because it appears that eveything does
class_name Item

func _init(item_dict):
	self.id = item_dict['id']
	self.name = item_dict["name"]
	self.item_type = item_dict["type"]
	self.sprite = item_dict["sprite"]
	self.user_sprite = item_dict["user_sprite"]
