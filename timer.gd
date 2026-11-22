extends CanvasLayer

@onready var timer_label: Label = $TimerPanel/TimerLabel

func _ready() -> void:
	GlobalTimer.register_label(timer_label)
