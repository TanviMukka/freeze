extends CanvasLayer

signal dialogue_finished #tells when to unfreeze the player's movement

@onready var name_label = $Panel/MarginContainer/VBoxContainer/NameLabel
@onready var text_label = $Panel/MarginContainer/VBoxContainer/TextLabel

var dialogue_lines = [
	{"name": "Narrator", "text": "..."},
	{"name": "Book", "text": "..."},
	{"name": "Narrator", "text": "..."}
]

var current_index = 0

func _ready():
	show_line()

func show_line():
	if current_index < dialogue_lines.size():
		name_label.text = dialogue_lines[current_index]["name"]
		text_label.text = dialogue_lines[current_index]["text"]
	else:
		GlobalTimer.start_timer()
		dialogue_finished.emit()
		queue_free()

func _input(event):
	if event.is_action_pressed("advance_dialogue"):
		current_index += 1
		show_line()
		get_viewport().set_input_as_handled()

func _process(delta: float) -> void:
	pass
