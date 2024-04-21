extends Control
class_name MutationScreen

@onready var mutation_card_a = %MutationCardA as MutationCard
@onready var mutation_card_b = %MutationCardB as MutationCard

var mutations : Array[MutationResource] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	mutations = MutationsManager.get_random_mutations(2)
	mutation_card_a.mutation_resource = mutations[0]
	mutation_card_b.mutation_resource = mutations[1]
	mutation_card_a.update_mutaton()
	mutation_card_b.update_mutaton()
	mutation_card_a.pressed.connect(on_card_pressed)
	mutation_card_b.pressed.connect(on_card_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_card_pressed(mutation):
	MutationsManager.set_mutation(mutation)
	queue_free()
