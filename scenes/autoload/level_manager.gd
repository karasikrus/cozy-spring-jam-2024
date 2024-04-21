extends Node

var lvlsHoneyLimits = [100, 1000, 5000, 10000, 20000, 30000, 40000]
var lvlsTimeLimits =  [ 10,   20,   30,    40,    50,    60,    70]
var currentLevel: int = 0
var levelTimer: Timer = null


signal start_next_level_signal
signal game_over
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func start_first_level():
	levelTimer = Timer.new()
	levelTimer.connect("timeout", finalize_current_level)
	levelTimer.autostart = true
	add_child(levelTimer)
	levelTimer.start(lvlsTimeLimits[currentLevel])
	

func finalize_current_level():
	if(is_passed_level_limits()):
		start_next_level()
	else:
		game_over.emit()
	pass
	
func start_next_level():
	HoneyManager.total_honey_on_current_level -= lvlsHoneyLimits[currentLevel]
	currentLevel += 1
	levelTimer.start(lvlsTimeLimits[currentLevel])
	start_next_level_signal.emit()
	
func current_level_progress()->float:
	var levelProgress = clamp(HoneyManager.total_honey_on_current_level / lvlsHoneyLimits[currentLevel], 0.0, 1.0)
	return levelProgress
	
func is_passed_level_limits()->bool:
	return HoneyManager.total_honey_on_current_level > lvlsHoneyLimits[currentLevel] 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
