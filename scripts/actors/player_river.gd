extends CharacterBody2D
@onready var label = %coins
@onready var healthBar = %HealthBar
var speed := 75
var coins := 0
var health := 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	label.text = str(coins)
	
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	
	if Input.is_action_pressed("ui_left"):
		velocity = direction * speed * 2 
	else:
		velocity = direction * speed
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if health > 0:
		health -= 1
	healthBar.value = health
	
