extends Control

@onready var point_light_2d = $PointLight2D
@onready var incorrect_code_timer = $IncorrectCodeTimer

var numpadDigits = [1,2,3,4,5,6,7,8,9]

var enteredDigits = [] #empty array
const MAX_ENTERED_DIGITS : int = 4

const profanityCode = [1,2,3,4]
const romanceCode = [9,7,3,5]
const medicineCode = [6,2,3,7]
const magicCode = [6,6,6,6]
const dolphinCode = [1,5,6,2]
var allValidCodes = [profanityCode, romanceCode, medicineCode, magicCode, dolphinCode]
var currentValidCodes = []

const light_color_red : Color = Color(230, 0, 0, 255)
const light_color_white : Color = Color(230, 230, 230, 255)
const light_color_green : Color = Color(0, 200, 0, 255)

var last_scanned_book : Book
var scanner_awaiting_book_input : bool = false
var confirm_button_can_be_pressed : bool = false

func _ready():
	point_light_2d.set_color(light_color_white)
	currentValidCodes = allValidCodes
	incorrect_code_timer.timeout.connect(_on_incorrect_timer_timeout)
	
func _on_incorrect_timer_timeout():
	point_light_2d.set_color(light_color_white)
	enteredDigits.clear()
	pass

func _process(_delta):
	#if enteredDigits.size() < MAX_ENTERED_DIGITS:
		#point_light_2d.set_color(light_color_white)
	#
	pass

func add_to_entered_digits(number_to_enter : int):
	if enteredDigits.size() < MAX_ENTERED_DIGITS:
		enteredDigits.push_back(number_to_enter)
	if enteredDigits.size() == MAX_ENTERED_DIGITS:
		confirm_button_can_be_pressed = true
	#print(enteredDigits)

func check_code_validity():
	for n in currentValidCodes:
		if n == enteredDigits:
			print("a valid code entered")
			point_light_2d.set_color(light_color_green)
			scanner_awaiting_book_input = true
			break
		else:
			point_light_2d.set_color(light_color_red)
			incorrect_code_timer.start()
			
#On book scanned
func _on_area_2d_area_entered(area):
	if scanner_awaiting_book_input:
		if area.name == "BookArea2D":
			print("book registered")
			var is_book_containing_banned_material = false
			last_scanned_book = area.get_owner()
			for n in currentValidCodes:
				if n == last_scanned_book.code:
					is_book_containing_banned_material = true
					break
			
			if is_book_containing_banned_material:
				print("book contains banned material..!")
			else:
				print("book is clear from banned material")
			enteredDigits.clear()
			scanner_awaiting_book_input = false
			
	else:
		print("no valid code entered..")

#region buttons
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
#endregion buttons


func _on_confirm_button_button_up():
	if confirm_button_can_be_pressed:
		check_code_validity()
		confirm_button_can_be_pressed = false
