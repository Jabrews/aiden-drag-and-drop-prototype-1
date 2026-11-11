extends Control

# components
@onready var item_label : Label = $ItemLabel
@onready var handle_dropped : Node = $HandleDropped
@onready var detect_rect : ColorRect = $DetectRect

var loaded_test_object : TestObject 
var mouse_offset : Vector2 = Vector2(-30, -30)

func _process(_delta: float) -> void:
	# make drag item follow mouse
	global_position = (get_global_mouse_position() + mouse_offset)

# handle init
func _start(test_object : TestObject) :
	
	if not test_object : 	
		push_error('attempted to create drag item, with no test object')
		return
	
	loaded_test_object = test_object
	item_label.text = test_object.text
	

func _drop() :
	handle_dropped._handle()
	
	queue_free()
	
	
