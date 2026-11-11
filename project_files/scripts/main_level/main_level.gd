extends Node

# components
@onready var box_1 : Control = $BoxContainer/Box1

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	# start first box with loaded data
	box_1._recieve_test_object(
		TestObject.new('bannana') # create TestObject object
	)
	
