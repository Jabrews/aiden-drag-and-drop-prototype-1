extends Node
class_name TestObject

var text: String

func _init(new_text: String = "") -> void:
	text = new_text

func _print_info() -> void:
	print("### test object ####")
	print("text : ", text)
	print("####################")
