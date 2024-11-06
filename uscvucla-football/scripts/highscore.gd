extends Label

func _process(delta: float) -> void:
	self.text = "Your High Score is " + str(Global.highscore)
