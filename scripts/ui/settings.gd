extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	%VolumeSlider.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu.tscn") # Replace with function body.

func _on_volume_slider_value_changed(value: float) -> void:
	%Quack.play()
