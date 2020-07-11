# item base class
# 
# virtualization isn't even real but what the fuck do i care
#
# "init" args lmao init is barely even real:
#    name: (string) to set the name of an object
#    desc: (string) to set """LORE""" of object
#    type: (enum) to set the type of object i guess
#    action: (string) description of action
#    action_proc: (func) to replace the shit in InputMap etc
#    ui_sprite: (path) in a sane engine this would probably be inherited
#    character_sprite: (path) see above
#
# there's no multi line comments in this lol

extends Node  # because it appears that eveything does

ITEM_TYPE = {MELEE, GUN, ABILITY1, ABILITY2, ABILITY3, ABILITY4, BOOTS, PANTS,
             CHEST, HELMET, CONSUMABLE}

signal register_action
signal remove_action

class Item:
    var name
    var desc
    var type

    func _init(name, desc, type):
        name = name
        desc = desc
        type = type

    def pickup():
        pass
        #virtual functions don't actually do anything lmao
    
    def drop():
        pass

