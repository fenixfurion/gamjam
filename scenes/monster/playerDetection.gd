extends Area2D


onready var player = null

func playerDetected():
	return  player != null
	
func _on_PlayerDetection_body_entered(body):
	player = body

func _on_PlayerDetection_body_exited(body):
	player = null
