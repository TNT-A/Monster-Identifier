extends Node2D

var test_started : bool = false
var can_play : bool = false
var val : int = 0

var sets : Dictionary = {
	"Colors" = preload("res://question_set_resources/resources/Colors.tres"),
	"Eyes" = preload("res://question_set_resources/resources/Eyes.tres"),
}

var resource : Resource
var test_list : Array

#var prompt_list : Array
#var answer_list : Array

func _ready() -> void:
	SignalBus.start_test.connect(start_test)
	SignalBus.yes_clicked.connect(done)
	SignalBus.no_clicked.connect(reroll)
	SignalBus.reset_test.connect(reset)

func reset():
	var rand_hsv = randf_range(0.0, 1)
	var saturation = randf() * 0.5 + 0.5
	var value = randf() * 0.5 + 0.5
	var new_color = Color.from_hsv(rand_hsv, saturation, value, 90)
	box.color = new_color
	$AnimationPlayer.play("RESET")
	$Victory.reset()

var box
func start_test(type):
	can_play = true
	print(type)
	if !test_started:
		#test_started = true
		resource = sets[type]
		print($RoundName)
		#$RoundName/Icon.texture = resource.icon_symbol
		$RoundName/CenterContainer/VBoxContainer/Name.text = resource.icon_text
		box = $RoundName/CenterContainer/VBoxContainer/ColorRect
		test_list = resource.test_list
		#prompt_list = resource.prompt_list
		#answer_list = resource.answer_list
		print("Oh yea!")

func done():
	print("Got it right!!!!!")
	can_play = false
	$AnimationPlayer.play("fade_win")
	get_tree().create_timer(.2)
	if current_color != null:
		$Victory/ColorRect.color = current_color
	$Victory.fade_in()

var current_color
func reroll():
	var rand_hsv = randf_range(0.0, 1)
	var saturation = randf() * 0.5 + 0.5
	var value = randf() * 0.5 + 0.5
	var new_color = Color.from_hsv(rand_hsv, saturation, value, 90)
	if can_play:
		current_color = new_color
		box.color = new_color
		print("rerolling...", rand_hsv)

func check_win(color_guess):
	pass
	#if answer_list[val] == color_guess:
		#print("true...", color_guess)
	#else:
		#print("WRONG L BOZO")

func set_image():
	pass
