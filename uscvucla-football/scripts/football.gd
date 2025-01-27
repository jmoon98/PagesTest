extends Area2D

var ball_speed: int = 0
var thrown: bool = false

signal score
signal lose

func _ready():
	visible = false

func _physics_process(delta: float) -> void:
	if get_parent():
		get_parent().move_child(self, get_parent().get_child_count()-1)
	if not thrown:
		rotation = (get_global_mouse_position()-$"../Player".position).angle()
	position.x += cos(rotation) * ball_speed * delta
	position.y += sin(rotation) * ball_speed * delta
	if position.x < -600 or position.x > 1700 or position.y < -570 or position.y > 1020:
		# print("Ball exited")
		Global.attempts -= 1
		lose.emit() #lose round signal
		if Global.attempts > 0:
			# print("You lose!")
			get_tree().reload_current_scene()

func _on_player_throw_ball(throw_charge, throw_dir) -> void:
	if not thrown:
		visible = true
		print("signal received, charge: ", throw_charge, throw_dir)
		ball_speed = throw_charge
		thrown = true

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("receive_ball"):
		score.emit() #score signal
		Global.score += 6
		Global.streak += 1
		queue_free()
		print("Successful pass!")
		get_tree().reload_current_scene()

#when the ball leaves the screen, emit lose
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	'''
	print("Ball exited")
	Global.attempts -= 1
	lose.emit() #lose round signal
	if Global.attempts > 0:
		print("You lose!")
		get_tree().reload_current_scene()
	else:
		pass
	'''
