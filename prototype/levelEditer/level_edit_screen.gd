extends Node2D


func _ready() -> void:
	$MusicEdit/LoadFile/openMusicFile.file_selected.connect(_on_open_music_file_file_selected)
	
func _on_open_music_file_file_selected(path: String):
	$Music.stream = load(path)
