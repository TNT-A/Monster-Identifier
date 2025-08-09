extends Node2D

var sets : Dictionary = {
	"Color" = null,
	"Eyes" = null,
}

func _ready() -> void:
	SignalBus.yes_clicked.connect(done)
	SignalBus.no_clicked.connect(new)

func new():
	print("bro clicked no")

func done():
	print("bro clicked yes")
