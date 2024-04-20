extends Node2D

@onready var bee = $Bee

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var delta_cumsum = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	delta_cumsum += delta
	var tmp_pos = bee.global_position;
	bee.global_position = Vector2(
		sin(delta_cumsum), 
		cos(delta_cumsum))
	bee.global_position += tmp_pos 
