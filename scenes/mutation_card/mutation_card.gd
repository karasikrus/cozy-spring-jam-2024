extends Control
class_name MutationCard
signal pressed(mutation)

@export var mutation_resource : MutationResource

@onready var name_label = %NameLabel
@onready var mutation_texture_rect = %MutationTextureRect
@onready var description_rich_text_label = %DescriptionRichTextLabel
@onready var animation_player = $AnimationPlayer

var is_mouse_hovered = false
# Called when the node enters the scene tree for the first time.
func _ready():
	update_mutaton()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Click") and is_mouse_hovered:
		pressed.emit(mutation_resource)

func update_mutaton() -> void:
	name_label.text = mutation_resource.name
	mutation_texture_rect.texture = mutation_resource.texture
	description_rich_text_label.text = mutation_resource.description


func _on_panel_mouse_entered():
	is_mouse_hovered = true
	animation_player.play("hover")


func _on_panel_mouse_exited():
	is_mouse_hovered = false
	animation_player.play("unhover")
