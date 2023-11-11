extends TextureRect

@onready var Card := preload("res://hand_demo/card.tscn")
@onready var hand_zone = $HandZone/HBoxContainer

var MAX_HAND = 6

func new_card() -> ColorRect:
	var card = ColorRect.new()
	card.custom_minimum_size = Vector2(100, 140)
	card.color = Color.WHITE
	return card

func _on_add_card_button_pressed() -> void:
	if len(hand_zone.get_children()) == MAX_HAND:
		return
	var new_card = Card.instantiate()
	new_card.init(Color(randf(), randf(), randf(), 1))
	hand_zone.add_child(new_card)


func _on_remove_front_button_pressed() -> void:
	var cards = hand_zone.get_children()
	if len(cards) > 0:
		cards[0].queue_free()
		
func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	var cards = hand_zone.get_children()
	for card in cards:
		if card.get_instance_id() == data.get_instance_id():
			card.queue_free()
			break
