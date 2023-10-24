class_name Presentation
extends Control

signal finished


@export var slides: Array[PresentationSlide] : get = _get_slides

var currentSlide : PresentationSlide


func _ready() -> void:
  for slideNode in self.slides:
    slideNode.hide()


func _on_SlideNode_finished() -> void:
  _deactivate_slide(currentSlide)
  if currentSlide.get_index() == self.slides.size() - 1:
    _finish()
    return
  currentSlide = self.slides[currentSlide.get_index() + 1]
  _activate_slide(currentSlide)


func _get_slides() -> Array:
  return get_children()


func _activate_slide(slideNode: PresentationSlide) -> void:
  slideNode.finished.connect(_on_SlideNode_finished)
  slideNode.show()


func _deactivate_slide(slideNode: PresentationSlide) -> void:
  slideNode.finished.disconnect(_on_SlideNode_finished)
  slideNode.hide()


func _finish() -> void:
  emit_signal("finished")


func advance() -> void:
  currentSlide.advance()
  
  
func start() -> void:
  if not get_child_count() > 0:
    await ready
  currentSlide = self.slides[0]
  currentSlide.start()
  _activate_slide(currentSlide)
