extends Button

func _on_pressed() -> void:
	$"../Book2Number".visible = not $"../Book2Number".visible
