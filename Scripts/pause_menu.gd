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

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur") 
	
func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")

func _on_new_game_pressed() -> void:
	pass # Replace with scene change to new game 

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().quit()
	
func testEsc():
	if Input.is_action_just_pressed("pause_game") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause_game") and get_tree().paused:
		resume()
