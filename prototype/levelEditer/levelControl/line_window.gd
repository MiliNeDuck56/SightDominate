extends Node2D

func musicSelected(total_seconds):
	for line in $Lines.get_children():
		line.musicSelected(total_seconds)

func itemSelected(value: int):
	for line in $Lines.get_children():
		line.itemSelected(value)
