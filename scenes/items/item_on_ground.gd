extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var item = ItemManager.get_item_from_list()
	$sprite.texture = load("res://art/8BIT CanariPack TopDown/SPRITES/ITEMS/item8BIT_boots.png")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
