@tool
extends Resource
class_name PredesignatedEffect

@export var effect_scene : PackedScene :
	set(variable):
		effect_scene = variable
		eff_values.clear()
		_properties()

var effect_vars : Array[Dictionary]
var eff_dict : Dictionary[String, Variant] # Property and parameter
var eff_values : Array[Variant]

func _properties() -> void:
	var eff_obj = effect_scene.instantiate()
	effect_vars = eff_obj.get_property_list()
	var real_properties : Array[Dictionary]
	var _node = Node.new()
	var blacklist = _node.get_property_list()
	_node.queue_free()
	for property in effect_vars:
		if not property in blacklist and property.usage != 128:
			real_properties.append(property)
			eff_values.append(eff_obj.get(property.name))
	effect_vars = real_properties
	eff_obj.queue_free()
	notify_property_list_changed()

func _get_property_list() -> Array:
	var eff_arr : Array
	eff_dict.clear()
	
	var i = 0
	for prop in effect_vars:
		var _name = prop.name
		var _val = eff_values[i]
		eff_dict[_name] = _val
		i += 1
	
	eff_arr = [
		{
			name = "eff_dict",
			type = TYPE_DICTIONARY,
			hint = PROPERTY_HINT_DICTIONARY_TYPE,
			hint_string = ",".join(PackedStringArray(eff_dict.keys())),
			usage = PROPERTY_USAGE_DEFAULT,
		}
	]
	
	return eff_arr
	
	print_rich(effect_vars)
	#[
		#{
			#"name": "additional_velocity_effect.gd", 
			#"class_name": &"",
			#"type": 0, 
			#"hint": 0, 
			#"hint_string": "res://objects/effects/predefined effects/additional_velocity_effect.gd", 
			#"usage": 128 
		#},
		#{ 
			#"name": "velocity_power", 
			#"class_name": &"", 
			#"type": 3, 
			#"hint": 0, 
			#"hint_string": "", 
			#"usage": 6
		#},
		#{ 
			#"name": "velocity_direction", 
			#"class_name": &"", 
			#"type": 9, 
			#"hint": 0, 
			#"hint_string": "", 
			#"usage": 6 
		#},
		#{ 
			#"name": "Effect.gd", 
			#"class_name": &"", 
			#"type": 0, 
			#"hint": 0, 
			#"hint_string": 
			#"res://objects/effects/Effect.gd",
			#"usage": 128 
		#}, 
		#{ 
			#"name": "properties_array", 
			#"class_name": &"", 
			#"type": 28, 
			#"hint": 23, 
			#"hint_string": "24/17:EffectedProperties", 
			#"usage": 6 
		#}, 
		#{ 
			#"name": "effected_game_object", 
			#"class_name": &"", 
			#"type": 24, 
			#"hint": 34, 
			#"hint_string": "Node", 
			#"usage": 6 
		#}
	#]
