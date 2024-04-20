extends Node

var current_honey : float = 0.0
var passive_income : float = 0.0
var click_base_modifier : float = 1.5

# worker number on tick
# price and income 
# price: base * size_modifier 

func click():
	current_honey += 1.0 * click_base_modifier

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
