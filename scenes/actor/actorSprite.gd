extends AnimatedSprite

var facing = "D"
var current_anim = "Idle"
var rotateRequest = false
var spriteRotation = 0.00

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(delta)
	var targetAnimation = current_anim + "_" + facing
	if !(targetAnimation in frames.get_animation_names()):
		#print("Warning! targetAnimation %s not found in %s" % [targetAnimation, self.name])
		# if we can't find the animation, fall back to Idle
		current_anim = "Idle"
		targetAnimation = current_anim + "_" + facing
		#print("Falling back to %s" % targetAnimation)
	self.animation = targetAnimation
	if rotateRequest:
		#print(spriteRotation)
		spriteRotation += (delta/0.25)*2*PI
		#print(spriteRotation)
		self.rotation = min(spriteRotation, 2*PI)
		if spriteRotation >= 2*PI:
			rotateRequest = false
			spriteRotation = 0.00
	pass


func _on_player_playerRolled():
	rotateRequest = true
	pass # Replace with function body.
