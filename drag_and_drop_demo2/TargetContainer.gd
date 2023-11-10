extends Panel

signal item_dropped_on_target(draggable)
var draggable := preload("res://drag_and_drop_demo2/Draggable.tscn")

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	var can_drop: bool = data is Node and data.is_in_group("draggable")
	print("[TargetContainer] _can_drop_data has run, return %s." % can_drop)
	return can_drop
	
func _drop_data(at_position: Vector2, data: Variant) -> void:
	print("[TargetContainer] _drop_data has run.")
	print("[TargetContainer] Emitting signal: item_dropped_on_target.")
	
	var draggable_copy = draggable.instantiate()
	draggable_copy.id = data.id
	draggable_copy.label = data.label
	draggable_copy.dropped_on_target = true
	$Padding/Row.add_child(draggable_copy)
	item_dropped_on_target.emit(data)
