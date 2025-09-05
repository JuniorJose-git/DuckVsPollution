extends CharacterBody2D
var health = 100
@onready var health_bar = %HealthBar
signal boss_died

var current_states
enum boss_states {MOVEUP, MOVEDOWN}
var dir 

func _ready() -> void:
	randow_generation()
	
func _physics_process(delta: float) -> void:
	match current_states:
		boss_states.MOVEUP:
			velocity = Vector2.UP * 10
		boss_states.MOVEDOWN:
			velocity = Vector2.DOWN * 10
	
	move_and_slide()

func randow_generation():
	dir = randi() % 2
	randow_direction()
	
func randow_direction():
	match dir:
		0:
			current_states = boss_states.MOVEDOWN
		1:
			current_states = boss_states.MOVEUP

func _on_bullet_area_area_entered(area: Area2D) -> void:
	area.queue_free()
	health -= 1
	health_bar.value = health
	if health <= 0:
		emit_signal("boss_died")


func _on_timer_timeout() -> void:
	randow_generation()
