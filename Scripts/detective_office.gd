extends Node3D


func _ready() -> void:
	get_node("/root/"+ get_tree().current_scene.name + "/Player").movable = true
	get_node("/root/"+ get_tree().current_scene.name + "/Player/head/Camera3D").current = true
	get_node("/root/"+ get_tree().current_scene.name + "/Player/head").movable = true 
	
