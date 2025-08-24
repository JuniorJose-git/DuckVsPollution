extends Node2D
@export var coin_scene: PackedScene
@onready var game_over := $GameOver
@onready var tree := get_tree()
@onready var parallax_background = $ParallaxBackground
@onready var parallax_layer = $ParallaxBackground/ParallaxLayer
@onready var player = %PlayerRiver
# Called when the node enters the scene tree for the first time.

var speed = 1;

func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset = Vector2(0, 0)
	$ParallaxBackground/ParallaxLayer.motion_offset += Vector2(-0.425 * speed, 0)
	
	if player.health <= 0:
		game_over.show()
		tree.paused = true

func check_for_body_at_point_2d(point: Vector2) -> Array:
	var space_state = get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = point
	query.collide_with_areas = true # Set to true if you also want to detect Area2D nodes
	query.collide_with_bodies = true # Set to true if you want to detect physics bodies (RigidBody2D, KinematicBody2D, StaticBody2D)
	return space_state.intersect_point(query) # Returns true if any object is found at the point

func _on_timer_timeout() -> void:
	if check_for_body_at_point_2d(position).size() > 0:
		var coin = coin_scene.instantiate()
		coin.set_speed(speed)
		add_child(coin)
		coin.position = Vector2(640 + 32, randf_range(60, 320 - 50))

func _on_area_2d_body_entered(body: Node2D) -> void:
	game_over.show()
	tree.paused = true

func _on_game_over_play_again_pressed() -> void:
	tree.change_scene_to_file("res://levels/river/river_level_1.tscn")
	tree.paused = false

func _on_game_over_exit_pressed() -> void:
	tree.change_scene_to_file("res://main/game.tscn")
	tree.paused = false

func _on_speed_timer_timeout() -> void:
	if speed <= 4: speed += 0.1
