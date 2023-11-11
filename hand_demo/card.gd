extends ColorRect


func init(color: Color) -> void:
	self.color = color

func _get_drag_data(at_position: Vector2) -> Variant:
	var preview = self.duplicate()
	preview.color.a = 0.7
	set_drag_preview(preview)
	visible = false
	return self
