extends Node

const SAVE_PATH = SaveLoad.SAVE_PATH
var current_deck: CardDeck

func _ready() -> void:
	current_deck = SaveLoad.load_deck()

func _create_card(card_name:String, card_desc:String, card_category:CardData.Types):
	var new_card = CardData.new()
	
	new_card.name = card_name
	new_card.desc = card_desc
	new_card.category = card_category
	new_card.resource_local_to_scene = true
	
	current_deck.add_card(new_card)
	print(new_card.name, " added to deck")
	print(set_types_to_string(new_card))
	
	SaveLoad.save_deck(current_deck)
	
func get_card_from_deck(deck:CardDeck, index:int):
	if deck.cards.size() > 0:
		return deck.cards[index]
	else: return null

func get_all_cards_from_deck(deck:CardDeck):
	if deck.cards.size() > 0:
		for card in range (deck):
			return deck.cards[card]
	else: return null

func randomize_card_index(deck:CardDeck):
	var rnd_index = deck.cards.pick_random()
	return rnd_index

func set_types_to_string(card:CardData)-> String:
	if card == null:
		return "No type data"
	var types_string = card.Types.keys()[card.category]
	return types_string
