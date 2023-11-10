extends ColorRect

func _ready() -> void:
	add_to_group("draggable")

func _get_drag_data(at_position: Vector2) -> Variant:
	print("[Draggable] _get_drag_data has run.")
	return self

