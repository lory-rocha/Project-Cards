extends Control
var current_deck:CardDeck
var rnd_card: CardData

func _ready() -> void:
	current_deck = CardManager.return_deck()
	randomize()

func randomize_card():
	if current_deck && current_deck.cards.size() > 0:
		rnd_card = CardManager.return_card()
		CardManager.randomize_card_index()
		update_ui(rnd_card)
		CardManager.reload_deck()
		
func update_ui(rnd_card:CardData):
	if rnd_card != null:
		%Category.text = rnd_card.type_to_string()
		%ProjectTitle.text = rnd_card.name
		%Deadline.text = rnd_card.deadline
	else:
		%Category.text = "Category"
		%ProjectTitle.text = "Project Name"
		%Deadline.text = "Deadline"
		
func _on_randomize_button_clicked():
	randomize_card()

func _on_new_card_button_menu_prompted() -> void:
	self.hide()

func _on_new_card_button_menu_closed() -> void:
	self.show()

func _on_delete_deck_button() -> void:
	CardManager.delete_deck()
