extends Node2D

var enemy: PackedScene = preload("res://scenes/enemy.tscn")
signal enemy_spawned(player_pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rand_enemy_time = randi_range(2, 5)
	$Enemy_Timer.wait_time = rand_enemy_time
	print("Rush after: ", rand_enemy_time)
	$Enemy_Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	print("Enemy team start rush")
	var enemy1 = enemy.instantiate()
	var enemy2 = enemy.instantiate()
	enemy_spawned.emit($Player.position)
	enemy1.scale = Vector2(4, 4)
	enemy2.scale = Vector2(4, 4)
	enemy1.position = Vector2(500, 150)
	enemy1.scale.x *= -1
	enemy2.position = Vector2(500, 450)
	enemy2.scale.x *= -1
	add_child(enemy1)
	add_child(enemy2)
