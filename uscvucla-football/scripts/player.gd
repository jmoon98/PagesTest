extends CharacterBody2D

var thrown: bool = false
var throw_charge: float = 0.0
var animation_finished = false
signal throw_ball
signal start_throw


func _ready():
	$AnimatedSprite2D.play("idle")
	# for football visually flying over linemen
	# get_parent().move_child($"../Football", 0)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("throw") and not thrown and throw_charge < 1800:
		$AnimatedSprite2D.play("throw_ready")
		start_throw.emit()
		throw_charge += (600*delta)
	
	if Input.is_action_just_released("throw"):
		$AnimatedSprite2D.play("throw")
		var throw_dir: Vector2 = (get_global_mouse_position()-position).normalized()
		throw_ball.emit(throw_charge, throw_dir)
		thrown = true


func _on_animated_sprite_2d_animation_finished() -> void:
	var current_animation = $AnimatedSprite2D.animation
	if current_animation == "throw":
		$AnimatedSprite2D.play("idle")
