extends Node2D

var Selected = 0

func _ready() -> void:
	$ItemList.item_selected.connect(func(index) : Selected = index)
	$ItemList.select(Selected)

func getNoteType() -> int:
	return Selected
