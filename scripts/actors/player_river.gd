extends RigidBody2D
var speed: float = 5 * 0.4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	if Input.is_action_pressed("ui_up"):
		$".".apply_central_impulse(Vector2(0, -mass * speed))
	
	if Input.is_action_pressed("ui_down"):
		$".".apply_central_impulse(Vector2(0, mass * speed))
