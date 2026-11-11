extends Node

# box components
# NOTICE, had to add to scene tree and use edit local property to find file paths
@onready var box_1: Control = $"../../../BoxContainer/Box1"
@onready var box_2: Control = $"../../../BoxContainer/Box2"
@onready var box_3: Control = $"../../../BoxContainer/Box3"
# parent components
@onready var parent_drag_item : Control = $".."
@onready var detect_rect : ColorRect = $"../DetectRect"

var drop_accept_radius: float = 20.0

func _handle() :
	
	# get loaded test object
	# SHOULD ALWAYS HAVE BY NOW
	var loaded_test_object = parent_drag_item.loaded_test_object 
	
	# get vector representation of detect rect
	var drag_rect: Rect2 = detect_rect.get_global_rect()
	
	# box 1
	if drag_rect.intersects(
		_get_increased_rect(box_1.detect_rect, drop_accept_radius)
	):
		box_1._recieve_test_object(loaded_test_object)

	# box 2
	elif drag_rect.intersects(
		_get_increased_rect(box_2.detect_rect, drop_accept_radius)
	):
		box_2._recieve_test_object(loaded_test_object)
		
	# box 3
	elif drag_rect.intersects(
		_get_increased_rect(box_3.detect_rect, drop_accept_radius)
	):
		box_3._recieve_test_object(loaded_test_object)



func _get_increased_rect(control: Control, radius: float) -> Rect2:
	var global_rect: Rect2 = control.get_global_rect()
	return global_rect.grow(radius)
