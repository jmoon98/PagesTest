extends Node2D

@onready var runner1 = $SubViewportContainer/SubViewport/AnimatedSprite2D
@onready var runner2 = $SubViewportContainer/SubViewport/AnimatedSprite2D2
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_runners()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("title_accept"):
		var level_scene = preload("res://scenes/test.tscn").instantiate()
		get_tree().root.add_child(level_scene)
		queue_free()
		
	runner1.position.x += 200*delta
	runner2.position.x -= 200*delta
	
	if runner1.position.x >= 1500 and runner2.position.x <= -200:
		spawn_runners()

func spawn_runners():
	var randInt = rng.randi_range(1, 4)
	runner1.play("running_" + str(randInt))
	randInt = rng.randi_range(1,4)
	runner2.play("running_" + str(randInt))
	runner1.scale = Vector2(3, 3)
	runner2.scale = Vector2(-3, 3)
	
	# setting random position
	var randY1 = rng.randi_range(20, 300)
	runner1.position = Vector2(-300, randY1)
	var randY2 = rng.randi_range(400, 630)
	runner2.position = Vector2(1300, randY2)

func _on_start_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/test.tscn")

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
