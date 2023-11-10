extends ColorRect
class_name Draggable

var id: int
var label: String
var dropped_on_target: bool = false

func _ready() -> void:
	add_to_group("draggable")
	$Label.text = label

func _get_drag_data(at_position: Vector2) -> Variant:
	print("[Draggable] _get_drag_data has run.")
	if not dropped_on_target:
		set_drag_preview(_get_preview_control())
		return self
	return null

func _get_preview_control() -> Control:
	print("[Draggable] _get_preview_control has run.")
	var preview = duplicate()
	preview.id = id
	preview.label = label
	preview.color.a = 0.5
	preview.set_rotation(.1)
	return preview
	
func _on_item_dropped_on_target(draggable: Draggable) -> void:
	print("[Draggable] Signal item_dropped_on_target received.")

