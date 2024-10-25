extends Node2D

var enemy: PackedScene = preload("res://scenes/enemy.tscn")
var receiver: PackedScene = preload("res://scenes/receiver.tscn")
var usc_linemen: PackedScene = preload("res://scenes/usc_linemen.tscn")
var ucla_linemen: PackedScene = preload("res://scenes/ucla_linemen.tscn")
signal enemy_spawned(player_pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# i'm going to clean these up later in a separate function; 
	# just wanted to get a working thing quick
	var usc_lm1 = usc_linemen.instantiate()
	usc_lm1.scale = Vector2(4.5, 4.5)
	usc_lm1.position = Vector2(500, 150)
	add_child(usc_lm1)
	usc_lm1.move_child(usc_lm1, $"..".get_child_count() - 1)
	var usc_lm2 = usc_linemen.instantiate()
	usc_lm2.scale = Vector2(4.5, 4.5)
	usc_lm2.position = Vector2(500, 250)
	add_child(usc_lm2)
	usc_lm1.move_child(usc_lm2, $"..".get_child_count() - 1)
	var usc_lm3 = usc_linemen.instantiate()
	usc_lm3.scale = Vector2(4.5, 4.5)
	usc_lm3.position = Vector2(500, 350)
	add_child(usc_lm3)
	usc_lm1.move_child(usc_lm3, $"..".get_child_count() - 1)
	var usc_lm4 = usc_linemen.instantiate()
	usc_lm4.scale = Vector2(4.5, 4.5)
	usc_lm4.position = Vector2(500, 450)
	add_child(usc_lm4)
	usc_lm4.move_child(usc_lm4, $"..".get_child_count() - 1)
	var usc_lm5 = usc_linemen.instantiate()
	usc_lm5.scale = Vector2(4.5, 4.5)
	usc_lm5.position = Vector2(500, 550)
	add_child(usc_lm5)
	usc_lm5.move_child(usc_lm5, $"..".get_child_count() - 1)
	
	var ucla_lm1 = ucla_linemen.instantiate()
	ucla_lm1.scale = Vector2(-1*4.5, 4.5)
	ucla_lm1.position = Vector2(585, 150)
	add_child(ucla_lm1)
	var ucla_lm2 = ucla_linemen.instantiate()
	ucla_lm2.scale = Vector2(-1*4.5, 4.5)
	ucla_lm2.position = Vector2(585, 250)
	add_child(ucla_lm2)
	var ucla_lm3 = ucla_linemen.instantiate()
	ucla_lm3.scale = Vector2(-1*4.5, 4.5)
	ucla_lm3.position = Vector2(585, 350)
	add_child(ucla_lm3)
	var ucla_lm4 = ucla_linemen.instantiate()
	ucla_lm4.scale = Vector2(-1*4.5, 4.5)
	ucla_lm4.position = Vector2(585, 450)
	add_child(ucla_lm4)
	var ucla_lm5 = ucla_linemen.instantiate()
	ucla_lm5.scale = Vector2(-1*4.5, 4.5)
	ucla_lm5.position = Vector2(585, 550)
	add_child(ucla_lm5)
	
	var rand_enemy_time = randi_range(2, 5)
	$Enemy_Timer.wait_time = rand_enemy_time
	print("Rush after: ", rand_enemy_time)
	$Enemy_Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	# same thing here; i'm going to clean these up in a separate function
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
	move_child(enemy1, 1)
	move_child(enemy2, 2)
	
	var receiver1 = receiver.instantiate()
	var receiver2 = receiver.instantiate()
	receiver1.scale = Vector2(4, 4)
	receiver2.scale = Vector2(4, 4)
	receiver1.position = Vector2(550, 150)
	receiver2.position = Vector2(550, 450)
	add_child(receiver1)
	add_child(receiver2)
	move_child(receiver1, 3)
	move_child(receiver2, 4)
