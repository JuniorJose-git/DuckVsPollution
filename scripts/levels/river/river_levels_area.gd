extends Area2D
@onready var level_select_menu := $LevelSelectMenu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if len(get_overlapping_bodies()) > 0:
		level_select_menu.show()
	else:
		level_select_menu.hide()
