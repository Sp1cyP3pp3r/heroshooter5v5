extends PlayerState

var _power = 0.01

# Called when the state machine enters this state.
func on_enter():
	super()
	#player.acceleration = 1.8
	if %FiniteStateMachine._previous_state.name == "Run"  or %FiniteStateMachine._previous_state.name == "Idle":
		can_jump_in_this_state = true
		$CoyoteTimer.start()

# Called every physics frame when this state is active.
func on_physics_process(delta):
	handle_fall(delta)
	handle_landing()
	handle_movement(delta)
	
	if player.is_multiplayer_authority():
		if Input.is_action_pressed("jump"):
			handle_mantle()
	handle_jump()

# Called when the state machine exits this state.
func on_exit():
	super()
	pass

func coyote_disable_jump() -> void :
	can_jump_in_this_state = false

func handle_landing():
	if player.legs.is_touching_floor():
		change_state("Run")
