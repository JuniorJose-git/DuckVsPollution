extends Node2D
@export var coin_scene: PackedScene
@export var can_scene: PackedScene
@export var waterbottle_scene: PackedScene
@export var enemy_scene: PackedScene

@onready var game_completed = $GameCompleted
@onready var player = %PlayerRiver
@onready var game_over := $GameOver
@onready var tree := get_tree()
@onready var start_count_label = $StartCount/Label
@onready var start_timer = %StartTimer
@onready var start_timer_label = $StartCount/Control/Label
@onready var start_count = %StartCount
@onready var first_play_help_text = %FirstPlayHelpText
@onready var progress_bar = %ProgressBar
@onready var timer = $Timer

var progress = 0;
var speed = 1;
var count = 3;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelCore.levels_pause_avaliable = false
	tree.paused = true
	if LevelCore.river.level_1_first_play:
		LevelCore.river.level_1_first_play = false
		first_play_help_text.show()
		first_play_help_text.start()
	else:
		start_timer_label.text = str(count)
		start_count.show()
		start_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset = Vector2(0, 0)
	$ParallaxBackground/ParallaxLayer.motion_offset += Vector2(-0.475 * speed, 0)
	
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

func _on_game_completed_continue_pressed() -> void:
	tree.change_scene_to_file("res://main/game.tscn")
	LevelCore.river.level_2_completed = true
	tree.paused = false

func _on_coins_timer_timeout() -> void:
	var coin = coin_scene.instantiate()
	coin.set_speed(speed)
	add_child(coin)
	coin.position = Vector2(640 + 32, randf_range(60, 320 - 50))

func _on_speed_timer_timeout() -> void:
	if speed <= 2: speed += 0.1
	
func _on_can_timer_timeout() -> void:
	var can = can_scene.instantiate()
	can.set_speed(speed)
	add_child(can)
	can.position = Vector2(640 + 32, randf_range(60, 320 - 50))

func _on_water_timer_timeout() -> void:
	var waterbottle = waterbottle_scene.instantiate()
	waterbottle.set_speed(speed)
	add_child(waterbottle)
	waterbottle.position = Vector2(640 + 32, randf_range(60, 320 - 50))

func _on_levels_pause_menu_reload_pressed() -> void:
	tree.change_scene_to_file("res://levels/river/river_level_2.tscn")

func _on_start_timer_timeout() -> void:
	start_timer_label.text = str(count)
	if count <= 0:
		LevelCore.levels_pause_avaliable = true
		start_timer.stop()
		tree.paused = false
		start_count.hide()
		timer.start()
		return
	count -= 1
	
func _on_enemy_spawn_timer_timeout():
	var enemy = enemy_scene.instantiate()
	add_child(enemy)
	enemy.position = Vector2(640 + 32, randf_range(60, 320 - 50))


func _on_first_play_help_text_close_help_text() -> void:
	start_timer_label.text = str(count)
	start_count.show()
	start_timer.start()


func _on_timer_timeout() -> void:
	progress+= 1
	progress_bar.value = progress
	if progress >= 120:
		game_completed.show()
		%GameCompletedContinue.grab_focus()
		LevelCore.levels_pause_avaliable = false
		tree.paused = true
	
