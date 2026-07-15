extends Resource
class_name CardData

@export var id: int
@export var name: String
@export var category: Types
@export var desc: String

enum Types
{	CMPSCI,
	ART,
	DESIGN,
	WRITING,
	GAME_DEV
}

func _to_string() -> String:
	var type_str = Types.keys()[category]
	return "--[%s] %s (ID: %d)--" % [type_str, name, get_instance_id()]

func set_time_frame():
	## Set a random time frame between hours and days
	const hours = 6
	var rnd = RandomNumberGenerator.new()
	var rnd_seed = rnd.randi_range(1, hours)

	
	if(rnd_seed == 1): return "%d hour" % rnd_seed
	elif (rnd_seed <= hours):
		return "%d hours" % rnd_seed

	
