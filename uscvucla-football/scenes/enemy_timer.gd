extends Timer

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	wait_time = rng.randf_range(0.6, 1.0)
	print("Rush in: ", wait_time, " sec")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
