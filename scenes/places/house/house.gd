extends Node2D


onready var bgm : AudioStreamPlayer = $BGM

func _ready() -> void:
	bgm.play()
