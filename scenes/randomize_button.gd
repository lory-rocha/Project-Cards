extends Button
signal clicked

func _ready() -> void:
	self.pressed.connect(_on_button_pressed)
	
func _on_button_pressed():
	emit_signal("clicked")
