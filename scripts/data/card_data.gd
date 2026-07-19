extends Resource
## Base class for a generic card.
##
## A card can also be interpreted as a "project"
class_name CardData

## Represents a identification for the card: [int] 
@export var id: int
@export var deadline: String = ""
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

func type_to_string() -> String:
	var type_str = Types.keys()[category]
	return type_str

func _to_string() -> String:
	### Prints the "Types" enum into a string when <print(card)> is called 
	var type_str = Types.keys()[category]
	return "--[%s] %s (ID: %d)--" % [type_str, name, get_instance_id()]
	
func set_time_frame() -> void:
	const hours = 6
	
	# Generates a number using the global seed (already set up in your _ready)
	var rnd_seed = randi_range(1, hours)
	if rnd_seed == 1: 
		self.deadline = "1 hour"
	else:
		self.deadline = "%d hours" % rnd_seed
