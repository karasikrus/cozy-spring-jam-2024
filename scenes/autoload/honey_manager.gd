extends Node

var current_honey : float = 0.0
var passive_income : float = 1.0
var click_base_modifier : float = 1.5
var click_base_value : float = 1.0

#var delta_cumsum = 0.0
#var period_sec = 0.2

# worker number on tick
# price and income 
# price: base * size_modifier 

func click():
	current_honey += click_base_value * click_base_modifier

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_honey += passive_income * delta
	#delta_cumsum += delta;
## NOTE(akumanory): Add passive income once in period
	#if delta_cumsum >= period_sec:
		#current_honey += passive_income;
		#print("delta_cumsum: " + str(delta_cumsum))
		#delta_cumsum -= period_sec
