extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("title_accept"):
		var level_scene = preload("res://scenes/test.tscn").instantiate()
		get_tree().root.add_child(level_scene)
		queue_free()


func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test.tscn")


func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
