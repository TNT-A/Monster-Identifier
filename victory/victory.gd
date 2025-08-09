extends Node2D

func fade_in():
	$Paint.visible = true
	$AnimationPlayer.play("fade_in")

func _ready() -> void:
	$Paint.visible = false

func reset():
	$Paint.visible = false
	$AnimationPlayer.play("RESET")
