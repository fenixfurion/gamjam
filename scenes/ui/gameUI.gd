extends Control

# game state?
var isPaused = false
signal gamePauseStateChanged

# should this actually be the element that takes all inputs?
func _ready():
	pass

func _input(event):
	 # todo: make events programmatic
	if event.is_action_pressed("ui_pause"):
		pause_game()

func pause_game():
	if !(isPaused):
		# pause game
		print("Paused")
		$playerCamera/pauseScreen.modulate = Color(1,1,1,0.75)
		$playerCamera/pauseScreen.show()
		isPaused = true
		
		get_tree().set_pause(true)
	else: # unpause
		print("Unpaused")
		$playerCamera/pauseScreen.modulate = Color(1,1,1,0.0)
		$playerCamera/pauseScreen.hide()
		isPaused = false
		get_tree().set_pause(false)
	
	emit_signal("gamePauseStateChanged")
