extends Node

@export var countdown: bool = true
@export var start_seconds: float = 120.0
@export_file("*.tscn") var end_screen_scene: String = "res://lose_screen.tscn"

var elapsed: float = 0.0
var timer_active: bool = false
var _finished: bool = false
var _initialized: bool = false
var display_label: Label = null

func _ready() -> void:
	if not _initialized:
		elapsed = start_seconds if countdown else 0.0
		_initialized = true
	_push_label_text()

func start_timer() -> void:
	if _finished:
		return
	timer_active = true

func register_label(label: Label) -> void:
	display_label = label
	_push_label_text()

func _process(delta: float) -> void:
	if not timer_active or _finished:
		return

	if countdown:
		elapsed = max(0.0, elapsed - delta)
		_push_label_text()
		if elapsed <= 0.0:
			_on_timer_finished()
	else:
		elapsed += delta
		_push_label_text()

func _on_timer_finished() -> void:
	_finished = true
	timer_active = false
	if end_screen_scene != "" and ResourceLoader.exists(end_screen_scene):
		get_tree().change_scene_to_file(end_screen_scene)
	else:
		push_warning("End screen scene not found: " + end_screen_scene)

func _push_label_text() -> void:
	if display_label == null or not is_instance_valid(display_label):
		return
	var total_seconds := int(elapsed)
	var minutes := total_seconds / 60
	var seconds := total_seconds % 60
	display_label.text = "%02d:%02d" % [minutes, seconds]
