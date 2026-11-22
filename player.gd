extends CharacterBody2D

var watch_count = 0
var dialogue_scene = preload("res://intro_dialogue.tscn")

func _ready():
	# 1. Freeze this player's movement
	set_physics_process(false)
	
	# 2. Spawn the intro dialogue
	var dialogue = dialogue_scene.instantiate()
	add_child(dialogue)
	
	# 3. Unfreeze when the dialogue ends
	dialogue.dialogue_finished.connect(_on_dialogue_finished)

func _on_dialogue_finished():
	set_physics_process(true)

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 200
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


func _on_bucket_button_pressed() -> void:
	get_tree().change_scene_to_file("res://bucket_scene.tscn")


func _on_riddle_book_pressed() -> void:
	get_tree().change_scene_to_file("res://riddles_scene.tscn")
