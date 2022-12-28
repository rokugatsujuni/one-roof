extends Node2D


onready var bgm : AudioStreamPlayer = $BGM

func _ready() -> void:
	bgm.play()
	if not OS.is_debug_build():
		$Debug.queue_free()
