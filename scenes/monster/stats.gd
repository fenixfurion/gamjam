extends Node


export var maxHP = 1
var HP = maxHP setget setHealth

signal zeroHealth

func setHealth(HP):
	if HP <= 0:
		emit_signal("zeroHealth")
