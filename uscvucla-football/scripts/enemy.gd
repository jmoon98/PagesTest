extends Area2D

var type
var speed: int = 45
var direction: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_node = get_parent().get_node("Player")
	direction = (player_node.position - position).normalized()
	type = randi_range(1, 4)
	$"AnimatedSprite2D".play("ucla" + str(type) + " run")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		speed = 0
		print("You lose!")
