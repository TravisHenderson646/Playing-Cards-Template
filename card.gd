extends Sprite2D

var card_list:Array = []
var hovered:bool = false
var grabbed:bool = false
var grab_offset:Vector2 = Vector2(0, 0)
var tick := 0
var area_entered:Area2D = null

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if hovered and Input.is_action_just_pressed('left_click'):
		_grab()
	if grabbed:
		position = get_viewport().get_mouse_position().floor() + grab_offset
		if Input.is_action_just_released('left_click'):
			grabbed = false
			_release()

func _grab() -> void:
	grabbed = true
	grab_offset = position - get_viewport().get_mouse_position().floor()


func _release() -> void:
	if area_entered:
		area_entered.test()
	

func _on_area_2d_mouse_entered() -> void:
	hovered = true

func _on_area_2d_mouse_exited() -> void:
	hovered = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	area_entered = area


func _on_area_2d_area_exited(area: Area2D) -> void:
	area_entered = null
