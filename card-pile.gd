extends Area2D

var hovered:bool = false
var grabbed:bool = false
var offset:Vector2 = Vector2(0, 0)
var tick := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tick += 1
	if hovered and Input.is_action_just_pressed('left_click'):
		_grab()
		print(offset)
	if grabbed:
		position = get_viewport().get_mouse_position().floor() + offset
		if Input.is_action_just_released('left_click'):
			grabbed = false

func _grab() -> void:
	grabbed = true
	offset = position - get_viewport().get_mouse_position().floor()


func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false
