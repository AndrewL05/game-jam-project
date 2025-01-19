extends Node2D

func _ready() -> void:
	get_node("VBoxContainer/Volume").grab_focus()

func _on_volume_pressed() -> void:
	pass
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
