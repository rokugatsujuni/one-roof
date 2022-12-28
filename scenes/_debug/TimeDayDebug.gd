extends HBoxContainer


var timeday := load("res://scenes/timeday/timeday.tres")
onready var hours : SpinBox = $Hours
 
func _ready() -> void:
	hours.value = timeday.hours


func _on_Hours_value_changed(value: float) -> void:
	timeday.hours = int(value)


func _on_Button_pressed() -> void:
	timeday.hours = int(hours.value)
