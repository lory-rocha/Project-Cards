extends Button
signal deck_deleted

func _ready() -> void:
	self.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	emit_signal("deck_deleted")
