extends Button

func _on_pressed() -> void:
	$"../Book1Number".visible = not $"../Book1Number".visible
