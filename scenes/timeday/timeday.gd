extends Resource

signal hours_changed
signal minute_changed

const DAYS_PER_WEEK = 7
const HOURS_PER_DAY = 24
const MINUTES_PER_HOUR = 60

# test gameplay 24 minutes per day.


var hours: int = 1 setget set_hours
var minutes: int = 0 setget set_minutes

func set_hours(value: int) -> void:
	hours = wrapi(value, 0, HOURS_PER_DAY )
	emit_signal("hours_changed")

func set_minutes(value: int) -> void:
	minutes = wrapi(value, 0, MINUTES_PER_HOUR )
	emit_signal("minute_changed")


func add_time_one_minute():
	if minutes + 1 == MINUTES_PER_HOUR:
		self.hours += 1
	
	self.minutes += 1
