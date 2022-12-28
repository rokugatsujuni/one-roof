extends Position2D


const MAX_ZOOM_IN : float = 0.5
const MAX_ZOOM_OUT : float = 1.5
const ZOOM_STEEP_CHANGE: float = 0.05

var zoom : float = 1.0 # default zoom

var drag_start_pos := Vector2.ZERO # capture mouse global position
var cam_start_pos := Vector2.ZERO # capture camera global position

var is_can_drag : bool = false

onready var camera: Camera2D = $Camera2D

func _ready() -> void:
	camera.current = true
	camera.zoom = Vector2(zoom, zoom)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == BUTTON_WHEEL_UP:
			camera_zoom_in()
		elif event.is_pressed() and event.button_index == BUTTON_WHEEL_DOWN:
			camera_zoom_out()
		elif event.is_action_pressed("secondary_action"):
			is_can_drag = true
			cam_start_pos = global_position
			drag_start_pos = get_viewport().get_mouse_position()
		elif event.is_action_released("secondary_action"):
			is_can_drag = false
			cam_start_pos = Vector2.ZERO
			drag_start_pos = Vector2.ZERO
	
	if event is InputEventMouseMotion and is_can_drag:
		move_camera()


func change_camera_zoom(_zoom) -> void:
	camera.zoom = Vector2(_zoom, _zoom)


func camera_zoom_in() -> void:
	zoom -= ZOOM_STEEP_CHANGE
	zoom = clamp(zoom, MAX_ZOOM_IN, MAX_ZOOM_OUT)
	change_camera_zoom(zoom)


func camera_zoom_out() -> void:
	zoom += ZOOM_STEEP_CHANGE
	zoom = clamp(zoom, MAX_ZOOM_IN, MAX_ZOOM_OUT)
	change_camera_zoom(zoom)


func move_camera() -> void:
	var diff = get_viewport().get_mouse_position() - drag_start_pos
	global_position = cam_start_pos + diff
