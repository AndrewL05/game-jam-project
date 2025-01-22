extends Area3D


@export var animationPlayer: AnimationPlayer
@export var audioPlayer: AudioStreamPlayer3D
@export var anim_name: String
var token = 0 

	
func trigger_entered(body: Node3D) -> void:
	if body == get_node("/root/" + get_tree().current_scene.name + "/Player") && token == 0:
		animationPlayer.play("ghost_girl_lc_ghost_girl_dmx_skeleton|Skip")
		token =1
		
