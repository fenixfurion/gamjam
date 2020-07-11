extends Node

const Acceleration = 1500
const MaxSpeed = 300
const Friction = 1500

var Velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func processPlayerPhysics(delta):	
	var InputVector = Vector2.ZERO
	InputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	InputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	InputVector = InputVector.normalized()
	if InputVector.length() > 0:
		get_node("actorPhysics/actorSprite").current_anim = "Walk"
	else:
		get_node("actorPhysics/actorSprite").current_anim = "Idle"
		
	if InputVector != Vector2.ZERO:
		Velocity = Velocity.move_toward(InputVector * MaxSpeed, Acceleration * delta)
	else:
		Velocity = Velocity.move_toward(Vector2.ZERO, Friction * delta)
	
	# pass it through to the actorPhysics directly
	get_node("actorPhysics").Velocity = Velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# process the player physics
	processPlayerPhysics(delta)


func _input(event):
	var actorSprite = get_node("actorPhysics/actorSprite")
	if event.is_action_pressed("ui_right"):
		actorSprite.facing = "R"
	elif event.is_action_pressed("ui_left"):
		actorSprite.facing = "L"
	elif event.is_action_pressed("ui_down"):
		actorSprite.facing = "D"
	elif event.is_action_pressed("ui_up"):
		actorSprite.facing = "U"
