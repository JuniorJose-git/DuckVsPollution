extends CharacterBody2D


const SPEED = 150.0
@onready var animation := $AnimatedSprite2D as AnimatedSprite2D 

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * SPEED
	
	if direction:
		animation.play("run")
		if direction[0]:
			animation.scale.x = round(direction[0])
	else:
		animation.play("idle")

	move_and_slide()
