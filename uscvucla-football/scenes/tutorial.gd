extends Control

var tutorial_arrow_max_deg = 45
var tutorial_arrow_rot_speed = 40
var tutorial_arrow_rot_clockwise = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D/AnimatedSprite2D2.play("tutorial_receiver")
	$Sprite2D/AnimatedSprite2D3.play("mouse_click")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if tutorial_arrow_rot_clockwise:
		$Sprite2D/Sprite2D2.rotation_degrees += tutorial_arrow_rot_speed * delta
		if $Sprite2D/Sprite2D2.rotation_degrees > 45:
			tutorial_arrow_rot_clockwise = false
	else:
		$Sprite2D/Sprite2D2.rotation_degrees -= tutorial_arrow_rot_speed * delta
		if $Sprite2D/Sprite2D2.rotation_degrees < -45:
			tutorial_arrow_rot_clockwise = true


func _on_backto_main_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
