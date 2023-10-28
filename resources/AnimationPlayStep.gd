class_name AnimationPlayStep
extends SlideStep


@export var animationPlayerPath: NodePath : set = _set_animationPlayerPath
@export var animation_name: String

var _animationPlayer


func _set_animationPlayerPath(value: NodePath) -> void:
  animationPlayerPath = value
  if not slide:
    await slide_set
    await slide.ready
  _animationPlayer = slide.get_node(animationPlayerPath)


# Runs when the slide moves to the next step.
# Interface function. Must be replaced by inhereting resources.
func next() -> void:
  _animationPlayer.play(animation_name)
  
  
# Runs when the slide moves to the previous step.
# Interface function. Must be replaced by inhereting resources.  
func previous() -> void:
  _animationPlayer.play_backwards(animation_name)
