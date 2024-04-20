extends Node2D
class_name Bee

var is_mouse_inside : bool = false 
@onready var area_2d : Area2D = $Sprite2D/Area2D as Area2D
@onready var audio_stream_player : AudioStreamPlayer = $AudioStreamPlayer as AudioStreamPlayer
#@export var test : Array[AudioStream]

# Called when the node enters the scene tree for the first time.
func _ready():
	area_2d.mouse_entered.connect(on_mouse_entered)
	area_2d.mouse_exited.connect(on_mouse_exited)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Click") and is_mouse_inside: 
		HoneyManager.click()
		audio_stream_player.play()
		print("Click")
	
func on_mouse_entered() -> void :
	is_mouse_inside = true
	$Sprite2D.scale = Vector2(1.5, 1.5)
	
func on_mouse_exited() -> void :
	is_mouse_inside = false
	$Sprite2D.scale = Vector2(1.0, 1.0)
