extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("/root/"+ get_tree().current_scene.name + "/Player").movable = true
	get_node("/root/"+ get_tree().current_scene.name + "/Player/head/Camera3D").current = true
	get_node("/root/"+ get_tree().current_scene.name + "/Player/head").movable = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
