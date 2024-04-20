extends Node

var current_honey : float = 0.0
var passive_income : float = 1.0
var click_base_modifier : float = 1.5
var click_base_value : float = 1.0
var total_honey_on_current_level : float = 0.0 #(dsmoliakov): being also updated from level manager
#var delta_cumsum = 0.0
#var period_sec = 0.2

# worker number on tick
# price and income 
# price: base * size_modifier 

func click():
	var honey_to_add_on_click = click_base_value * click_base_modifier
	current_honey += honey_to_add_on_click
	total_honey_on_current_level += honey_to_add_on_click

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var honey_to_add : float = 0.0
	honey_to_add += passive_income * delta
	#(dsmoliakov): splitting current_honey and total honey to keep track of level progression
	current_honey += honey_to_add
	total_honey_on_current_level += honey_to_add
	#current_honey += passive_income * delta
	#delta_cumsum += delta;
## NOTE(akumanory): Add passive income once in period
	#if delta_cumsum >= period_sec:
		#current_honey += passive_income;
		#print("delta_cumsum: " + str(delta_cumsum))
		#delta_cumsum -= period_sec
