extends Node2D

var test_started : bool = false
var val : int = 0

var sets : Dictionary = {
	"Colors" = preload("res://question_set_resources/resources/Colors.tres"),
	"Eyes" = preload("res://question_set_resources/resources/Eyes.tres"),
}

var resource : Resource
var prompt_list : Array
var answer_list : Array

func _ready() -> void:
	SignalBus.start_test.connect(start_test)
	SignalBus.button_pressed.connect(check_win)

func start_test(type):
	print(type)
	if !test_started:
		resource = sets[type]
		print(resource)
		$RoundName.icon_img.texture = resource.icon_symbol
		$RoundName.icon_name.text = resource.icon_text
		prompt_list = resource.prompt_list
		answer_list = resource.answer_list
		print("Oh yea!")

func check_win(color_guess):
	if answer_list[val] == color_guess:
		print("true...", color_guess)
	else:
		print("WRONG L BOZO")

func set_image():
	pass
