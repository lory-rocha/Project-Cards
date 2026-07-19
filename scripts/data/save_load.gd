extends Node

const SAVE_PATH = "user://usr_card_deck.tres"
func load_deck() -> CardDeck:
	if ResourceLoader.exists(SAVE_PATH):
		var deck = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE) as CardDeck
		for card in deck.cards: print(card)
		print("Loaded deck")
		return deck
	else: 
		print("New card deck created")
		return CardDeck.new()

func save_deck(card_deck:CardDeck)->void:
	ResourceSaver.save(card_deck, SAVE_PATH)
