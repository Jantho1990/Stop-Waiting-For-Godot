class_name FadeSlideInAndPrevStep
extends AutoAdvanceStep


const FADE_IN_COLOR_BEGIN = Color(1.0, 1.0, 1.0, 0.0)
const FADE_IN_COLOR_END = Color(1.0, 1.0, 1.0, 1.0)

var _slideTween : Tween


func _kill_tween() -> void:
  _slideTween.kill()
  _slideTween = null


func next() -> void:
  slide.show()
  if _slideTween:
    _kill_tween()
  _slideTween = slide.create_tween().set_parallel(true)
  _slideTween.tween_property(slide, "modulate", FADE_IN_COLOR_END, animation_duriation).from(FADE_IN_COLOR_BEGIN)
  await _slideTween.finished
#  print('DBG: next finished %s' % [targetNodes[0].modulate])
  _slideTween = null
  
  
func previous() -> void:
  if _slideTween:
    _kill_tween()
  _slideTween = slide.create_tween().set_parallel(true)
  _slideTween.tween_property(slide, "modulate", FADE_IN_COLOR_BEGIN, animation_duriation).from(FADE_IN_COLOR_END)
  await _slideTween.finished
  _slideTween = null
  previous_requested.emit()
