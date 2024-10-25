extends CharacterBody2D

var type
var speed: int = 200
var new_dir: int
var id: String = "receiver"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type = randi_range(1, 4)
	$"AnimatedSprite2D".play("idle" + str(type))
	# await get_tree().create_timer(2).timeout
	print("start running")
	$"AnimatedSprite2D".play("usc" + str(type) + " run")
	#TODO: Running code


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = Vector2(speed, speed * new_dir)
	move_and_slide()
	random_run()
	
func receive_ball() -> void:
	# will likely change the sprite to the version carrying ball.
	# i'll make and add them soon! 
	# for now, it's used just so we know we've hit a receiver, and not
	# not a lineman. 
	
	pass
	
func random_run() -> void:
	if $Direction_Timer.is_stopped():
		var rand_timer: int = randi_range(0, 1)
		$Direction_Timer.wait_time = rand_timer
		print(name, " changing direction in: ", rand_timer)
		$Direction_Timer.start()


func _on_direction_timer_timeout() -> void:
	new_dir = randi_range(-1, 1)
