extends CharacterBody3D

var sprint_drain_amount = 0.1
var sprint_refresh_amount = 0.1
var ORIGINAL_SPEED
var SPEED = 3.0
var SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 4.5
var sprint_slider
var movable = false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause_game"):
		$PauseMenu.pause()

func _ready():
	sprint_slider
	ORIGINAL_SPEED =SPEED
	sprint_slider = get_node("/root/" + get_tree().current_scene.name + "/UI/sprint_slider")

func _process(delta):
	
	if Input.is_action_just_pressed("foward") or \
	   Input.is_action_just_pressed("backward") or \
	   Input.is_action_just_pressed("right") or \
	   Input.is_action_just_pressed("left"):
		$head/Camera3D/step.play()
	if Input.is_action_just_released("foward") or Input.is_action_just_pressed("sprint") or \
	   Input.is_action_just_released("backward") or Input.is_action_just_pressed("sprint") or \
	   Input.is_action_just_released("right") or Input.is_action_just_pressed("sprint") or \
	   Input.is_action_just_released("left") or Input.is_action_just_pressed("sprint"):
		$head/Camera3D/step.stop()
	if Input.is_action_just_pressed("sprint"):
		$head/Camera3D/running.play()
	if Input.is_action_just_released("sprint"):
		$head/Camera3D/running.stop()
		
	
	
		
	if SPEED == SPRINT_SPEED:
		sprint_slider.value = sprint_slider.value - sprint_drain_amount * delta 
		if sprint_slider.value == sprint_slider.min_value:
			SPEED = ORIGINAL_SPEED
	if SPEED != SPRINT_SPEED:
		if sprint_slider.value < sprint_slider.max_value:
			sprint_slider.value = sprint_slider.value + sprint_refresh_amount * delta 
		if sprint_slider.value == sprint_slider.max_value:
			sprint_slider.visible = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if movable == true:
	# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_dir := Input.get_vector("left", "right", "foward", "backward")
		var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			if Input.is_action_just_pressed("sprint"):
				sprint_slider.visible = true
				SPEED = SPRINT_SPEED
			if Input.is_action_just_released("sprint"):
				SPEED = ORIGINAL_SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)

		move_and_slide()
