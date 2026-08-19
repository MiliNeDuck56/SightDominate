extends Node2D

var ALL_NOTES = {}  # key: row_index(int) -> [[],[]]

func itemSelected(value: int):
	$Grids.itemSelected(value)

func getNotesFor(row_index: int) -> Array:
	if not ALL_NOTES.has(row_index):
		var fresh = [[], []]
		fresh[0].resize(24); fresh[0].fill(null)
		fresh[1].resize(32); fresh[1].fill(null)
		ALL_NOTES[row_index] = fresh
	return ALL_NOTES[row_index]

func musicSelected(total_seconds):
	$Grids.musicSelected(total_seconds)
