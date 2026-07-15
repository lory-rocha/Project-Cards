extends Resource
class_name CardDeck

@export var cards: Array[CardData]

func add_card(card: CardData) -> void:
	cards.append(card)
func remove_card(card: CardData) -> void:
	cards.erase(card)
