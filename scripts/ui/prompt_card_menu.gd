extends Button
signal menu_prompted
signal menu_closed
@onready var menu_scene = preload("res://scenes/CardMenu.tscn")

func _ready() -> void:
	self.pressed.connect(_prompt_menu)
	
func _prompt_menu():
	var menu_instance = menu_scene.instantiate()
	get_parent().add_sibling(menu_instance)
	
	emit_signal("menu_prompted")
	menu_instance.tree_exited.connect(_on_menu_exit)
	
func _on_menu_exit():
	emit_signal("menu_closed")
