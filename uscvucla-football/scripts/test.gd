extends Node2D

var enemy: PackedScene = preload("res://scenes/enemy.tscn")
var receiver: PackedScene = preload("res://scenes/receiver.tscn")
var usc_linemen: PackedScene = preload("res://scenes/usc_linemen.tscn")
var ucla_linemen: PackedScene = preload("res://scenes/ucla_linemen.tscn")
var usc_lm_count: int = 0
var ucla_lm_count: int = 0
var receiver_count: int = 0
var enemy_count: int = 0
signal enemy_spawned(player_pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var usc_lm1 = usc_linemen.instantiate()
	var usc_lm2 = usc_linemen.instantiate()
	var usc_lm3 = usc_linemen.instantiate()
	var usc_lm4 = usc_linemen.instantiate()
	var usc_lm5 = usc_linemen.instantiate()
	var usc_linemen = [usc_lm1, usc_lm2, usc_lm3, usc_lm4, usc_lm5]
	for lineman in usc_linemen:
		setup_usc_linemen(lineman)
	
	var ucla_lm1 = ucla_linemen.instantiate()
	var ucla_lm2 = ucla_linemen.instantiate()
	var ucla_lm3 = ucla_linemen.instantiate()
	var ucla_lm4 = ucla_linemen.instantiate()
	var ucla_lm5 = ucla_linemen.instantiate()
	var ucla_linemen = [ucla_lm1, ucla_lm2, ucla_lm3, ucla_lm4, ucla_lm5]
	for lineman in ucla_linemen:
		setup_ucla_linemen(lineman)
	
	var receiver1 = receiver.instantiate()
	var receiver2 = receiver.instantiate()
	setup_receiver(receiver1)
	setup_receiver(receiver2)
	
	var rand_enemy_time = randi_range(1, 3)
	$Enemy_Timer.wait_time = rand_enemy_time
	# print("Rush after: ", rand_enemy_time)
	$Enemy_Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_timer_timeout() -> void:
	# same thing here; i'm going to clean these up in a separate function
	print("Enemy team start rush")
	var enemy1 = enemy.instantiate()
	var enemy2 = enemy.instantiate()
	setup_enemies(enemy1)
	setup_enemies(enemy2)

# ===== FUNCTIONS TO INITIALLY SETUP ENEMIES AND LINEMEN =====
func setup_usc_linemen(lineman) -> void:
	lineman.scale = Vector2(4.5, 4.5)
	lineman.position = Vector2(150, 150 + usc_lm_count*100)
	usc_lm_count += 1
	add_child(lineman)
	lineman.move_child(lineman, $"..".get_child_count() - 1)
	
func setup_ucla_linemen(lineman) -> void:
	lineman.scale = Vector2(-1*4.5, 4.5)
	lineman.position = Vector2(235, 150 + ucla_lm_count*100)
	ucla_lm_count += 1
	add_child(lineman)
	lineman.move_child(lineman, $"..".get_child_count() - 1)
	
func setup_receiver(receiver) -> void:
	receiver.scale = Vector2(4, 4)
	receiver.position = Vector2(200, 150 + receiver_count*300)
	add_child(receiver)
	receiver_count += 1
	move_child(receiver, receiver_count)
	
func setup_enemies(enemy) -> void:
	enemy.scale = Vector2(-4, 4)
	enemy.position = Vector2(150, 150 + 300*enemy_count)
	enemy_count += 1
	add_child(enemy)
	move_child(enemy, enemy_count+1)
	
	
