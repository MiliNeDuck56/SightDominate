extends Node2D


func _ready() -> void:
	$MusicEdit/LoadFile/openMusicFile.file_selected.connect(fileSelected)
	$MusicEdit/selectGrid/Grid.item_selected.connect(itemSelected)
	itemSelected(4)
	
func fileSelected(path: String):
	var music = load(path)
	$Music.stream = music
	$MusicEdit.musicSetting(music)
	$LevelEdit.musicSetting(music)

func itemSelected(index: int):
	var value = int($MusicEdit/selectGrid/Grid.get_item_text(index))
	$LevelEdit.itemSelected(value)
