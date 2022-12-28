extends Sprite



export(Resource) var background_data: Resource
var timeday: Resource = load("res://scenes/timeday/timeday.tres")

func _ready() -> void:
	timeday.connect("hour_changed", self, "change_background")
	change_background()

func change_background() -> void:
	match timeday.times:
		timeday.TIMES.MORNING:
			texture = background_data.morning_bg
		timeday.TIMES.EVENING:
			texture = background_data.evening_bg
		timeday.TIMES.AFTERNOON:
			texture = background_data.afternoon_bg
		timeday.TIMES.NIGHT:
			texture = background_data.night_bg
		timeday.TIMES.MID_NIGHT:
			texture = background_data.mid_night_bg
