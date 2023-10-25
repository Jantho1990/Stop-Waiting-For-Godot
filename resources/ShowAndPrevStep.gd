class_name ShowAndPrevStep
extends AutoAdvanceStep


# Runs when the slide moves to the next step.
# Interface function. Must be replaced by inhereting resources.
func next() -> void:
  slide.show()
  
  
# Runs when the slide moves to the previous step.
# Interface function. Must be replaced by inhereting resources.  
func previous() -> void:
  slide.hide()
  previous_requested.emit()
