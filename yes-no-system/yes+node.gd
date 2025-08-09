extends Control

func _on_button_yes_pressed() -> void:
	SignalBus.yes_clicked.emit()

func _on_button_no_pressed() -> void:
	SignalBus.no_clicked.emit()
