extends Node3D

var interactable: bool = true
var toggle: bool = false
@export var animation_player : AnimationPlayer

func _ready() -> void:
	pass
		
func interact():
	if interactable == true: 
		interactable = false
		toggle = !toggle
		if toggle == false:
			$Hinge/AnimationPlayer.play("close")
		if toggle == true:
			$Hinge/AnimationPlayer.play("open")
		await get_tree().create_timer(1.0,false).timeout
		interactable = true
