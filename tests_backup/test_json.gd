extends Node

func _init():
	var result = JSON.parse_string('{"test": 1}')
	print("Result type: ", result.get_type())
	print("Result: ", result)
	if result is Dictionary and result.has("error"):
		print("Has error key")
	else:
		print("Direct result (success)")

	var result2 = JSON.parse_string('invalid json')
	print("Result2 type: ", result2.get_type())
	print("Result2: ", result2)
	if result2 is Dictionary and result2.has("error"):
		print("Has error key")
	else:
		print("Direct result (success)")
	get_tree().quit()