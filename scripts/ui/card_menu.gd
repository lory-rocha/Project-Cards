extends Control
 ## TODO: check if text field is empty
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_dropdown_items()

	%ConfirmButton.pressed.connect(_on_button_click)
	%CancelButton.pressed.connect(_on_cancel)
	
func _on_button_click():
	CardManager._create_card(%InputProjectName.text, %ProjectDescription.text, %CategoryOption.get_selected_id())

func _on_cancel():
	self.queue_free()

func _on_menu_prompted():
	print("signal was connected")
func set_dropdown_items():
	var category_keys = CardData.Types.keys()
	for k in range (category_keys.size() ):
		var category_string = category_keys[k]
		%CategoryOption.add_item(category_string, k)
