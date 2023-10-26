class_name SlideToZeroStep
extends SlideStep


@export var animatedNodePaths : Array[NodePath] : set = _set_animatedNodePaths

var _animatedNodes : Array[Node]
var _old_positions : Dictionary
var _slideTween: Tween


func _set_animatedNodePaths(value: Array) -> void:
  animatedNodePaths = value
  _animatedNodes = []
  _old_positions = {}
  if not slide:
    await slide_set
    await slide.ready
  for animatedNodePath in animatedNodePaths:
    var animatedNode = slide.get_node(animatedNodePath)
    if not animatedNode:
      breakpoint
    _animatedNodes.push_back(slide.get_node(animatedNodePath))
    _old_positions[animatedNode] = animatedNode.position


func _kill_tween() -> void:
  _slideTween.kill()
  _slideTween = null


# Runs when the slide moves to the next step.
# Interface function. Must be replaced by inhereting resources.
func next() -> void:
  if _slideTween:
    _kill_tween()
  
  _slideTween = slide.create_tween().set_parallel(true)
  for animatedNode in _animatedNodes:
    _slideTween.tween_property(animatedNode, "position", Vector2.ZERO, animation_duriation).from(_old_positions[animatedNode])
  
  await _slideTween.finished
  _slideTween = null
  
  
# Runs when the slide moves to the previous step.
# Interface function. Must be replaced by inhereting resources.  
func previous() -> void:
  if _slideTween:
    _kill_tween()
  
  _slideTween = slide.create_tween().set_parallel(true)
  for animatedNode in _animatedNodes:
    _slideTween.tween_property(animatedNode, "position", _old_positions[animatedNode], animation_duriation).from(Vector2.ZERO)
  
  await _slideTween.finished
  _slideTween = null
