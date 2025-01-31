extends Node3D

var sens: float = 0.005  
var movable = false
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && movable == true:
		get_parent().rotate_y(-event.relative.x * sens)
		rotate_x(-event.relative.y * sens)
		rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))
