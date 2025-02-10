class_name Card
extends Area2D
const _1 = preload("res://textures/1.tres")
var card_list:Array = []
var hovered:bool = false
var grabbed:bool = false
var grab_offset:Vector2 = Vector2(0, 0)
var tick := 0
var hovered_card_pile:CardPile = null
@onready var sprite_2d: Sprite2D = $Sprite2D
var test_textures:= [preload("res://textures/0.tres"),
preload("res://textures/1.tres"),
preload("res://textures/2.tres"),
preload("res://textures/3.tres"),
preload("res://textures/4.tres") ]

func _ready() -> void:
	sprite_2d.texture = test_textures.pick_random()

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
	if hovered_card_pile:
		hovered_card_pile.add_card(self)
		self.position = Vector2(0,0)

func _on_mouse_entered() -> void:
	hovered = true


func _on_mouse_exited() -> void:
	hovered = false


func _on_area_entered(area: Area2D) -> void:
	if area is CardPile:
		hovered_card_pile = area


func _on_area_exited(area: Area2D) -> void:
	hovered_card_pile = null
