extends Node2D

var NOTES

func _ready() -> void:
	NOTES = {4:[],6:[],8:[],12:[],16:[],24:[],32:[],48:[],64:[]}

func itemSelected(value: int):
	print(self)
