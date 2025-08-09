extends Node2D

func _on_button_eye_pressed() -> void:
	open_main("Eyes")

func _on_button_monster_color_pressed() -> void:
	open_main("Colors")

var main = preload("res://main/main.tscn")
func open_main(test):
	SignalBus.start_test.emit(test)
