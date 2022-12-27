extends Node2D


export var timeday: Resource

func _ready() -> void:
	pass # Replace with function body.


func _on_Timer_timeout() -> void:
	timeday.add_time_one_minute()
	# add time
	pass # Replace with function body.
