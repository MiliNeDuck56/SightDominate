extends Node2D


func itemSelected(value: int):
	for line in $Lines.get_children():
		line.itemSelected(value)
