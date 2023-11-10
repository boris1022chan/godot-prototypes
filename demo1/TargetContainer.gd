extends Panel

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("draggable")
	print("[TargetContainer] _can_drop_data has run, return %s." % can_drop)
	return can_drop
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("[TargetContainer] _drop_data has run.")
