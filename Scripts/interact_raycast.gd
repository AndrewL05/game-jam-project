extends RayCast3D

@onready var transition = get_tree().get_first_node_in_group("transitionScenes")
var int_text

func _process(delta: float) -> void:
	if is_colliding(): 
		var hit = get_collider()
		if hit.has_method("interact"):
			int_text.visible = true
			if Input.is_action_just_pressed("open"):
				hit.interact()
		else:
			int_text.visible = false
	else:
			int_text.visible = false
	
	if is_colliding():
		Global.canInteract = true
		if Input.is_action_just_released("interact"):
			if get_collider().is_in_group("dialog") and not Global.dialogActive and get_collider().db != null:
				get_collider().db.activate()
			if get_collider().is_in_group("sceneChanger"):
				Global.nextScene = get_collider().nextScene
				if get_collider().node == get_collider().a.CHANGE_ROOM:
					transition.play("DetectiveOffice")
				elif get_collider().mode == get_collider().a.CHANGE_ROOM:
					transition.play("")
	else:
		Global.canInteract = false
	
func _ready() -> void:
	int_text = get_node("/root/" + get_tree().current_scene.name + "/UI/interact_text")
	
