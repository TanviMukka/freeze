extends Node2D

@export var correct_code: String = "2709" # Secret code
@onready var display = $DisplayLabel

var current_input: String = ""

func _ready():
	display.text = ""
	for button in $GridContainer.get_children():
		if button is Button:
			button.pressed.connect(_on_button_pressed.bind(button.text))

func _on_button_pressed(key: String):
	if key == "Clear": 
		current_input = ""
		display.text = ""
	elif key == "Enter":
		check_code()
	else:
		if current_input.length() < correct_code.length():
			current_input += key
			display.text = current_input

func check_code():
	if current_input == correct_code:
		get_tree().change_scene_to_file("res://win_scene.tscn")
	else:
		display.text = "Wrong Code"
		current_input = ""


func _on_exit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
