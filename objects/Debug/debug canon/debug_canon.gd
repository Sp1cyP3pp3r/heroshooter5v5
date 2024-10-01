extends Node3D

@export var rocket_scene : PackedScene
@export var CE : CreateEffects

var reloaded : bool = true

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("fire") and reloaded:
		fire()

func fire() -> void:
	reloaded = false
	var rocket = rocket_scene.instantiate()
	get_tree().get_root().add_child(rocket)
	rocket.global_basis = global_basis
	rocket.global_position = global_position
	owner.additional_velocity += global_basis.z
	$ReloadTimer.start()
	

func reload():
	reloaded = true
	
	owner.additional_velocity *= 0 
