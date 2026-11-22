extends Button

func _on_pressed() -> void:
	$"../Book4Number".visible = not $"../Book4Number".visible
