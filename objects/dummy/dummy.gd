extends Player
class_name Dummy

func _process(delta: float) -> void:
	$Health2.text = str(snapped($Health.current_hp, 0.01))
	$Stts.text = str(stats)

func _physics_process(delta: float) -> void:
	super(delta)
	move_and_slide()

func _death(killer) -> void :
	entity_death.emit(self)
	queue_free()
