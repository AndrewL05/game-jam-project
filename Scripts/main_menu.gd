extends Node2D

var game_started = false

func _ready() -> void:
	$VolumeSlider.visible = false
	get_node("Buttons/Start").grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  # Ensure mouse is visible in the menu
	$VolumeSlider.value = -10  # Match this to your default volume level
	_adjust_volume(-10)  # Set initial volume
	
func _process(delta: float) -> void:
	pass
	
func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/hospital_scene.tscn")
	
func _on_controls_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/controls_menu.tscn")
	
func _on_quit_pressed() -> void:
	get_tree().quit()
	
func _on_volume_pressed() -> void:
	$VolumeSlider.visible = !$VolumeSlider.visible
	
func _on_back_pressed() -> void:
	if get_tree().current_scene.name == "MainMenu":
		if game_started:
			get_tree().change_scene_to_file("res://Scenes/hospital_scene.tscn") # load continued game scene
	else:
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func _on_v_slider_value_changed(value: float) -> void:
	_adjust_volume(value)
	
func _adjust_volume(value):
	# Set the master volume using AudioServer
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
