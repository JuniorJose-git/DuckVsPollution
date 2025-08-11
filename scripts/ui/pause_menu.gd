extends CanvasLayer
@onready var pauseMenu: Control = $"Control"
@onready var tree: SceneTree = get_tree()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testEsc()

func pause():
	pauseMenu.show()
	tree.paused = true

func resume():
	pauseMenu.hide()
	tree.paused = false
	
func testEsc():
	if Input.is_action_just_pressed("escape") and tree.paused == false:
		pause()
	elif Input.is_action_just_pressed("escape") and tree.paused == true:
		resume()

func _on_exit_pressed() -> void:
	tree.quit()

func _on_resume_pressed() -> void:
	resume()
