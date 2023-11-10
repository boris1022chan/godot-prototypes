extends Panel

@onready var draggable_scene := preload("res://demo2/Draggable.tscn")
@onready var draggable_container := $Padding/Row
@onready var drop_target := get_node("/root/PanelContainer/VBoxContainer/DragAndDropColumns/TargetContainer")


var draggables = [
	{"id": 1, "label": "item one"},
	{"id": 2, "label": "item two"},
	{"id": 3, "label": "item three"},
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	populate_draggables()

func populate_draggables() -> void:
	for draggable in draggables:
		var drag_item = draggable_scene.instantiate()
		drag_item.id = draggable["id"]
		drag_item.label = draggable["label"]
		draggable_container.add_child(drag_item)

func _on_target_container_item_dropped_on_target(draggable: Draggable) -> void:
	print("[SourceContainer] Signal item_dropped_on_target received.")
	for drag_item in draggable_container.get_children():
		drag_item = drag_item as Draggable
		if drag_item.id == draggable.id:
			draggable_container.remove_child(drag_item)
			drag_item.queue_free()
			break # Replace with function body.
