extends Control

var numpadDigits = [1,2,3,4,5,6,7,8,9]

var enteredDigits = [] #empty array
const MAX_ENTERED_DIGITS : int = 4

func add_to_entered_digits(number_to_enter : int):
	if enteredDigits.size() < MAX_ENTERED_DIGITS:
		enteredDigits.push_back(number_to_enter)
	
	print(enteredDigits)

func _on_button_button_up():
	add_to_entered_digits(1)
	pass # Replace with function body.

func _on_button_2_button_up():
	add_to_entered_digits(2)
	pass # Replace with function body.
	
func _on_button_3_button_up():
	add_to_entered_digits(3)
	pass # Replace with function body.

func _on_button_4_button_up():
	add_to_entered_digits(4)
	pass # Replace with function body.

func _on_button_5_button_up():
	add_to_entered_digits(5)
	pass # Replace with function body.

func _on_button_6_button_up():
	add_to_entered_digits(6)
	pass # Replace with function body.

func _on_button_7_button_up():
	add_to_entered_digits(7)
	pass # Replace with function body.

func _on_button_8_button_up():
	add_to_entered_digits(8)
	pass # Replace with function body.

func _on_button_9_button_up():
	add_to_entered_digits(9)
	pass # Replace with function body.
