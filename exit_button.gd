extends TextureButton


func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")


func _on_instructions_button_pressed() -> void:
	$"../InstructionsText".visible = not $"../InstructionsText".visible
