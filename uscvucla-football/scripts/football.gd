extends Area2D

var ball_speed: int = 0
var thrown: bool = false

func _ready():
	visible = false

func _physics_process(delta: float) -> void:
	if not thrown:
		rotation = (get_global_mouse_position()-$"../Player".position).angle()
	position.x += cos(rotation) * ball_speed * delta
	position.y += sin(rotation) * ball_speed * delta

func _on_player_throw_ball(throw_charge, throw_dir) -> void:
	if not thrown:
		visible = true
		print("signal received, charge: ", throw_charge, throw_dir)
		ball_speed = throw_charge
		thrown = true


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("receive_ball"):
		queue_free()
		print("Successful pass!")
