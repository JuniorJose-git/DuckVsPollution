extends RigidBody2D
var health = 200
@onready var health_bar = %HealthBar
signal boss_died

func _on_bullet_area_area_entered(area: Area2D) -> void:
	area.queue_free()
	health -= 1
	health_bar.value = health
	if health <= 0:
		emit_signal("boss_died")
