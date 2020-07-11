extends AnimatedSprite

var facing = "D"
var current_anim = "Idle"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var targetAnimation = current_anim + "_" + facing
	if !(targetAnimation in frames.get_animation_names()):
		#print("Warning! targetAnimation %s not found in %s" % [targetAnimation, self.name])
		# if we can't find the animation, fall back to Idle
		current_anim = "Idle"
		targetAnimation = current_anim + "_" + facing
		#print("Falling back to %s" % targetAnimation)
	self.animation = targetAnimation
	pass
