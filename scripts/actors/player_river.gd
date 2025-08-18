extends RigidBody2D
var speed: float = 5 * 0.4
var coins = 0
@onready var label = $Stats/Control/MarginContainer/HBoxContainer/Label
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	label.text = str(coins)
	
	if (coins >= 15):
		LevelCore.river.level_1_completed = true
		get_tree().change_scene_to_file("res://main/game.tscn")
	
	if Input.is_action_pressed("ui_up"):
		$".".apply_central_impulse(Vector2(0, -mass * speed))
	
	if Input.is_action_pressed("ui_down"):
		$".".apply_central_impulse(Vector2(0, mass * speed))
