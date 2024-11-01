extends Area2D

var type
var speed: int = 100
var direction: Vector2

signal lose

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_node = get_parent().get_node("Player")
	direction = (player_node.position - position).normalized()
	type = randi_range(1, 4)
	$"AnimatedSprite2D".play("ucla" + str(type) + " run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#TODO: enemies might need to move faster to counter long-charging the ball
func _process(delta: float) -> void: 
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player" && Global.hasBall: #TODO if the ball is still in midair, this shouldn't lose
		speed = 0
		Global.attempts -= 1
		lose.emit() #lose round signal
		if Global.attempts > 0:
			print("You lose!")
			get_tree().reload_current_scene()
		else:
			# TODO: game over
			pass
