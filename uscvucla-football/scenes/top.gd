extends Area2D

signal football_entered_outofbounds
signal receiver_entered_outofbounds


func _on_area_entered(area: Area2D) -> void:
	football_entered_outofbounds.emit()

func _on_body_entered(body: Node2D) -> void:
	receiver_entered_outofbounds.emit()
