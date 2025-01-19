extends Node3D


func _ready() -> void:
	pass #Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_game"):
		if get_tree().paused:  
			get_tree().paused = false
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) 
		else:
			get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
			#get_tree().paused = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)  
	
