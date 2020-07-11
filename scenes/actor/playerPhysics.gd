extends KinematicBody2D

var Velocity = Vector2.ZERO

func _physics_process(delta):
	move_and_slide(Velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
