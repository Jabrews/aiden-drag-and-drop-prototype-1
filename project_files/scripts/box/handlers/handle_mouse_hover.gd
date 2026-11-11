extends Node

# NOTE 
# this script is responsible for : 
	# hover visual
	# creating & dropping/deleting drag item. 

# components
@onready var parent_box : Control = $".."
@onready var detect_rect : ColorRect = $"../DetectRect"
@onready var outside_mouse_border : TextureRect = $"../Borders/OutsideMouseBorder"
# drag item creation components
@onready var drag_item_packed_scene : PackedScene = preload("res://project_files/scenes/drag_item.tscn")
@onready var drag_item_parent_node : Node = $"../../../DragItemsParent"

var hovered : bool = false
var drag_item_refrence : Control  

func _ready() -> void:
	detect_rect.connect('mouse_entered', _handle_mouse_entered)
	detect_rect.connect('mouse_exited', _handle_mouse_exited)

func _process(_delta: float) -> void:
	
	if not parent_box.loaded_test_object  :
		return
	
	if hovered: 
		if Input.is_action_just_pressed('left_mouse_btn') : 
			create_drag_item()
			
	if Input.is_action_just_released('left_mouse_btn') : 
		drop_drag_item()
			
		
## mouse handlers

func _handle_mouse_entered() :
	outside_mouse_border.visible = true
	hovered = true
	
func _handle_mouse_exited() :
	outside_mouse_border.visible = false 
	hovered = false

## drag item create/delete

func create_drag_item() :
	
	# make sure we cant re-create another drag item
	if drag_item_refrence : 
		return
	
	# create item, initalize data, add to parent node
	var drag_item_instance : Control = drag_item_packed_scene.instantiate()
	# add to tree 
	drag_item_parent_node.add_child(drag_item_instance)
	
	# initalize 
	var loaded_test_object = parent_box.loaded_test_object # NOTICE should 100% not be null
	drag_item_instance._start(loaded_test_object)
	
	# update local refrence 
	drag_item_refrence = drag_item_instance
	
	
	
func drop_drag_item() :
	
	# make sure item exist in order to be dropped
	if not drag_item_refrence : 	
		return
	
	# call drag item
	drag_item_refrence._drop()
	
	
	# update local refrence
	drag_item_refrence = null
	
