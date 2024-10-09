extends CharacterBody2D

var thrown: bool = false
var throw_charge: float = 0.0
signal throw_ball
signal start_throw

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("throw") and not thrown and throw_charge < 1800:
		start_throw.emit()
		throw_charge += (500*delta)
	
	if Input.is_action_just_released("throw"):
		var throw_dir: Vector2 = (get_global_mouse_position()-position).normalized()
		throw_ball.emit(throw_charge, throw_dir)
		thrown = true
