extends Node2D

var test_started : bool = false

func _ready() -> void:
	SignalBus.start_test.connect(start_test)

func start_test(type):
	test_started = true
	if test_started:
		$Main.visible = true
		$TitleScreen.visible = false
	else:
		$Main.visible = false
		$TitleScreen.visible = true
