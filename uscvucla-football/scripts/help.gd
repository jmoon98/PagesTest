extends Node
var arrow_rot: bool = true


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D2.rotation_degrees = -40
	if !Global.firstThrow:
		queue_free()
	else:
		$".".visible = true
	$AnimatedSprite2D.play("spacebar")
	$AnimatedSprite2D2.play("tutorial_receiver")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if arrow_rot: 
		$Sprite2D2.rotation_degrees += 1
		if $Sprite2D2.rotation_degrees >= 40:
			arrow_rot = false
	else:
		$Sprite2D2.rotation_degrees -= 1
		if $Sprite2D2.rotation_degrees <= -40:
			arrow_rot = true


func _on_player_start_throw() -> void:
	Global.firstThrow = false
	$".".visible = false
	queue_free()
