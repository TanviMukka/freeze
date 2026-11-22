extends Button

func _on_pressed() -> void:
	GlobalTimer.reset_timer(true)
	get_tree().change_scene_to_file("res://main.tscn")
