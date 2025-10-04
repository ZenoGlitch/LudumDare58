extends Control

@onready var point_light_2d = $PointLight2D
@onready var incorrect_code_timer = $IncorrectCodeTimer
@onready var report_spawn_point = $ReportSpawnPoint

var enteredDigits = []
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
var book_on_scanner : bool = false

var report = preload("res://Scenes/report_paper.tscn")

func _ready():
	point_light_2d.set_color(light_color_white)
	currentValidCodes = allValidCodes
	incorrect_code_timer.timeout.connect(_on_incorrect_timer_timeout)
	
func _on_incorrect_timer_timeout():
	point_light_2d.set_color(light_color_white)
	enteredDigits.clear()

func _process(_delta):
	#if enteredDigits.size() < MAX_ENTERED_DIGITS:
		#point_light_2d.set_color(light_color_white)
	#
	pass

func add_to_entered_digits(number_to_enter : int):
	if book_on_scanner:
		if enteredDigits.size() < MAX_ENTERED_DIGITS:
			enteredDigits.push_back(number_to_enter)
		if enteredDigits.size() == MAX_ENTERED_DIGITS:
			confirm_button_can_be_pressed = true
		#print(enteredDigits)

func check_code_validity():
	#Checking if code is a valid code
	for n in currentValidCodes:
		if n == enteredDigits:
			print("a valid code entered")
			point_light_2d.set_color(light_color_green)
			check_if_book_code_matches()
			#scanner_awaiting_book_input = true
			break
		else:
			point_light_2d.set_color(light_color_red)
			incorrect_code_timer.start()
			print("invalid code entered")

func check_if_book_code_matches():
	#Checking if book has code
	var is_book_containing_banned_material = false
	for n in currentValidCodes:
		if n == last_scanned_book.code:
			is_book_containing_banned_material = true
			break
		
	if is_book_containing_banned_material:
		print("book contains banned material..!")
		#TODO: trigger printing of report here
		var instancedReport = report.instantiate()
		self.get_owner().add_child(instancedReport)
		

		var texture = load("res://Assets/IMG_6289.jpg")
		
		instancedReport.set_texture(texture)
		
		instancedReport.set_spawn_position(report_spawn_point.global_position)
		
	else:
		print("book is clear from banned material")
		#TODO: trigger printing of report here
		report.instantiate()
		#report.set_texture()
		report.set_position()
		
		enteredDigits.clear()
		#scanner_awaiting_book_input = false


func _on_area_2d_area_entered(area):
	#Check if colliding area belongs to book and act appropriately 
	if area.name == "BookArea2D":
		print("book registered")
		last_scanned_book = area.get_owner()
		book_on_scanner = true
		
func _on_area_2d_area_exited(area):
	if area.name == "BookArea2D":
		#last_scanned_book = null
		book_on_scanner = false

#region buttons
func _on_button_button_up():
	if book_on_scanner:
		add_to_entered_digits(1)

func _on_button_2_button_up():
	if book_on_scanner:
		add_to_entered_digits(2)
	
func _on_button_3_button_up():
	if book_on_scanner:
		add_to_entered_digits(3)

func _on_button_4_button_up():
	if book_on_scanner:
		add_to_entered_digits(4)

func _on_button_5_button_up():
	if book_on_scanner:
		add_to_entered_digits(5)
	
func _on_button_6_button_up():
	if book_on_scanner:
		add_to_entered_digits(6)

func _on_button_7_button_up():
	if book_on_scanner:
		add_to_entered_digits(7)

func _on_button_8_button_up():
	if book_on_scanner:
		add_to_entered_digits(8)
	
func _on_button_9_button_up():
	if book_on_scanner:
		add_to_entered_digits(9)
#endregion buttons


func _on_confirm_button_button_up():
	if confirm_button_can_be_pressed:
		check_code_validity()
		confirm_button_can_be_pressed = false
