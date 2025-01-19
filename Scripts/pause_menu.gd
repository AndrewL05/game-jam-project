extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_resume_pressed() -> void:
	get_tree().paused = false
	queue_free() 

func _on_settings_pressed() -> void:
	pass # Replace with function body.

func _on_new_game_pressed() -> void:
	pass # Replace with scene change to new game 

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
