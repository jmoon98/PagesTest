extends CharacterBody2D

func _physics_process(delta: float) -> void:
	rotation = (get_global_mouse_position()-$"../Player".position).angle()
	
func _on_player_throw_ball(throw_charge, throw_dir) -> void:
	print("arrowtest")
	queue_free()
	
func _on_player_start_throw() -> void:
	if $"Sprite2D".scale.x < 5:
		$"Sprite2D".scale.x = 1.02*$"Sprite2D".scale.x
