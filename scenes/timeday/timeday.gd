extends Resource

signal hour_changed
signal minute_changed

const DAYS_PER_WEEK = 7
const HOURS_PER_DAY = 24
const MINUTES_PER_HOUR = 60

enum TIMES {MID_NIGHT=0, MORNING=6, EVENING=12, AFTERNOON=15, NIGHT=18}

# test gameplay 24 minutes per day.


var hours: int = 6 setget set_hours
var minutes: int = 0 setget set_minutes
var times = TIMES.MORNING


func set_hours(value: int) -> void:
	hours = wrapi(value, 0, HOURS_PER_DAY )

	if hours >= TIMES.MID_NIGHT and hours < TIMES.MORNING:
		times = TIMES.MID_NIGHT
	elif hours >= TIMES.MORNING and hours < TIMES.EVENING:
		times = TIMES.MORNING
	elif hours >= TIMES.EVENING and hours < TIMES.AFTERNOON:
		times = TIMES.EVENING
	elif hours >= TIMES.AFTERNOON and hours < TIMES.NIGHT:
		times = TIMES.AFTERNOON
	elif hours >= TIMES.NIGHT:
		times = TIMES.NIGHT
	
	emit_signal("hour_changed")

func set_minutes(value: int) -> void:
	minutes = wrapi(value, 0, MINUTES_PER_HOUR )
	emit_signal("minute_changed")


func add_time_one_minute():
	if minutes + 1 == MINUTES_PER_HOUR:
		self.hours += 1
	
	self.minutes += 1
