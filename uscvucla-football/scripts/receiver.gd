extends Node

var type

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type = randi_range(1, 4)
	$"AnimatedSprite2D".play("idle" + str(type))
	await get_tree().create_timer(2).timeout
	print("start running")
	$"AnimatedSprite2D".play("usc" + str(type) + " run")
	#TODO: Running code


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
