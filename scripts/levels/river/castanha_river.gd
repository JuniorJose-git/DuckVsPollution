extends RigidBody2D

var speed = 160
@onready var castanha := $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	#castanha.apply_force(Vector2(-35,0))
	castanha.position.x -= 1
	
	if position.x < -32:
		queue_free()

func _on_player_area_body_entered(body: Node2D) -> void:
	body.coins += 1
	print(body.coins)
	queue_free()

func _on_body_entered(body: Node) -> void:
	queue_free()
