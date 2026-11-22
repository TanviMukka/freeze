extends Button

func _on_pressed() -> void:
	$"../Book3Number".visible = not $"../Book3Number".visible
