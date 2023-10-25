class_name SlideStep
extends Resource


@export var animation_duriation : float = 0.5

var slide : PresentationSlide


# Runs when the slide moves to the next step.
# Interface function. Must be replaced by inhereting resources.
func next() -> void:
  pass
  
  
# Runs when the slide moves to the previous step.
# Interface function. Must be replaced by inhereting resources.  
func previous() -> void:
  pass
