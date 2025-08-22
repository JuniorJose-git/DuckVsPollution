extends RigidBody2D

@onready var castanha := $"."

var speed: int = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#castanha.apply_force(Vector2(-35,0))
	castanha.position.x -= 1 * speed
	
	if position.x < -32:
		queue_free()

func _on_player_area_body_entered(body: Node2D) -> void:
	body.coins += 1
	print(body.coins)
	queue_free()

func _on_body_entered(body: Node) -> void:
	queue_free()

func set_speed(value: int):
	speed = value
	

func _on_timer_timeout() -> void:
	if speed <= 4: speed += 0.3
