extends CharacterBody2D

var watch_count = 0

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()


func _on_pickup_area_area_entered(area: Area2D) -> void:
	#if area.is_in_group("Pocket Watch") and not $"Held Pocket Watch".visible:
	#	area.queue_free()
	#	$"Held Pocket Watch".visible = true
		
	if area.is_in_group("Igloo") and $"Held Pocket Watch".visible:
		$"Held Pocket Watch".visible = false
		watch_count += 1
		$CanvasLayer/"Watch Count Display".text = "Pocket Watches: " + str(watch_count)


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://desk_scene.tscn")


func _on_safe_button_pressed() -> void:
	get_tree().change_scene_to_file("res://safe_scene.tscn")


func _on_fridge_button_pressed() -> void:
	get_tree().change_scene_to_file("res://fridge_scene.tscn")
