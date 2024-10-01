extends CharacterBody3D
class_name Player

signal entity_death()

@export_category("Bodyparts")
@export var legs : Node3D
@export var head : Node3D
@export var climb : Node3D
@export var health : Health

@export var stats : Dictionary[StringName, float] = {
	speed = 6.5,
	max_hp = 100.0,
	acceleration = 18.0,
	gravity = 17.0,
	jump_power = 6.53,
	damage_susceptibility = 0,
	damage_resistance = 0,
	healing_susceptibility = 0,
	healing_resistance = 0
}

@onready var state_machine = %FiniteStateMachine

var checkpoint : Vector3
var is_mantling : bool = false
var additional_velocity : Vector3

func _physics_process(delta: float) -> void:
	var pre_velocity = velocity
	velocity = pre_velocity + additional_velocity

#func _enter_tree() -> void:
	#set_multiplayer_authority(name.to_int())
	#if get_multiplayer_authority() == 1:
		#$CanvasLayer/Peer.visible = true
		

func _ready() -> void:
	checkpoint = global_position
	#if is_multiplayer_authority():
		#%Camera.make_current()
		#$BodyMesh.visible = false

func death(killer = self):
	entity_death.emit(self)
	#var array = [Color("80b3ff"), Color("ffb380"), Color("d35f8d")]
	#var death_s = $CanvasLayer/Death
	#var rand = randi_range(0, array.size() - 1)
	#death_s.color = array[rand]
	#death_s.color = Color(death_s.color, 0)
	#death_s.visible = true
	#var tween = create_tween()
	#tween.tween_property(death_s, "color", Color(death_s.color, 1), 1)
	#tween.play()
	#await tween.finished
	global_position = checkpoint
	#tween.kill()
	#var tween2 = create_tween()
	#tween2.tween_property(death_s, "color", Color(death_s.color, 0), 0.5)
	#tween.play()
	#await tween2.finished
	#death_s.visible = false
	#tween2.kill()
