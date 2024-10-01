extends Area3D

@export var speed : float = 10
@export var damage : float = 11.25
@export var create_effects : CreateEffects

func _physics_process(delta: float) -> void:
	global_position += -global_basis.z * speed * delta
	speed += delta + speed / 75


func _on_body_entered(body: Node3D) -> void:
	if body.has_node("Health"):
		body.health.receive_damage(damage, owner)
		create_effects.add_effects(body)
		body.additional_velocity += -global_basis.z *0.5
	queue_free()
