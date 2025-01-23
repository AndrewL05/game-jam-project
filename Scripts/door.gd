extends StaticBody3D

var interactable : bool = true
var toggle : bool = false
@export var animation_player: AnimationPlayer
@onready var ui_node: Control = get_tree().current_scene.get_node("Door/Hinge/StaticBody3D/DoorUI")
var token = 0  

func interact():
		
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	get_node("/root/"+ get_tree().current_scene.name + "/Player").movable = false
	get_node("/root/"+ get_tree().current_scene.name + "/Player/head").movable = false 
	if interactable:
		interactable = false
		_show_code_input()
	if get_tree().get_current_scene().name == "Hospital_Scene":
		_toggle_door("open")
		ui_node.visible = false
		get_tree().create_timer(1.0, false).timeout.connect(
			func():
				get_tree().change_scene_to_file("res://Scenes/DetectiveOffice.tscn")
		)
	elif get_tree().get_current_scene().name == "Detective Office":
		_toggle_door("open")
		ui_node.visible = false
		get_tree().create_timer(1.0, false).timeout.connect(
			func():
				get_tree().change_scene_to_file("res://Scenes/house_scene.tscn")
		)
	elif get_tree().get_current_scene().name == "house_scene" && token ==0:
		ui_node.visible = false
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		_toggle_door("open")
		token += 1
		await get_tree().create_timer(3.0,false).timeout
		_toggle_door("close")
func _show_code_input():
	# Display the UI for entering the code
	ui_node.visible = true
	ui_node.get_node("SubmitButton").connect("pressed", Callable(self, "_on_code_submitted"))
	ui_node.get_node("CodeInput").grab_focus()

func _on_code_submitted():
	# Handle code submission
	var user_code = ui_node.get_node("CodeInput").text
	if not user_code: 
		return
		
	ui_node.get_node("CodeInput").text = ""
	ui_node.visible = false
	ui_node.get_node("SubmitButton").disconnect("pressed", Callable(self, "_on_code_submitted"))
	var allowedCode = ["1253", "3113", "1332"];

	if user_code == "1253" or "3113" or "1332":
		if user_code in allowedCode:
			_toggle_door("open")
			#print (get_tree().current_scene.name)
			await get_tree().create_timer(1.0,false).timeout
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

	else:
		_toggle_door("locked")

	interactable = true
	
func _toggle_door(state: String):
	if state == "open":
		if not toggle:
			toggle = true
			animation_player.play("open")
	elif state == "locked":
		animation_player.play("locked")
	else:
		if toggle:
			toggle = false
			animation_player.play("close")
			
	get_node("/root/"+ get_tree().current_scene.name + "/Player").movable = true
	get_node("/root/"+ get_tree().current_scene.name + "/Player/head").movable = true 
