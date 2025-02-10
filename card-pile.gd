class_name CardPile
extends Area2D

var hovered:bool = false
var grabbed:bool = false
var grab_offset:Vector2 = Vector2(0, 0)
var tick := 0
@onready var card_list: Node2D = $CardList
@onready var sprite_2d: Sprite2D = $Sprite2D
const card_back = preload("res://textures/back.tres")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if hovered and Input.is_action_just_pressed('left_click'):
		var top_card = card_list.get_child(0)
		if top_card is Card:
			top_card.reparent(get_parent())
			top_card.hovered = true
			top_card._grab()
			var next_card = card_list.get_child(0)
			if next_card is Card:
				sprite_2d.texture = next_card.sprite_2d.texture
			else:
				sprite_2d.texture = card_back
				
	if grabbed:
		position = get_viewport().get_mouse_position().floor() + grab_offset
		if Input.is_action_just_released('left_click'):
			grabbed = false

func _grab() -> void:
	grabbed = true
	grab_offset = position - get_viewport().get_mouse_position().floor()
	
	
func add_card(card) -> void:
	card.reparent(card_list)
	card_list.move_child(card, 0)
	sprite_2d.texture = card.sprite_2d.texture


func _on_mouse_entered() -> void:
	hovered = true


func _on_mouse_exited() -> void:
	hovered = false


func _on_area_entered(area: Area2D) -> void:
	pass
