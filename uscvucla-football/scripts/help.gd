extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Global.firstThrow:
		queue_free()
	else:
		$".".visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_player_start_throw() -> void:
	Global.firstThrow = false
	$".".visible = false
	queue_free()
