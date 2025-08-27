extends Node2D
@export var coin_scene: PackedScene
@export var can_scene: PackedScene
@export var waterbottle_scene: PackedScene
@onready var player = %PlayerRiver
@onready var game_over := $GameOver
@onready var tree := get_tree()
@onready var start_count_label = $StartCount/Label
@onready var start_timer = %StartTimer
@onready var start_timer_label = $StartCount/Control/Label
@onready var start_count = %StartCount

var speed = 1;
var count = 3;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_timer_label.text = str(count)
	start_count.show()
	start_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset = Vector2(0, 0)
	$ParallaxBackground/ParallaxLayer.motion_offset += Vector2(-1 * speed, 0)
	
	if player.health <= 0:
		game_over.show()
		%GameOverPlayAgain.grab_focus()
		LevelCore.levels_pause_avaliable = false
		tree.paused = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	game_over.show()
	%GameOverPlayAgain.grab_focus()
	LevelCore.levels_pause_avaliable = false
	tree.paused = true

func _on_game_over_play_again_pressed() -> void:
	tree.change_scene_to_file("res://levels/river/river_level_2.tscn")
	tree.paused = false

func _on_game_over_exit_pressed() -> void:
	tree.change_scene_to_file("res://main/game.tscn")
	tree.paused = false


func _on_start_timer_timeout() -> void:
	pass # Replace with function body.
