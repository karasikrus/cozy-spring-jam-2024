extends Control

var lifeTime: float = 1.0
var velocity: float = 4
@onready var text = $RichTextLabel
var dublicate = false
var text_on_click = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	text.text = text_on_click
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	global_position += Vector2(0, -1) * velocity * delta
	lifeTime -= delta
	text.modulate.a = lifeTime
	if lifeTime <= 0 and dublicate:
		queue_free()
	pass
