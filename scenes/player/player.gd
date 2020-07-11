extends "res://scenes/actor/actor.gd"

func _ready():
	# override default sprite with player sprite
	baseSprite = preload("res://assets/actors/human_1.tres")
	physAcceleration = 750
	physMaxSpeed = 150
	physFriction = 750
	# call actor ready to set variables
	._ready()
	pass # Replace with function body.

func processPlayerInput(delta):
	var actorSprite = $actorPhysics/actorSprite
	var actorPhysics = $actorPhysics
	var targetVelocity = Vector2.ZERO
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector = inputVector.normalized()
	if inputVector.length() > 0:
		if abs(inputVector.x) > abs(inputVector.y):
			if inputVector.x > 0:
				actorSprite.facing = "R"
			else:
				actorSprite.facing = "L"
		else:
			if inputVector.y > 0:
				actorSprite.facing = "D"
			else:
				actorSprite.facing = "U"
		actorSprite.current_anim = "Walk"
	else:
		actorSprite.current_anim = "Idle"
		
	if inputVector != Vector2.ZERO:
		targetVelocity = actorPhysics.Velocity.move_toward(inputVector * physMaxSpeed, physAcceleration * delta)
	else:
		targetVelocity = actorPhysics.Velocity.move_toward(Vector2.ZERO, physFriction * delta)
	
	# pass it through to the actorPhysics directly
	actorPhysics.Velocity = targetVelocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# process the player physics
	processPlayerInput(delta)


func _input(event):
	var actorSprite = $actorPhysics/actorSprite
	if event.is_action_pressed("ui_right"):
		actorSprite.facing = "R"
	elif event.is_action_pressed("ui_left"):
		actorSprite.facing = "L"
	elif event.is_action_pressed("ui_down"):
		actorSprite.facing = "D"
	elif event.is_action_pressed("ui_up"):
		actorSprite.facing = "U"
