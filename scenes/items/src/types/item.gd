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

extends Node  # because it appears that eveything does
class_name Item

var id
var item_name
var item_type
var sprite
var user_sprite

func _init(item_dict):
	self.id = int(item_dict['id'])
	self.item_name = item_dict["name"]
	self.item_type = int(item_dict["type"])
	self.sprite = item_dict["sprite"]
	self.user_sprite = item_dict["user_sprite"]
