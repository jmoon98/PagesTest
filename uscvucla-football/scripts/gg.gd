extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.attempts < 1:
		$".".show()


func _on_button_pressed() -> void:
	Global.attempts = 3
	Global.score = 0
	get_tree().reload_current_scene()
