extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/VBoxContainer/start.grab_focus()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://levels/intro.tscn")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://ui/settings.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
