extends CanvasLayer

@export var countdown: bool = false
@export var start_seconds: float = 90.0

@onready var timer_label: Label = $TimerPanel/TimerLabel

var elapsed: float = 0.0

func _ready() -> void:
	elapsed = start_seconds if countdown else 0.0
	_update_label(elapsed)

func _process(delta: float) -> void:
	if countdown:
		elapsed = max(0.0, elapsed - delta)
	else:
		elapsed += delta
	_update_label(elapsed)

func _update_label(value: float) -> void:
	var total_seconds := int(value)
	var minutes := total_seconds / 60
	var seconds := total_seconds % 60
	timer_label.text = "%02d:%02d" % [minutes, seconds]
