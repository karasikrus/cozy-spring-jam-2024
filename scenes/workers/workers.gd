extends Node2D

var target_point_template: Node2D = null
var worker_template: Node2D = null
var workers_buffer = []
var spawn_point: Node2D = null
var target_points = []
var workers_cur_count: int = 5
var workers_max_count_on_screen: int = 5
# Called when the node enters the scene tree for the first time.


func _ready():
	target_point_template = $TargetPointTemplate as Node2D
	worker_template = $WorkerTemplate as Node2D
	spawn_point = $SpawnPoint as Node2D
	var target_points_holder : Node2D = $TargetPointsHolder as Node2D
	target_points = target_points_holder.get_children()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if workers_buffer.size() > 10:
		return
	var countNeedToSpawn = max(workers_cur_count, workers_max_count_on_screen) - workers_buffer.size()
	
	for i in range(countNeedToSpawn):
		var worker_to_add =  worker_template.duplicate()
		worker_to_add.visible = true
		workers_buffer.append(worker_to_add)
		add_child(worker_to_add)
	
	pass
