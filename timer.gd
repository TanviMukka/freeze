extends CanvasLayer

@export var countdown: bool = true
@export var start_seconds: float = 60.0
@export_file("*.tscn") var end_screen_scene: String = "res://lose_screen.tscn"

@onready var timer_label: Label = $TimerPanel/TimerLabel

var elapsed: float = 0.0
var _finished: bool = false

func _ready() -> void:
	elapsed = start_seconds if countdown else 0.0
	_update_label(elapsed)

func _process(delta: float) -> void:
	if _finished:
		return

	if countdown:
		elapsed = max(0.0, elapsed - delta)
		_update_label(elapsed)
		if elapsed <= 0.0:
			_on_timer_finished()
	else:
		elapsed += delta
		_update_label(elapsed)

func _on_timer_finished() -> void:
	_finished = true
	if end_screen_scene != "" and ResourceLoader.exists(end_screen_scene):
		get_tree().change_scene_to_file(end_screen_scene)
	else:
		push_warning("End screen scene not found: " + end_screen_scene)

func _update_label(value: float) -> void:
	var total_seconds := int(value)
	var minutes := total_seconds / 60
	var seconds := total_seconds % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]
