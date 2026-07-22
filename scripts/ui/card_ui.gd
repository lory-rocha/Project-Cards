extends Control
var current_deck:CardDeck
var rnd_card: CardData

func _ready() -> void:
	current_deck = CardManager.return_deck()
	randomize()

func randomize_card():
	if current_deck && current_deck.cards.size() > 0:
		rnd_card = CardManager.get_card()
		rnd_card = CardManager.randomize_card()
		update_ui(rnd_card)
		CardManager.reload_deck()
		
func update_ui(new_card:CardData):
	if new_card != null:
		%Category.text = 		new_card.type_to_string()
		%ProjectTitle.text = 	new_card.name
		%Deadline.text = 		new_card.deadline
	else:
		print("card is null")
		%Category.text = 		"Category"
		%ProjectTitle.text = 	"Project Name"
		%Deadline.text = 		"Deadline"
		
func _on_randomize_button_clicked():
	randomize_card()

func _on_new_card_button_menu_prompted() -> void:
	self.hide()

func _on_new_card_button_menu_closed() -> void:
	self.show()

func _on_delete_deck_button() -> void:
	CardManager.delete_deck()
