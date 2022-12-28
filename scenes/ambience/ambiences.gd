extends Node2D

export(Gradient) var gradient: Gradient

var timeday = load("res://scenes/timeday/timeday.tres")

onready var canvas_module := $CanvasModulate
onready var light := $Light2D

onready var lights: Array = get_tree().get_nodes_in_group("lights")
var is_light_enable: bool = false

func _ready() -> void:
	timeday.connect("hour_changed", self, "_on_hour_changed")
	update_ambience()

func update_ambience():
	if gradient:
		var color := gradient.interpolate(float(timeday.hours) / 24.0)
		canvas_module.color = color
	if timeday.hours >= 17 or timeday.hours < 6:
		if not is_light_enable:
			for l in lights:
				l.enabled = true
			is_light_enable = true
	else:
		if is_light_enable:
			for l in lights:
				l.enabled = false
			is_light_enable = false
		

func _on_hour_changed() -> void:
	update_ambience()
