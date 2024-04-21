extends Node

var lvlsHoneyLimits = [ 10, 1000, 5000, 10000, 20000, 30000, 40000]
var lvlsTimeLimits =  [ 5,   20,   30,    40,    50,    60,    70]
var currentLevel: int = 0
var levelTimer: Timer = null

@onready var mutationScene = preload("res://scenes/mutation_screen/mutation_screen.tscn")

signal start_next_level_signal
signal game_over
# Called when the node enters the scene tree for the first time.
func _ready():
	MutationsManager.new_mutation.connect(reset_timer_on_mutation_select)
	pass # Replace with function body.

func start_first_level():
	levelTimer = Timer.new()
	levelTimer.connect("timeout", finalize_current_level)
	#levelTimer.autostart = true
	add_child(levelTimer)
	levelTimer.start(lvlsTimeLimits[currentLevel])
	

func finalize_current_level():
	if(is_passed_level_limits()):
		start_next_level()
	else:
		game_over.emit()
	pass
	
func start_next_level():
	HoneyManager.freeze = true
	HoneyManager.total_honey_on_current_level -= lvlsHoneyLimits[currentLevel]
	currentLevel += 1
	levelTimer.stop()
	var scene_instance = mutationScene.instantiate()
	get_tree().root.add_child(scene_instance)
	
func reset_timer_on_mutation_select(a):
	levelTimer.start(lvlsTimeLimits[currentLevel])
	HoneyManager.freeze = false
	start_next_level_signal.emit()
	
func current_level_progress()->float:
	var levelProgress = clamp(HoneyManager.total_honey_on_current_level / lvlsHoneyLimits[currentLevel], 0.0, 1.0)
	return levelProgress
	
func is_passed_level_limits()->bool:
	return HoneyManager.total_honey_on_current_level > lvlsHoneyLimits[currentLevel] 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
