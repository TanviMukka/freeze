extends CanvasLayer

signal dialogue_finished

@onready var name_label = %NameLabel
@onready var text_label = %TextLabel
# Update this path to match where your TextureRect is in your Scene tree
@onready var portrait_rect = %TextureRect 

# Map character names to their portrait images (replace with your actual file paths)
var character_portraits = {
	"Narrator": preload("res://pixel_art_large.png"),
	"Book": preload("res://pixelBook.png")
}

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
		var current_name = dialogue_lines[current_index]["name"]
		name_label.text = current_name
		text_label.text = dialogue_lines[current_index]["text"]
		
		# Swap the TextureRect based on who is speaking
		if character_portraits.has(current_name):
			portrait_rect.texture = character_portraits[current_name]
			portrait_rect.visible = true
		else:
			# Hide the portrait if the speaker doesn't have one
			portrait_rect.visible = false
	else:
		GlobalTimer.start_timer()
		dialogue_finished.emit()
		queue_free()

func _input(event):
	if event.is_action_pressed("advance_dialogue"):
		current_index += 1
		show_line()
		get_viewport().set_input_as_handled()
