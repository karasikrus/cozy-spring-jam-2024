extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	%Score.text = "Score: " + str(HoneyManager.current_honey)
	%PassiveIncome.text = "Passive income: " + str(HoneyManager.passive_income)
