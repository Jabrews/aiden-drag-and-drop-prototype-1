extends Node

# components
@onready var inside_active_border : TextureRect = $Borders/InsideActiveBorder
@onready var item_label : Label = $ItemLabel
@onready var detect_rect : ColorRect = $DetectRect

var loaded_test_object: TestObject = null

func _ready() -> void:
	BoxSignalBus.connect("clear_all_boxes", _clear)

func _recieve_test_object(new_object: TestObject) -> void:
	
	# FIRST
	# reset all objects including itself
	BoxSignalBus.emit_signal('clear_all_boxes')	
	
	# THEN load new object
	loaded_test_object = new_object
	item_label.text = 	new_object.text
	inside_active_border.visible = true

func _clear() -> void:
	loaded_test_object = null
	item_label.text = ''	
	inside_active_border.visible = false
	
