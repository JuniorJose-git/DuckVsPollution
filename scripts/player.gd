extends CharacterBody2D


const SPEED = 100.0
@onready var animation := $AnimationPlayer 

var lastDirection = 'left'

func updateAnimation(): 
	var direction
	
	if lastDirection == 'left':
		direction = "idleLeft"
	else:
		direction = "idleRight"
		
	if velocity.x < 0: 
		direction = "left"
		lastDirection = direction
	elif velocity.x > 0: 
		direction = "right"
		lastDirection = direction
	elif velocity.y < 0: 
		direction = "up"
	elif velocity.y > 0: 
		direction = "down"
	
	animation.play(direction)
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	
	updateAnimation()
	move_and_slide()
