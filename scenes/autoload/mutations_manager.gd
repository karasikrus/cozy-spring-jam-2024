extends Node

signal new_mutation(mutation)

@export var all_mutations : Array[MutationResource]
var taken_mutations : Array[MutationResource]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_mutation(m):
	taken_mutations.append(m)
	new_mutation.emit(m)

func get_available_mutations() -> Array[MutationResource]:
	var result : Array[MutationResource] = []
	for mutation in all_mutations:
		if mutation in taken_mutations:
			continue
		result.append(mutation)
	
	return result

func get_random_mutations(mutations_number : int) -> Array[MutationResource]:
	var result : Array[MutationResource] = []
	var mutations : Array[MutationResource] = get_available_mutations()
	for i in mutations_number:
		var mutation = mutations.pick_random()
		if mutation != null:
			result.append(mutation)
			mutations.erase(mutation)
	return result



