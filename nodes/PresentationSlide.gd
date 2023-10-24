class_name PresentationSlide
extends Control

signal finished
signal started


@export var step := 0 # The current step this slide is on.
@export_range(1, 9999) var total_steps := 1


func _finish() -> void:
  emit_signal("finished")


func advance() -> void:
  step += 1
  if step == total_steps:
    _finish()


func finish() -> void:
  _finish()


func start() -> void:
  step = 0
