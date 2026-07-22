extends Node

var SAVE_PATH = SaveLoad.SAVE_PATH
var deck: CardDeck
var card: CardData

func _ready() -> void:
	randomize()
	deck = SaveLoad.load_deck()

func check_deck() -> void:
	if deck == null:
		deck = SaveLoad.load_deck()
	else: return

func return_deck() -> CardDeck:
	return deck
	
func delete_deck() -> void:
	if deck && deck.cards.size() > 0:
		if FileAccess.file_exists(SaveLoad.SAVE_PATH):
			DirAccess.remove_absolute(SaveLoad.SAVE_PATH)
			print("Save file physically deleted from disk.")
		
		deck.cards.clear()
		print("deck cleared: ", deck.cards.size(), " cards")
	else: 
		print("Deck is already empty")
		
func reload_deck():
	if deck && deck.cards.size() > 0:
		deck = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_REPLACE)
	else: deck = null

func init_card(card_name:String, desc: String) -> void:
	var new_card = CardData.new()
	new_card.name = card_name
	new_card.desc = desc
	new_card.resource_local_to_scene = true
	deck.add_card(new_card)
	
	print(new_card.name, " added to deck")
	print(new_card)
	SaveLoad.save_deck(deck)

func get_card() -> CardData:
	return card

var available_cards: Array[CardData] = []
var last_drawn_card: CardData = null

func randomize_card() -> CardData:
	if not deck or deck.cards.is_empty():
		return null

	if deck.cards.size() == 1:
		return deck.cards[0]

	# Refill and shuffle the bag when empty
	if available_cards.is_empty():
		available_cards = deck.cards.duplicate()
		available_cards.shuffle() # Knuth / Fisher-Yates

		# Prevent back-to-back match across bag boundaries
		if available_cards.back() == last_drawn_card:
			# Swap the matching card with the bottom of the new bag
			var temp = available_cards[0]
			available_cards[0] = available_cards.back()
			available_cards[available_cards.size() - 1] = temp

	last_drawn_card = available_cards.pop_back()
	last_drawn_card.set_time_frame()
	return last_drawn_card
