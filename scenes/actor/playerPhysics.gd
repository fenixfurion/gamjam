extends KinematicBody2D

var Velocity = Vector2.ZERO
onready var sprite = get_node("../actorSprite")

func _physics_process(delta):
	move_and_slide(Velocity)
	# move the sprite by integral amounts
	sprite.position = Vector2(floor(position.x), floor(position.y))

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func _input(event):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
