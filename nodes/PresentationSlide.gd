class_name PresentationSlide
extends Control

signal finished
signal finish_reversed
signal started


@export var step := 0 # The current step this slide is on.
@export_range(1, 9999) var total_steps := 1


func _finish() -> void:
  emit_signal("finished")


func _finish_reverse() -> void:
  emit_signal("finish_reversed")


func finish() -> void:
  _finish()


func next() -> void:
  if step < total_steps - 1:
    step += 1
    return
  
  step += 1
  _finish()
    
    
func previous() -> void:
  if step == 0:
    _finish_reverse()
    return
  step -= 1


func start() -> void:
  step = 0
