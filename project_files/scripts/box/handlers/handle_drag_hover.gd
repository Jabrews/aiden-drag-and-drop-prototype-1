extends Node

# Displays the outside drag border when a drag item's
# detection center overlaps this object's detection area

# components
@onready var parent_box : Control = $".."
@onready var outside_drag_border: TextureRect = $"../Borders/OutsideDragBorder"
@onready var drag_item_parent_node: Node = $"../../../DragItemsParent"
@onready var detect_rect: Control = $"../DetectRect"


# although this code exist within process, its extremly low performance 
func _process(_delta: float) -> void:
	outside_drag_border.visible = _is_drag_item_hovering()

func _is_drag_item_hovering() -> bool:
	
	# this object existing indicates tis object already exist.
	# just return, no re-dropping data
	if parent_box.loaded_test_object :
		return false
	
	var target_rect: Rect2 = detect_rect.get_global_rect()

	for child in drag_item_parent_node.get_children():
		if not child is Control:
			continue

		var drag_rect: Rect2 = child.detect_rect.get_global_rect()
		var drag_center: Vector2 = drag_rect.get_center()

		if target_rect.has_point(drag_center):
			return true

	return false
