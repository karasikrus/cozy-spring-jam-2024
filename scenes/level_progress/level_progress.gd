extends Control

var progressBar: ProgressBar = null
var timerLabel: RichTextLabel = null
# Called when the node enters the scene tree for the first time.
func _ready():
	progressBar = ($ProgressBar as ProgressBar)
	timerLabel = ($TimerLabel as RichTextLabel)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progressBar.value = LevelManager.current_level_progress() * 100.0
	timerLabel.text = str(LevelManager.levelTimer.time_left).pad_decimals(2)
