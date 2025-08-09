extends Node2D

var test_started : bool = false

func _ready() -> void:
	SignalBus.start_test.connect(start_test)

func start_test(type):
	test_started = true


func _physics_process(delta: float) -> void:
	if test_started:
		$Main.visible = true
		$TitleScreen.visible = false
	else:
		$Main.visible = false
		$TitleScreen.visible = true
	if Input.is_action_just_pressed("reset"):
		test_started = false
		SignalBus.reset_test.emit()
