extends Node2D
@export var coin_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ParallaxBackground.scroll_offset = Vector2(0, 0)
	$ParallaxBackground/ParallaxLayer.motion_offset += Vector2(-1, 0)

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
		add_child(coin)
		var position = Vector2(640 + 32, randf_range(60, 320 - 50))
		coin.position = position


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body)
