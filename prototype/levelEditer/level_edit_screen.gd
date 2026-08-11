extends Node2D


func _ready() -> void:
	$MusicEdit/LoadFile/openMusicFile.file_selected.connect(fileSelected)
	
func fileSelected(path: String):
	var music = load(path)
	$Music.stream = music
	$MusicEdit.musicSetting(music)
	$LevelEdit.musicSetting(music)
