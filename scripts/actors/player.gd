extends CharacterBody2D


const SPEED = 75
@onready var animation := $AnimationPlayer 
var lastDirection = 'left'

func _ready() -> void:
	LevelCore.river.level_1_first_play = true

func updateAnimation(): 
	var direction
	
	match lastDirection:
		'left':
			direction = "idleLeft"
		'right':
			direction = "idleRight"
		'up':
			direction = "idleUp"
		'down':
			direction = "idleDown"
		
	if velocity.x < 0: 
		direction = "left"
		lastDirection = direction
	elif velocity.x > 0: 
		direction = "right"
		lastDirection = direction
	elif velocity.y < 0: 
		direction = "up"
		lastDirection = direction
	elif velocity.y > 0: 
		direction = "down"
		lastDirection = direction
	
	animation.play(direction)
	
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED

	updateAnimation()
	move_and_slide()
