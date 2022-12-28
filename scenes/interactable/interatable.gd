extends Area2D
class_name Interactable

var sprite: Sprite

var is_can_interact: bool = false
var shader = load("res://assets/shader/interaction.gdshader")

func _ready() -> void:
	sprite = get_node_or_null("Sprite")
	if sprite:
		shader_setup()
	
	if self.connect("mouse_entered", self, "_on_mouse_entered") != OK:
		printerr("mouse enter connection lost")
	if self.connect("mouse_exited", self, "_on_mouse_exited") != OK:
		printerr("mouse exit connection lost")
	

func toggle_can_interact(is_interact:bool) -> void:
	is_can_interact = is_interact

func shader_setup() -> void:
	# setup shader on sprite
	var shader_material = ShaderMaterial.new()
	shader_material.shader = shader
	sprite.material = shader_material

func sprite_interact_activate(is_active:bool) -> void:
	if sprite:
		sprite.material.set("shader_param/activate", is_active)
		sprite.modulate = Color(0.5, 0.5, 0.5) if is_active else Color(1, 1, 1)
	

func _on_mouse_entered() -> void:
	toggle_can_interact(true)
	sprite_interact_activate(true)

func _on_mouse_exited() -> void:
	toggle_can_interact(false)
	sprite_interact_activate(false)
