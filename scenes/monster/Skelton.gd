extends KinematicBody2D

onready var playerDetection = $PlayerDetection
onready var stats = $Stats
onready var playerbody = load("res://scenes/player/player.tscn")


enum {
	IDLE,
	WANDER,
	CHASE
}
var state = IDLE
var velocity = Vector2.ZERO
var maxSpeed = 50
var acceleration = 100
var friction = 100


func _physics_process(delta):
	
	match state:
		IDLE:
			velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
			seekPlayer()
			
		WANDER:
			pass
			
		CHASE:
			var player = playerDetection.player
			if player != null:
				var dir = (player.get_position() + player.get_parent().position - global_position).normalized()
				velocity = velocity.move_toward(dir * maxSpeed, acceleration * delta)
			else:
				state = IDLE
	velocity = move_and_slide(velocity)

func seekPlayer():
	if playerDetection.playerDetected():
		state = CHASE

#func _on_Hurtbox_area_entered(area):
#	stats.HP -= 1

#func _on_Stats_zeroHealth():
#	queue_free()
