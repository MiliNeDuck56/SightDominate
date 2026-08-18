extends Node2D

func itemSelected(value):
	for child in get_children():
		child.removeLines()
		child.addLines(value)
		
