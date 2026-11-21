extends TextureButton

func _on_pressed() -> void:
	$"../InstructionsText".visible = not $"../InstructionsText".visible

func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
