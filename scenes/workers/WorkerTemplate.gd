extends Node2D

var target_point: Node2D
var spawn_point: Node2D
var moving_to_target: bool = true
var velocity: float = 1.0
var progression: float = 0.0
@onready var animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready():
	var parent = (get_parent() as Node2D).get_parent()
	spawn_point = parent.get_child(1)
	select_random_point()
	velocity = (velocity + (randf() - 0.5) * 2)
	animated_sprite.play("default")
	pass # Replace with function body.

func select_random_point():
	var parent = (get_parent() as Node2D)
	var points = parent.get_child(0).get_children()
	target_point = points[randi_range(0, points.size() - 1)]
	position = spawn_point.position
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_end_point = target_point if moving_to_target else spawn_point
	var current_start_point = spawn_point if moving_to_target else target_point
	progression = clamp(progression + delta * velocity, 0, 1)
	position = current_start_point.position.lerp(current_end_point.position, progression)
	if (current_end_point.position - current_start_point.position).x > 0:
		animated_sprite.flip_h = true
	else:
		animated_sprite.flip_h = false
	if progression < 1.0:
		return
		
	if not moving_to_target:
		select_random_point()
		
	progression = 0.0
	moving_to_target = not moving_to_target
		
	pass
