extends Control
var current_deck:CardDeck
var rnd_card:CardData

func _ready() -> void:
	randomize()
	current_deck = SaveLoad.load_deck()
	randomize_card()

func randomize_card():
	if current_deck && current_deck.cards.size() > 0:
		rnd_card = CardManager.randomize_card_index(current_deck)
		update_ui(rnd_card)
		
func update_ui(card:CardData):
	if card != null:
		var deadline = card.set_time_frame()
		var category = CardManager.set_types_to_string(rnd_card)
		%Category.text = category
		%ProjectTitle.text = card.name
		%Deadline.text = str(deadline)
	else:
		%Category.text = "Category"
		%ProjectTitle.text = "Project Name"
		%Deadline.text = "Deadline"
		
func _on_randomize_button_clicked():
	randomize_card()
	if self.hidden:
		self.show()

func _on_new_card_button_menu_prompted() -> void:
	self.hide()

func _on_new_card_button_menu_closed() -> void:
	self.show()
