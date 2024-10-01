extends Effect

@export var velocity_power : float
@export var velocity_direction : Vector3 :
	set(param):
		velocity_direction = param.normalized()

var velocity

func apply_predesigned_effect() -> void:
	if "additional_velocity" in effected_game_object:
		velocity = velocity_direction * velocity_power
		effected_game_object.additional_velocity += velocity
	else:
		discard_effects()

func discard_effects() -> void:
	super()
	if "additional_velocity" in effected_game_object:
		effected_game_object.additional_velocity -= velocity
