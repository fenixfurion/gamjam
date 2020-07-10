extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_valid_key = KEY_A
var timer
var rng

func update_random_key():
	rng.randomize()
	current_valid_key = KEY_A + (rng.randi() % (KEY_Z-KEY_A))
	print("timer fired - changing key to %s!" % OS.get_scancode_string(current_valid_key))
	var buttonHintText = get_node("startScreen/startBackground/startPressPlay")
	buttonHintText.text = 'Press "%s" to start' % OS.get_scancode_string(current_valid_key)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	# init rng
	rng = RandomNumberGenerator.new()
	update_random_key()
	# initialize main menu timer?
	timer = get_node("startScreen/keytimer")
	timer.connect("timeout",self,"_on_start_timer_event")
	# every time the timer fires, randomize the key needed to start
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_timer_event():
	var keyIndex;
	rng.randomize()
	current_valid_key = KEY_A + (rng.randi() % (KEY_Z-KEY_A))
	update_random_key()
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			print("Got keypress %s" % OS.get_scancode_string(event.scancode))
			if event.scancode == current_valid_key:
				print("Matching key - hiding start screen")
				get_node("startScreen").hide()
			else:
				print("wrong key")
	pass
