extends Node2D

# Actor class: should contain all of the required internal variables and 
# state needed, the parent node will interface with this one?
var physAcceleration = 1500
var physMaxSpeed = 300
var physFriction = 1500
var baseSprite = preload("res://assets/actors/skeleton.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	initActor()
	pass # Replace with function body.

func initActor():
	var actorSprite = $actorSprite
	actorSprite.frames = baseSprite
