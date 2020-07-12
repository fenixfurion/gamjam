extends "res://scenes/actor/actor.gd"

signal playerRolled

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
	var actorSprite = $actorSprite
	var actorPhysics = $actorPhysics
	var targetVelocity = Vector2.ZERO
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	inputVector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
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

func applyPlayerRoll():
	var physRollSpeed = 400
	var actorSprite = $actorSprite
	var actorPhysics = $actorPhysics
	var targetVelocity = Vector2(0,0)
	# add player roll to velocity
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	inputVector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	if Vector2(inputVector.x, inputVector.y) == Vector2.ZERO:
		match actorSprite.facing:
			"R":
				targetVelocity = Vector2(physRollSpeed,0)
				pass
			"L":
				targetVelocity = Vector2(-physRollSpeed,0)
				pass
			"U":
				targetVelocity = Vector2(0,-physRollSpeed)
				pass
			"D":
				targetVelocity = Vector2(0,physRollSpeed)
				pass
			_:
				return
	else:
		targetVelocity = Vector2(inputVector.x, inputVector.y).normalized()*physRollSpeed
	actorPhysics.Velocity = actorPhysics.Velocity + targetVelocity
	emit_signal("playerRolled")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# process the player physics
	processPlayerInput(delta)


func _input(event):
	var actorSprite = $actorSprite
	if event.is_action_pressed("move_right"):
		actorSprite.facing = "R"
	elif event.is_action_pressed("move_left"):
		actorSprite.facing = "L"
	elif event.is_action_pressed("move_down"):
		actorSprite.facing = "D"
	elif event.is_action_pressed("move_up"):
		actorSprite.facing = "U"
	if event.is_action_pressed("roll"):
		applyPlayerRoll()

