extends RayCast3D

@export var damage : float = 0.2
@export var heal : float = 0.2

func _physics_process(delta: float) -> void:
	if is_colliding():
		var object = get_collider()
		if object is Player:
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				object.health.receive_damage(damage, owner)
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
				object.health.receive_healing(heal, owner)
