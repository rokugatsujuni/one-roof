extends Node2D

const CLOCK_TIME : float = 1.0

var clock_time = 1

export var timeday: Resource

onready var clock_timer: Timer = $Timer

func _ready() -> void:
	clock_time = CLOCK_TIME
	if OS.is_debug_build():
		clock_time = 0.3
	clock_timer.wait_time = clock_time
	
	start_time()

func start_time() -> void:
	clock_timer.start()

func _on_Timer_timeout() -> void:
	timeday.add_time_one_minute()

