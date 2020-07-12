extends Node2D
var positionupdate = 1.0
var rng = RandomNumberGenerator.new()
export var spawnRate = 60
export var startCount = 0
onready var spawnFrameCount = spawnRate * 60
onready var framecount = startCount * 60
var Skelton = load("res://scenes/monster/Skelton.tscn")

func _ready():
	rng.randomize()
	positionupdate = rng.randf_range(0.95, 1.05)

func _physics_process(delta):

	if framecount == spawnFrameCount:
		var Skelton = load("res://scenes/monster/Skelton.tscn")
		var skelton = Skelton.instance()
		var main = get_tree().current_scene
		main.add_child(skelton)
		skelton.set_position(global_position * positionupdate)
		rng.randomize()
		positionupdate = rng.randf_range(0.95, 1.05)
		framecount = 0
	framecount += 1
