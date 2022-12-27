extends Control

const TIME_TEXT_FORMAT = "{hours} : {minutes}"

onready var label : Label = $Label

var timeday: Resource = load("res://scenes/timeday/timeday.tres")

func _ready() -> void:
	update_display()
	timeday.connect("minute_changed", self, "update_display")

func update_display() -> void:
	var text = TIME_TEXT_FORMAT.format({"hours": "%02d" % timeday.hours , "minutes": "%02d" % timeday.minutes})
	label.text = text

