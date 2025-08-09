extends Control

#var color : String = "Blue"
var game_started: bool = false

func _ready() -> void:
	SignalBus.start_test.connect(start)
	SignalBus.reset_test.connect(restart)

func start(truing):
	game_started = true

func restart():
	game_started = false

func _on_button_pressed() -> void:
	SignalBus.yes_clicked.emit()

func _on_button_2_pressed() -> void:
	SignalBus.no_clicked.emit()

func _physics_process(delta: float) -> void:
	if game_started:
		if Input.is_action_just_pressed("no"):
			SignalBus.no_clicked.emit()
		if Input.is_action_just_pressed("yes"):
			SignalBus.yes_clicked.emit()

#func _on_button_3_pressed() -> void:
	#color = "Yellow"
	#SignalBus.button_pressed.emit(color)
#
#func _on_button_4_pressed() -> void:
	#color = "Orange"
	#SignalBus.button_pressed.emit(color)
#
#func _on_button_5_pressed() -> void:
	#color = "Green"
	#SignalBus.button_pressed.emit(color)
#
#func _on_button_6_pressed() -> void:
	#color = "Purple"
	#SignalBus.button_pressed.emit(color)
