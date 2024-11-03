extends Node2D

var test_streak: int = 11

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Distance_10".play(str(Global.score/10))
	$"../Distance_1".play(str(Global.score%10))
	$"../Streak_10".play(str(test_streak/10))
	$"../Streak_1".play(str(test_streak%10))
	$"../LifeIndicator".play("life_"+str(Global.attempts))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
