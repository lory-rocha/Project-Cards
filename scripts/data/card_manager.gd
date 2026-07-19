extends Node

const SAVE_PATH = SaveLoad.SAVE_PATH
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
	return_card()
	
	print(new_card.name, " added to deck")
	print(new_card)
	SaveLoad.save_deck(deck)

func return_card() -> CardData:
	return card

func randomize_card_index() -> void:
	var last_index = card
	if deck && deck.cards.size() > 0:
		var rnd_index = deck.cards[randi() % deck.cards.size()]
		while rnd_index == last_index:
			rnd_index = deck.cards[randi() % deck.cards.size()]
			last_index = rnd_index.duplicate()
		rnd_index.set_time_frame()
		card = rnd_index
	else: 
		print("No cards to randomize")
		return
